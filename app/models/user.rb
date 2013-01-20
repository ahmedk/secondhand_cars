class User < ActiveRecord::Base
  attr_accessible :owner_id, :password, :password_confirmation
  belongs_to :owner
  has_secure_password
  validates :owner_id, :presence => true
  validates :password, :password_confirmation, :presence => true, :on => :create

  def name
    return owner.name
  end
end
