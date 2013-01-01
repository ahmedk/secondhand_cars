class Car < ActiveRecord::Base
  attr_accessible :description, :doors, :price, :seats, :year, :owner_id, :car_model_id, :sold
  belongs_to :car_model
  belongs_to :owner
	validates :description, :year, :price, :presence => true
	validates :doors, :numericality => { :only_integer => true }
	validates :seats, :numericality => { :only_integer => true }
	validates_associated :car_model
	validates_associated :owner

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

  def make
  return self.car_model.make_id unless self.car_model.nil?
  end
end
