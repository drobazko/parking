class ParkingPlace
  attr_reader :type

  def park(car)
    @car = car
  end

  def free?
    @car.nil?
  end

  def free_for?(car)
    raise 'Define method'
  end
end