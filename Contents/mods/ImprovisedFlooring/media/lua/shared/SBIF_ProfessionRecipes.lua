require("MainCreationMethods");
require('NPCs/MainCreationMethods');

-- CHARACTER CREATION
--  Carpenter should learn wooden flooring
BaseGameCharacterDetails.DoProfessions = function()
    local carpenter = ProfessionFactory.addProfession("carpenter", getText("UI_prof_Carpenter"), "profession_hammer2", 2);
    carpenter:addXPBoost(Perks.Woodwork, 3)
	carpenter:addXPBoost(Perks.SmallBlunt, 1)
    carpenter:getFreeRecipes():add("WoodAcaciaFloor");
    carpenter:getFreeRecipes():add("WoodBirchwoodFloor");
    carpenter:getFreeRecipes():add("WoodBirchwoodFloorTiles");
    carpenter:getFreeRecipes():add("WoodChestnutNorthFloor");
    carpenter:getFreeRecipes():add("WoodChestnutWestFloor");
    carpenter:getFreeRecipes():add("WoodCinnamonFloor");
    carpenter:getFreeRecipes():add("WoodCinnamonNorthFloor");
    carpenter:getFreeRecipes():add("WoodCinnamonWestFloor");
    carpenter:getFreeRecipes():add("WoodFinewoodFloor");
    carpenter:getFreeRecipes():add("WoodHardwoodFloor");
    carpenter:getFreeRecipes():add("WoodHardwoodFloorTiles");
    carpenter:getFreeRecipes():add("WoodOakwoodFloor");
    carpenter:getFreeRecipes():add("WoodPinewoodFloorTiles");

    local profList = ProfessionFactory.getProfessions()
	for i=1,profList:size() do
		local prof = profList:get(i-1)
		BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

-- EXISTING CHARACTER (Maybe added to an existing world)
--  If Carpenter make sure they know wooden flooring
function AddRecipesToExistingPlayers(id, player)
    local profession = player:getDescriptor():getProfession();
    if profession == "carpenter" then
        player:learnRecipe("WoodAcaciaFloor");
        player:learnRecipe("WoodBirchwoodFloor");
        player:learnRecipe("WoodBirchwoodFloorTiles");
        player:learnRecipe("WoodChestnutNorthFloor");
        player:learnRecipe("WoodChestnutWestFloor");
        player:learnRecipe("WoodCinnamonFloor");
        player:learnRecipe("WoodCinnamonNorthFloor");
        player:learnRecipe("WoodCinnamonWestFloor");
        player:learnRecipe("WoodFinewoodFloor");
        player:learnRecipe("WoodHardwoodFloor");
        player:learnRecipe("WoodHardwoodFloorTiles");
        player:learnRecipe("WoodOakwoodFloor");
        player:learnRecipe("WoodPinewoodFloorTiles");
    end   
end

-- Update the Profession Description with our changes to Carpentry
function BaseGameCharacterDetails.SetProfessionDescription(prof)
	local desc = getTextOrNull("UI_profdesc_" .. prof:getType()) or ""
	local boost = transformIntoKahluaTable(prof:getXPBoostMap())
	local infoList = {}
	for perk,level in pairs(boost) do
		local perkName = PerkFactory.getPerkName(perk)
		-- "+1 Cooking" etc
		local levelStr = tostring(level:intValue())
		if level:intValue() > 0 then levelStr = "+" .. levelStr end
		table.insert(infoList, { perkName = perkName, levelStr = levelStr })
	end
	table.sort(infoList, function(a,b) return not string.sort(a.perkName, b.perkName) end)
	for _,info in ipairs(infoList) do
		if desc ~= "" then desc = desc .. "\n" end
		desc = desc .. info.levelStr .. " " .. info.perkName
	end
	local traits = prof:getFreeTraits()
	for j=1,traits:size() do
		if desc ~= "" then desc = desc .. "\n" end
		local traitName = traits:get(j-1)
		local trait = TraitFactory.getTrait(traitName)
		desc = desc .. trait:getLabel()
	end
	prof:setDescription(desc)
end

Events.OnGameBoot.Add(BaseGameCharacterDetails.DoProfessions);
Events.OnCreatePlayer.Add(AddRecipesToExistingPlayers)