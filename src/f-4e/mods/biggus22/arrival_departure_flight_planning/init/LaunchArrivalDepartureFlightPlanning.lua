local ArrivalDepartureFlightPlanning = require 'ArrivalDepartureFlightPlanning'

mod_init[#mod_init+1] = function(jester)
	jester.behaviors[ArrivalDepartureFlightPlanning] = ArrivalDepartureFlightPlanning:new()
end
