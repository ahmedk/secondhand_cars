class User < ActiveRecord::Base
  attr_accessible :owner_id, :password, :password_confirmation
  belongs_to :owner

  validates :owner, :password, :password_confirmation, :presence => true

  before_save :encrypt_password

  def authenticate(password)
    enc_password = encrypt_password(params[:password])
    if(owner.user.password == enc_password)
      # login user
    else
      return nil
    end
  end

private
  def encrypt_password
    self.password_digest = make_salt if self.new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{password_digest}--#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end
end
