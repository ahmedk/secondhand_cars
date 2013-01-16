class User < ActiveRecord::Base
  attr_accessible :owner_id, :password, :password_confirmation
  belongs_to :owner
  has_secure_password
  validates :password, :password_confirmation, :presence => true

  def name
    return owner.name
  end
end
