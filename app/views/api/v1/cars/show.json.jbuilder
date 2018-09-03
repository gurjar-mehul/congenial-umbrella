json.data do
  json.car do
    json.id @car.id
    json.car_slug @car.slug
    json.max_speed "#{@car.max_speed}km/h"
    json.max_speed_on_track @track ? @track.max_speed(@car) : 'no track selected'
  end
end
