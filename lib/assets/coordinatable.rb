module Coordinatable

  def coordinates
    Destination.new(@location)
  end
end
