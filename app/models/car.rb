class Car < ActiveRecord::Base
  attr_accessible :description, :doors, :price, :seats, :year, :owner_id, :car_model_id, :sold
  belongs_to :car_model
  belongs_to :owner
	validates :description, :year, :price, :car_model, :presence => true
	validates :doors, :numericality => { :only_integer => true }, :allow_nil => true
	validates :seats, :numericality => { :only_integer => true }, :allow_nil => true
	validates_associated :owner
  validates :owner, :presence => true

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

  def self.match(criteria)
    criteria = criteria.delete_if {|key, value| value.blank? }
    criteria.delete(:car_models) if criteria[:car_models][:make_id].blank?
    price_from = criteria[:price_from].to_i
    price_to = criteria[:price_to].to_i
    criteria.delete(:price_from)
    criteria.delete(:price_to)
    criteria[:price] = price_from..price_to if price_from > 0 && price_to > 0
    criteria[:price] = price_from..10000000 if price_from > 0 && price_to == 0
    criteria[:price] = 0..price_to if price_from == 0 && price_to > 0
    result = Car.find(:all, :conditions => criteria, :joins => [:car_model])
  end
end
