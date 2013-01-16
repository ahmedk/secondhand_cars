class Owner < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :phone
  has_one :user

  before_save { |owner| owner.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, :mobile, presence: true
  validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates_associated :user

  def get_contact
    if !self.mobile.nil?
      return self.mobile
    else
      return self.phone
    end
  end
end
