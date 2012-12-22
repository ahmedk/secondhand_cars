class Owner < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :phone

  def get_contact
    if !self.mobile.nil?
      return self.mobile
    else
      return self.phone
    end
  end
end
