local sizes =    {_('---'), '75', '150', '300', '450', '600' }
local radiuses = {0, 75, 150, 300, 450, 600}

function data()
	return {
		info = {
			minorVersion = 1,
			severityAdd = "NONE",
			severityRemove = "NONE",
			name = _("modName"),
			description = _("modDescription"),
			tags = { "Script Mod" },
			authors = {
				{
					name = "Konrad2023",
					role = 'CREATOR',
				},
			},
			params = {
				{
					key = "findStationRadius",
					name = _("findStationRadius"),
					tooltip = _("findStationRadiusTT"),
					uiType = "SLIDER",
					values = sizes,
					defaultIndex = 2,
				},
				{
					key = "findIndustryRadius",
					name = _("findIndustryRadius"),
					tooltip = _("findIndustryRadiusTT"),
					uiType = "SLIDER",
					values = sizes,
					defaultIndex = 3,
				},
                {
                    key = "stripCityNamesOnStreetStations",
                    name = _("stripCityNamesOnStreetStations"),
                    uiType = "CHECKBOX",
                    values = { "0", "1", },
                    tooltip = _("stripCityNamesOnStreetStationsTT"),
                    defaultIndex = 1,
                },
			}
		},
		runFn = function (settings, modParams)
			local params = modParams[getCurrentModId()]
			game.modSmartStationNamingSettings = {
				stripCityNamesOnStreetStations = params.stripCityNamesOnStreetStations == 1,
				findIndustryRadius = radiuses[params.findIndustryRadius + 1],
				findStationRadius = radiuses[params.findStationRadius + 1],
			}
		end
	}
end
