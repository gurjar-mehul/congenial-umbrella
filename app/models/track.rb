class Track < ApplicationRecord
  SURFACE_TYPE = { snow: 15, gravel: 35, asphalt: 0 }
  DRIVING_TIME = { 540...1079 => 0, 1080...1289 => 8, 1290...1439 => 15,
                   0...359 => 15, 360...539 => 8 }

  def max_speed(car)
    res = car.max_speed.to_f -
          slowing_factor_surface(car).to_f -
          slowing_factor_current_driving_time.to_f
    "#{res}km/h"
  end

  private

  def slowing_factor_surface(car)
    surface_percentage = SURFACE_TYPE[surface_type.to_sym].to_f
    car.max_speed.to_f - (car.max_speed.to_f * ((100 - surface_percentage.to_f) / 100))
  end

  def slowing_factor_current_driving_time
    factor = DRIVING_TIME.select { |time| time === hours_to_minutes(time_of_the_day) }
    factor.values[0]
  end

  def time_of_the_day
    ct = Time.now.in_time_zone(timezone)
    ct.strftime("%H:%m")
  end

  def hours_to_minutes(time)
    hour = time.split(":")[0].to_i
    minutes = time.split(":")[1].to_i
    hour * 60 + minutes
  end
end
