class Car < ActiveRecord::Base
  attr_accessible :description, :doors, :price, :seats, :year, :owner_id, :car_model_id
  belongs_to :car_model
  belongs_to :owner

  def make_name
    return self.car_model.make_name
  end

  def model_name
    return self.car_model.name
  end

  def owner_name
    return self.owner.name
  end

  def owner_phone
    return self.owner.get_contact
  end
end
