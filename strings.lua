function data()
return {
	en = {
		["modName"] = "Smart station naming",
		["modDescription"] = "This mod tries to improve the naming of newly created stations and street stops.\n\n" ..
			"1. If a station/stop is placed close to an existing station, it will get the same name as the existing station.\n"..
			"2. Otherwise, if it is placed close to an industry, it will get the name of the industry.\n"..
			"3. For street stops, city names can automatically be removed.\n\n"..
			"The functionality is configurable. Search areas can be adjusted to your preference, or you could for instance disable the search for existing stations and only use the auto-naming for industries.\n\n"..
			"The industry catchment area sizes seem to cover a distance of approximately 400. When searching for existing stations, only actual buildings are considered, not street stops.",
		["findIndustryRadius"] = "Maximum distance to find industries",
		["findIndustryRadiusTT"] = "Recommended: 300 or 450",
		["findStationRadius"] = "Maximum distance to find station buildings",
		["findStationRadiusTT"] = "Recommended: 75 or 150",
		["stripCityNamesOnStreetStations"] = "Remove city names from street stops",
		["stripCityNamesOnStreetStationsTT"] = "Applies only to bus/tram/unload stops.",
		["---"] = "off",
	},
	de = {
		["modName"] = "Smarte Haltestellenbenennung",
		["modDescription"] = "Diese Mod versucht die Benennung von neu erstellten Stationen und Haltestellen zu verbessern.\n\n" ..
			"1. Wenn eine Station/Haltestelle nahe einer vorhandenenen Station platziert wird, erhält sie den gleichen Namen wie diese.\n"..
			"2. Andernfalls, und wenn sie nahe einer Industrie platziert wird, erhält sie deren Namen.\n"..
			"3. Bei Straßenhalten kann der Stadtname automatisch entfernt werden.\n\n"..
			"Die Funktionalität ist konfigurierbar. Suchradien können nach Deinen Vorlieben angepasst werden, oder Du kannst z.B. die Suche nach vorhandenen Stationen abschalten und nur die Auto-Benennung nach Industrien verwenden.\n\n"..
			"Die Einzugsgebiete der Indutrien scheinen Distanzen von etwa 400 abzudecken. Bei der Suche nach vorhandenen Stationen werden nur Gebäude berücksichtigt, nicht aber Straßenhalte.",
		["findIndustryRadius"] = "Maximaldistanz um Industrien zu finden",
		["findIndustryRadiusTT"] = "Empfohlen: 300 oder 450",
		["findStationRadius"] = "Maximaldistanz um Stationen zu finden",
		["findStationRadiusTT"] = "Empfohlen: 75 oder 150",
		["stripCityNamesOnStreetStations"] = "Stadtnamen bei Straßenhalten entfernen",
		["stripCityNamesOnStreetStationsTT"] = "Gilt nur für Bus-/Tram-/Entladestellen.",
		["---"] = "aus",
	},
	fr = {
		["modName"] = "Nommage intelligent des stations",
		["modDescription"] = "Cette mod essaye d'améliorer le nommage des stations et arrêts nouvellement placés.\n\n" ..
			"1. Si une station (ou un arrêt) est placée en proximité d'une station existante, elle recevra le même nom que celle-ci.\n"..
			"2. Sinon, si elle est placée près d'une industrie, elle reçoit le nom de l'industrie.\n"..
			"3. Pour les arrêts de rue, le nom de la ville peut automatiquement être supprimé.\n\n"..
			"La fonctionnalité est configurable. Les périmètres de recherche peuvent être adaptés selon tes préférences, ou tu peux par exemple désactiver la recherche des stations, et utiliser uniquement le nommage automatique pour les industries.\n\n"..
			"Les zones de chalandise des industries semblent couvrir une distance d'environ 400. Lors d'une recherche de stations, les arrêts de rue ne sont pas considérés, mais seulement les bâtiments.",
		["findIndustryRadius"] = "Distance maximale pour trouver les industries",
		["findIndustryRadiusTT"] = "Recommandation: 300 ou 450",
		["findStationRadius"] = "Distance maximale pour trouver les stations",
		["findStationRadiusTT"] = "Recommandation: 75 ou 150",
		["stripCityNamesOnStreetStations"] = "Supprimer les noms de ville",
		["stripCityNamesOnStreetStationsTT"] = "Applicable uniquement aux arrêts de bus/tram/déchargement.",
		["---"] = "désact.",
	},
	zh_TW = {
		["modName"] = "智能車站命名",
		["modDescription"] = "此模組主要目的是為了最佳化新建車站時自動產生的車站名稱\n\n" ..
			"1. 如果在已建車站附近放置新車站/停靠點，站名會與已建車站名稱相同。\n"..
			"2. 除此之外，將新車站放置在產業旁邊，站名亦會與產業名稱相同。\n"..
			"3. 對於在城市中的停靠點，可啟用自動移除城市名稱前綴功能。\n\n"..
			"命名功能可透過設定調整。例如產業與車站的搜尋半徑、只啟用產業自動命名等…\n\n"..
			"附近產業的預設搜尋範圍約為 400 單位；在尋找附近的車站時只會搜尋帶建築物的車站，而忽略已建停靠點。",
		["findIndustryRadius"] = "最大附近產業搜尋半徑",
		["findIndustryRadiusTT"] = "建議: 300 or 450",
		["findStationRadius"] = "最大附近車站搜尋半徑",
		["findStationRadiusTT"] = "建議: 75 or 150",
		["stripCityNamesOnStreetStations"] = "移除停靠點的城市名稱前綴",
		["stripCityNamesOnStreetStationsTT"] = "只會套用於公車/電車/卸貨點。",
		["---"] = "停用",
	}
}
end
