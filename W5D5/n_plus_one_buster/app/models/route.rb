class Route < ApplicationRecord
  has_many :buses,
    class_name: 'Bus',
    foreign_key: :route_id,
    primary_key: :id

  def n_plus_one_drivers
    buses = self.buses

    all_drivers = {}
    buses.each do |bus|
      drivers = []
      bus.drivers.each do |driver|
        drivers << driver.name
      end
      all_drivers[bus.id] = drivers
    end

    all_drivers
  end

  def better_drivers_query
    # TODO: your code here
    buses = self.buses.includes(:drivers)
    buses_drivers_hash = Hash.new { |hash, key| hash[key] = Array.new }
    buses.each do |bus|
      buses_drivers_hash[bus.id] += bus.drivers.map(&:name)
    end
    buses_drivers_hash
  end
end
