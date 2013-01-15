class User < ActiveRecord::Base
  attr_accessible :owner_id, :password, :password_confirmation, :name
  belongs_to :owner
  has_secure_password
  validates :owner, :password, :password_confirmation, :presence => true
end
