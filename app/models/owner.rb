class Owner < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :phone
  has_one :user

  before save { |owner| owner.email = email.downcase }

  VALID EMAIL REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true,
            format: { with: VALID EMAIL REGEX },
            uniqueness: { case sensitive: false }
  validates_associated :user

  def get_contact
    if !self.mobile.nil?
      return self.mobile
    else
      return self.phone
    end
  end
end
