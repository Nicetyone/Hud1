-- Use the following variable(s) to adjust the position.
	-- adjust the x-axis (left/right)
	x = 1.0
	-- adjust the y-axis (top/bottom)
	y = 1.0
-- If you do not see the HUD after restarting script you adjusted the x/y axis too far.
	
-- Use the following variable(s) to adjust the color(s) of each element.
	-- Use the following variables to adjust the color of the border around direction.
	border_r = 255
	border_g = 255
	border_b = 255
	border_a = 100
	
	-- Use the following variables to adjust the color of the direction user is facing.
	dir_r = 255
	dir_g = 255
	dir_b = 255
	dir_a = 255
	
	-- Use the following variables to adjust the color of the street user is currently on.
	curr_street_r = 240
	curr_street_g = 200
	curr_street_b = 80
	curr_street_a = 255
	
	-- Use the following variables to adjust the color of the street around the player. (this will also change the town the user is in)
	str_around_r = 255
	str_around_g = 255 
	str_around_b = 255
	str_around_a = 255
	
	-- Use the following variables to adjust the color of the city the player is in (without there being a street around them)
	town_r = 255
	town_g = 255
	town_b = 255
	town_a = 255


function drawTxt2(x,y ,width,height,scale, text, r,g,b,a)
	scale = scale / 1.3
	x = x - 0.16
	y = y - 0.185
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(scale, scale)
   SetTextColour(192, 192, 192, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawTxt3(x,y ,width,height,scale, text, r,g,b,a)
	scale = scale / 1.3
	x = x - 0.16
	y = y - 0.185
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(scale, scale)
   SetTextColour(11, 160, 204, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


local zones = { ['AIRP'] = "Los Santos International Airport", ['ALAMO'] = "Alamo Sea", ['ALTA'] = "Alta", ['ARMYB'] = "Fort Zancudo", ['BANHAMC'] = "Banham Canyon Dr", ['BANNING'] = "Banning", ['BEACH'] = "Vespucci Beach", ['BHAMCA'] = "Banham Canyon", ['BRADP'] = "Braddock Pass", ['BRADT'] = "Braddock Tunnel", ['BURTON'] = "Burton", ['CALAFB'] = "Calafia Bridge", ['CANNY'] = "Raton Canyon", ['CCREAK'] = "Cassidy Creek", ['CHAMH'] = "Chamberlain Hills", ['CHIL'] = "Vinewood Hills", ['CHU'] = "Chumash", ['CMSW'] = "Chiliad Mountain State Wilderness", ['CYPRE'] = "Cypress Flats", ['DAVIS'] = "Davis", ['DELBE'] = "Del Perro Beach", ['DELPE'] = "Del Perro", ['DELSOL'] = "La Puerta", ['DESRT'] = "Grand Senora Desert", ['DOWNT'] = "Downtown", ['DTVINE'] = "Downtown Vinewood", ['EAST_V'] = "East Vinewood", ['EBURO'] = "El Burro Heights", ['ELGORL'] = "El Gordo Lighthouse", ['ELYSIAN'] = "Elysian Island", ['GALFISH'] = "Galilee", ['GOLF'] = "GWC and Golfing Society", ['GRAPES'] = "Grapeseed", ['GREATC'] = "Great Chaparral", ['HARMO'] = "Harmony", ['HAWICK'] = "Hawick", ['HORS'] = "Vinewood Racetrack", ['HUMLAB'] = "Humane Labs and Research", ['JAIL'] = "Bolingbroke Penitentiary", ['KOREAT'] = "Little Seoul", ['LACT'] = "Land Act Reservoir", ['LAGO'] = "Lago Zancudo", ['LDAM'] = "Land Act Dam", ['LEGSQU'] = "Legion Square", ['LMESA'] = "La Mesa", ['LOSPUER'] = "La Puerta", ['MIRR'] = "Mirror Park", ['MORN'] = "Morningwood", ['MOVIE'] = "Richards Majestic", ['MTCHIL'] = "Mount Chiliad", ['MTGORDO'] = "Mount Gordo", ['MTJOSE'] = "Mount Josiah", ['MURRI'] = "Murrieta Heights", ['NCHU'] = "North Chumash", ['NOOSE'] = "N.O.O.S.E", ['OCEANA'] = "Pacific Ocean", ['PALCOV'] = "Paleto Cove", ['PALETO'] = "Paleto Bay", ['PALFOR'] = "Paleto Forest", ['PALHIGH'] = "Palomino Highlands", ['PALMPOW'] = "Palmer-Taylor Power Station", ['PBLUFF'] = "Pacific Bluffs", ['PBOX'] = "Pillbox Hill", ['PROCOB'] = "Procopio Beach", ['RANCHO'] = "Rancho", ['RGLEN'] = "Richman Glen", ['RICHM'] = "Richman", ['ROCKF'] = "Rockford Hills", ['RTRAK'] = "Redwood Lights Track", ['SANAND'] = "San Andreas", ['SANCHIA'] = "San Chianski Mountain Range", ['SANDY'] = "Sandy Shores", ['SKID'] = "Mission Row", ['SLAB'] = "Stab City", ['STAD'] = "Maze Bank Arena", ['STRAW'] = "Strawberry", ['TATAMO'] = "Tataviam Mountains", ['TERMINA'] = "Terminal", ['TEXTI'] = "Textile City", ['TONGVAH'] = "Tongva Hills", ['TONGVAV'] = "Tongva Valley", ['VCANA'] = "Vespucci Canals", ['VESP'] = "Vespucci", ['VINE'] = "Vinewood", ['WINDF'] = "Ron Alternates Wind Farm", ['WVINE'] = "West Vinewood", ['ZANCUDO'] = "Zancudo River", ['ZP_ORT'] = "Port of South Los Santos", ['ZQ_UAR'] = "Davis Quartz" }
local directions = { [0] = 'N', [45] = 'NW', [90] = 'W', [135] = 'SW', [180] = 'S', [225] = 'SE', [270] = 'E', [315] = 'NE', [360] = 'N', } 

local Oczekiwanie = 11

local currentZoneData = {}
local currentZoneData2 = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		if IsPedInAnyVehicle(PlayerPedId()) then
			local pos = GetEntityCoords(PlayerPedId())
			local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			local current_zone = zones[GetNameOfZone(pos.x, pos.y, pos.z)]
			if GetStreetNameFromHashKey(var1) and GetNameOfZone(pos.x, pos.y, pos.z) then
				if zones[GetNameOfZone(pos.x, pos.y, pos.z)] and tostring(GetStreetNameFromHashKey(var1)) then
					if tostring(GetStreetNameFromHashKey(var2)) == "" then
						currentZoneData = {
							x = x - 0.325,
							y = y + 0.465,
							width = 1.0,
							height = 1.0,
							scale = 0.4,
							text = current_zone,
							r = town_r,
							g = town_g,
							b = town_b,
							a = town_a
						}
					else 
						currentZoneData = {
							x = x - 0.325,
							y = y + 0.465,
							width = 1.0,
							height = 1.0,
							scale = 0.4,
							text = tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)],
							r = str_around_r,
							g = str_around_g,
							b = str_around_b,
							a = str_around_a
						}
					end
					currentZoneData2 = {
						x = x - 0.325,
						y = y + 0.445,
						width = 1.0,
						height = 1.0,
						scale = 0.5,
						text = tostring(GetStreetNameFromHashKey(var1)),
						r = curr_street_g,
						g = str_around_g,
						b = str_around_b,
						a = str_around_a
					}
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		if IsPedInAnyVehicle(PlayerPedId()) and currentZoneData.x ~= nil then
			drawTxt2(currentZoneData.x, currentZoneData.y, currentZoneData.width, currentZoneData.height, currentZoneData.scale, currentZoneData.text, currentZoneData.r, currentZoneData.g, currentZoneData.b, currentZoneData.a)
			drawTxt3(currentZoneData2.x, currentZoneData2.y, currentZoneData2.width, currentZoneData2.height, currentZoneData2.scale, currentZoneData2.text, currentZoneData2.r, currentZoneData2.g, currentZoneData2.b, currentZoneData2.a)
		else
			Citizen.Wait(500)
		end
	end
end)




function N()

							drawTxt(x-0.155, y+0.542, 1.0,1.2,0.4, direction, dir_r, dir_g, dir_b, dir_a)
						if tostring(GetStreetNameFromHashKey(var2)) == "" then
							drawTxt(x-0.285, y+0.445, 1.0,1.0,0.34, current_zone, town_r, town_g, town_b, town_a)
						else 
							drawTxt(x-0.285, y+0.445, 1.0,1.0,0.34, tostring(GetStreetNameFromHashKey(var2)) .. ", " .. zones[GetNameOfZone(pos.x, pos.y, pos.z)], str_around_r, str_around_g, str_around_b, str_around_a)
						end
							drawTxt2(x-0.285, y+0.42, 1.0,1.0,0.42, tostring(GetStreetNameFromHashKey(var1)), curr_street_r, curr_street_g, curr_street_b, curr_street_a)

end

