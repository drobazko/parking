class ParkingHandler
  attr_accessor :places

  def initialize(args)
    @places = [] 
    @places += Array.new(args[:sedan_number]) { ParkingPlaceForSedan.new }
    @places += Array.new(args[:disabled_number]) { ParkingPlaceForDisabled.new }
    @places += Array.new(args[:truck_number]) { ParkingPlaceForTruck.new }
  end

  def park(car)
    index = free_place_index(car)
    raise 'No free parking places for your car found' unless index
    @places[index].park(car)
  end

  def number_of_free(type)
    @places.select{|p| p.free? && p.type == type}.size
  end

  def places_by_type(type)
    @places.select{|p| p.type == type}
  end

  private

  def free_place_index(car)
    @places.each_index.select{|i| @places[i].free_for?(car)}.first
  end
end