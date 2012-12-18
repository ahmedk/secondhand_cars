class Owner < ActiveRecord::Base
  attr_accessible :email, :mobile, :name, :phone
end
