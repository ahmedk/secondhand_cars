class CarModel < ActiveRecord::Base
  attr_accessible :name, :make_id
  belongs_to :make

  def make_name
    return self.make.name
  end
end
