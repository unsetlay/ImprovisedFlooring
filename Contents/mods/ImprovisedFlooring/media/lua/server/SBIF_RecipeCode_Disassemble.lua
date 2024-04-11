-- Used by scripts/SBIF_Recipes_Disassemble.txt

-- ----------------------------------------------- --
-- -- LOGIC FOR DISASSEMBLING AND GENERATING LOOT  --
-- ----------------------------------------------- --
--  Required    Object      Player
--                          The player who's inventory we'll manipulate
--  Required    Object      Perk.name
--                          Which perk should be considered when determining bonus
--  Required    String      An item ID to generate as a bonus
--  Required    Integer     Random Max of bonus items to spawn
-- ----------------------------------------------- --
--  Example Usage:
--      SBIFDisassembleFlooring(player, Perk.Woodwork, "Base.Planks", 10)
--          Use the Player's woodworking skill to determine if they get a bonus item
--          If they get a bonus item, give the player between 1-10 Planks
-- ----------------------------------------------- --
function SBIFDisassembleFlooring(oPlayer, oSkill, sSuccessItem, iSuccessItemMax)
    local inventory = oPlayer:getInventory()

    -- Determine your skill and luck at succeeding (Carp 6*16 = Almost 100%)
    local chance = oPlayer:getPerkLevel(oSkill) * 16.6
    print(chance)
    if oPlayer:HasTrait("Lucky") then
        chance = chance * 1.1
    end
    if oPlayer:HasTrait("Unlucky") then
        chance = chance * 0.9
    end

    -- Now determine your reward
    if (chance >= 100) or (ZombRand(1, 100) <= chance) then
        -- Success! Here's your item and some minor XP
        inventory:AddItems(sSuccessItem, ZombRand(1, iSuccessItemMax))
        oPlayer:getXp():AddXP(oSkill, (chance/10));
    end
end

-- ----------------------------------------------- --
-- -- RECIPE FUNCTIONS --------------------------- --
-- ----------------------------------------------- --
function Recipe.OnCreate.SBIFDisassembleBrandedCarpets(items, result, player)
    SBIFDisassembleFlooring(player, Perks.Tailoring, "Base.RippedSheets", 8);
    result:setUsedDelta(0.1);       -- Thread
end
function Recipe.OnCreate.SBIFDisassembleBrandedFloors(items, result, player)
    SBIFDisassembleFlooring(player, Perks.Woodwork, "Base.Plank", 2);
end
function Recipe.OnCreate.SBIFDisassembleCarpets(items, result, player)
    SBIFDisassembleFlooring(player, Perks.Tailoring, "Base.RippedSheets", 4);
    result:setUsedDelta(0.1);       -- Thread
end
function Recipe.OnCreate.SBIFDisassembleIndustrial(items, result, player)
    SBIFDisassembleFlooring(player, Perks.Woodwork,  "Base.Plank", 2);
end
function Recipe.OnCreate.SBIFDisassembleMetworkingPipes(items, result, player)
    SBIFDisassembleFlooring(player, Perks.MetalWelding, "Base.MetalPipe", 3);
end
function Recipe.OnCreate.SBIFDisassembleMetworkingSmallSheetMetal(items, result, player)
    SBIFDisassembleFlooring(player, Perks.MetalWelding, "Base.SmallSheetMetal", 1);
end
function Recipe.OnCreate.SBIFDiassembleTiles(items, result, player)
    SBIFDisassembleFlooring(player, Perks.Woodwork, "Base.Plank", 1);
end
function Recipe.OnCreate.SBIFDisassembleUrban(items, result, player)
    SBIFDisassembleFlooring(player, Perks.Woodwork, "Base.Plank", 1);
end
function Recipe.OnCreate.SBIFDisassembleWood(items, result, player)
    SBIFDisassembleFlooring(player, Perks.Woodwork, "Base.Plank", 1);
end
