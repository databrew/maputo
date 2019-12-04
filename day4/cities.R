cities <- readr::read_csv('data/simplemaps-worldcities-basic.csv')
cities_sp <- cities
coordinates(cities_sp) <- ~lng+lat

proj4string(cities_sp) <- proj4string(moz0)
