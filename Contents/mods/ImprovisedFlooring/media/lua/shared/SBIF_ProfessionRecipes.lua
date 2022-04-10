
-- On Player Load, check their professions and if it matches
-- one we're expecting, add some free recipes to their character
function AddRecipesToExistingPlayers(id, player)
    local profession = player:getDescriptor():getProfession();

    -- Adjust Carpenters with Wood Flooring by default
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

-- Character loads into the world
Events.OnCreatePlayer.Add(AddRecipesToExistingPlayers);
