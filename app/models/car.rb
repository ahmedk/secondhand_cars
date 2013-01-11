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
    result = Car.all
    search.each do |key, value|
      reault = result.find("#{key} = #{value}") unless (value.nil? || value != '')
    end
    #if(search[:car_model] && search[:car_model] != '')
    #  result = result.find(:car_model_id => search[:car_model])
    #elsif(search[:make] && search[:make] != '')
    #  result = result.find(:make_name => search[:make_name])
    #end
  end
end
