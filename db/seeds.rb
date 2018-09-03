Car.delete_all
car_attrs = [ { name: "Ford Figo", max_speed: 180 },
              { name: "Honda Jazz", max_speed: 110 },
              { name: "Toyota Innova", max_speed: 220 } ]
Car.create car_attrs

Track.delete_all
track_attrs = [
  { country: "Germany", name: "nurburgring", timezone: "CET", surface_type: "asphalt" },
  { country: "Australia", name: "sydney_motorsport_park", timezone: "Australia/Sydney",
    surface_type: "gravel" },
  { country: "Canada", name: "circuit_gilles_villenaeuve_montreal",
    timezone: "America/Montreal", surface_type: "snow" },
  { country: "Macau", name: "guia_circut", timezone: "Asia/Macau", surface_type: "asphalt" }
]
Track.create track_attrs
