class Car < ActiveRecord::Base
  attr_accessible :description, :doors, :price, :seats, :year
end
