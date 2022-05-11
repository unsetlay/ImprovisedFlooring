
-- On Player Load, check their professions and if it matches
-- one we're expecting, add some free recipes to their character
function AddRecipesToExistingPlayers(id, player)
    local profession = player:getDescriptor():getProfession();

    -- Construction Worker should know Urban stuff
    if profession == "constructionworker" then
        player:learnRecipe("UrbanSidewalk1");
        player:learnRecipe("UrbanSidewalk1");
        player:learnRecipe("UrbanSidewalk2");
        player:learnRecipe("UrbanSidewalk3");
        player:learnRecipe("UrbanSidewalk4");
        player:learnRecipe("UrbanRoad1");
        player:learnRecipe("UrbanRoad2");
        player:learnRecipe("UrbanRoad3");
        player:learnRecipe("UrbanRoad4");
        player:learnRecipe("UrbanRoad5");
        player:learnRecipe("UrbanRoad6");
        player:learnRecipe("UrbanRoad7");
        player:learnRecipe("UrbanRoad8");
    end

    -- Farmer knows about Gardening Recipes
    if profession == "farmer" then
        player:learnRecipe("GardenPaverColorful");
        player:learnRecipe("GardenPaverGrey");
        player:learnRecipe("GardenPaverRed");
        player:learnRecipe("GardenFakeGrass");
    end

    -- Repair Man should know Generic Industrial Recipes
    if profession == "repairman" then
        player:learnRecipe("SpecialBarFloor");
        player:learnRecipe("SpecialDinerFloor");
        player:learnRecipe("SpecialDinerFloorGreen");
        player:learnRecipe("SpecialMallTileGrey");
        player:learnRecipe("SpecialMallTileN");
        player:learnRecipe("SpecialMallTileW");
        player:learnRecipe("SpecialMallTileWhite");
        player:learnRecipe("SpecialMotelTile");
        player:learnRecipe("SpecialPieStoreFloor");
        player:learnRecipe("SpecialBowlingFloor");
    end

    -- If you are unemployed and illiterate: Easter Egg!
    if profession == "unemployed" then
        if player:getTraits():isIlliterate() then
            player:learnRecipe("EasterEggNostalgiaIlliterate")
        end
    end

end

-- Character loads into the world
Events.OnCreatePlayer.Add(AddRecipesToExistingPlayers);
