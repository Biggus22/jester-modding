local Class = require('base.Class')
local Behavior = require('base.Behavior')
require('base.Interactions')

local ArrivalDepartureFlightPlanning = Class(Behavior)
ArrivalDepartureFlightPlanning.is_registered = false

function ArrivalDepartureFlightPlanning:Constructor()
	Behavior.Constructor(self)
end

function ArrivalDepartureFlightPlanning:Register()
	local event_name = "arrival_departure_flight_planning"

	ListenTo(event_name, "ArrivalDepartureFlightPlanning", function(task)
		Log("Arrival/Departure flight planning hook triggered")
		task:CantDo()
	end)

	local location = {"Navigation"}
	local item = Wheel.Item:new({
		name = "Arrival/Departure Planning",
		action = event_name,
		reaction = Wheel.Reaction.CLOSE_REMEMBER,
	})
	Wheel.AddItem(item, location)
end

function ArrivalDepartureFlightPlanning:Tick()
	if self.is_registered then
		return
	end

	self:Register()
	self.is_registered = true
end

ArrivalDepartureFlightPlanning:Seal()
return ArrivalDepartureFlightPlanning
