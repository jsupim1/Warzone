require "ArmyPay"
require "Util"

function Client_PresentConfigureUI(rootParent)
	-- adapted from https://github.com/FizzerWL/ExampleMods/blob/master/RandomizedBonusesMod/Client_PresentConfigureUI.lua
	local initialGold = Mod.Settings.Gold;
	if initialGold == nil then initialGold = GetDefaults("Gold"); end

	local vert = UI.CreateVerticalLayoutGroup(rootParent);

	local horz = UI.CreateHorizontalLayoutGroup(vert);

	UI.CreateLabel(horz).SetText('Gold to remove for every 100 armies:');
    goldInputField = UI.CreateNumberInputField(horz)
		.SetSliderMinValue(GetDefaults("GoldMinVal"))
		.SetSliderMaxValue(GetDefaults("GoldMaxVal"))
		.SetValue(initialGold);

end