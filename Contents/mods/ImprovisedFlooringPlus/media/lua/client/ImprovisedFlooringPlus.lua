-- Embed Tweak code instead of depending on Tweaker Core
-- to resolve conflict issues with others who are modifying the ItemTweaker_Core.lua
local TweakItemData = {};
local function SBIFTweaks()
    for k,v in pairs(TweakItemData) do
        for t,y in pairs(v) do
            local item = ScriptManager.instance:getItem(k);
            if item ~= nil then
                item:DoParam(t.." = "..y);
                -- print("Tweaking Item: " .. k..": "..t..", "..y);
            end
        end
    end
end
local function SBIFTweakItem(itemName, itemProperty, propertyValue)
    if not TweakItemData[itemName] then
        TweakItemData[itemName] = {};
    end
    TweakItemData[itemName][itemProperty] = propertyValue;
end
Events.OnGameBoot.Add(SBIFTweaks);

-- Paint now has 10 Uses per bucket
SBIFTweakItem("Base.PaintBlack", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintBlue", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintBrown", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintCyan", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintGreen", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintGrey", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintLightBlue", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintLightBrown", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintOrange", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintPink", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintPurple", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintRed", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintTurquoise", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintWhite", "UseDelta", 0.1);
SBIFTweakItem("Base.PaintYellow", "UseDelta", 0.1);

-- BASE GAME: Plaster Lasts 10 uses per bucket
SBIFTweakItem("Base.BucketPlasterFull", "UseDelta", 0.1);

-- BASE GAME: Concrete Lasts 10 uses per bucket
SBIFTweakItem("Base.BucketConcreteFull", "UseDelta", 0.1);
