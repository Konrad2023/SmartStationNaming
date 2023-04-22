local settings = game.modSmartStationNamingSettings

local function calculateDistance(ent1, ent2)
	local xd = ent1.position[1] - ent2.position[1]
	local yd = ent1.position[2] - ent2.position[2]
	return math.sqrt(xd * xd + yd * yd)
end

local function findStationGroup(entityId)
	local entity = game.interface.getEntity(entityId)
	if entity.type == 'STATION_GROUP' then
		return entity
	end
	if entity.type == 'STATION' then
		return game.interface.getEntity(entity.stationGroup)
	end
	if entity.type == 'CONSTRUCTION' then
		return findStationGroup(entity.stations[1])
	end
	return nil
end

local function findClosestEntity(fromEntity, entityType, maxDistance, filterFunction)
	local closest = nil
	local closestDistance = nil
	for _,entity in pairs(game.interface.getEntities({pos = fromEntity.position, radius = 2000 }, {type = entityType, includeData = true})) do
		local relevant = entity.id ~= fromEntity.id
		if relevant and filterFunction ~= nil then
			relevant = filterFunction(entity)
		end
		if relevant then
			local distance = calculateDistance(fromEntity, entity)
			if distance <= maxDistance then
				if closestDistance == nil or closestDistance > distance then
					closestDistance = distance
					closest = entity
				end
			end
		end
	end
	return closest
end

local function findClosestIndustry(fromEntity)
	return findClosestEntity(fromEntity, 'SIM_BUILDING', settings.findIndustryRadius, nil)
end

local function isStation(entity)
	if entity.type == 'CONSTRUCTION' then
		return entity.fileName:match('^station/') and entity.stations ~= nil
	end
	return entity.type == 'STATION'
end


local function findClosestConstructionStationGroup(fromEntity)
	local construction = findClosestEntity(fromEntity, 'CONSTRUCTION', settings.findStationRadius, isStation)
	if construction ~= nil then
		return findStationGroup(construction.stations[1])
	end
	return nil
end

local function renameStationAndGroup(station, group, proposedName, stripCityName)
	if #group.stations == 1 then
		-- Only rename group if it's new, i.e., has one station.
		-- Otherwise we could overwrite potential name changes by the player e.g. when adding a second bus stop.
		local finalName = proposedName

		if stripCityName then
			local townNames = {}
			for _, id in pairs(game.interface.getTowns()) do
				table.insert(townNames, game.interface.getEntity(id).name)
			end
			-- Longest names first
			table.sort(townNames, function(a,b) return #a>#b end)

			local done = false
			for _,town in pairs(townNames) do
				if not done then
					if string.sub(proposedName, 1, #town) == town then
						done = true
						-- Only strip if the name is actually "town " + something.
						-- Otherwise, we could end up with an empty name.
						local prefix = town .. ' '
						if #proposedName > #prefix and string.sub(proposedName, 1, #prefix) == prefix then
							finalName = string.sub(proposedName, #prefix + 1)
						end
					end
				end
			end
		end

		game.interface.setName(group.id, finalName)
		group.name = finalName
	end
	-- For good measure, name all stations the same as the group.
	for i = 1,#group.stations do
		game.interface.setName(group.stations[1], group.name)
	end
	-- For constructions, this is required; for stations, it's just redundant.
	game.interface.setName(station.id, group.name)
end

local function handleEvent(src, id, name, param)
	if id == "station_placed" then
		local station = game.interface.getEntity(param.entityId)
		local stationGroup = findStationGroup(station.id)
		if stationGroup ~= nil then
			local reference = findClosestConstructionStationGroup(station)
			if reference == nil then
				reference = findClosestIndustry(station)
			end
			if reference ~= nil then
				local isStreetStop = station.type == 'STATION'
				renameStationAndGroup(station, stationGroup, reference.name, isStreetStop and settings.stripCityNamesOnStreetStations)
			end
		end
	end
end

local function guiHandleEvent(builder, event, param)
	if event == 'builder.apply' then
		local stationId = nil
		if builder == "streetTerminalBuilder" then
			stationId = param.proposal.proposal.edgeObjectsToAdd[1].resultEntity
		else
			if builder == "constructionBuilder" then
				stationId = param.result[1]
			end
		end
		if stationId ~= nil and isStation(game.interface.getEntity(stationId)) then
			game.interface.sendScriptEvent("station_placed", "", {entityId=stationId})
		end
	end
end

function data()
	return {
		guiHandleEvent = guiHandleEvent,
		handleEvent = handleEvent,
	}
end
