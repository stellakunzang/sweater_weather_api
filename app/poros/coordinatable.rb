module Coordinatable

  def destination_coordinates
    Destination.new(@location)
  end

end
