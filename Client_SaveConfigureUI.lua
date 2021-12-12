require "Util"
require "ArmyPay"

function Client_SaveConfigureUI(alert)
	local goldVal = goldInputField.GetValue();
	local errMsg;
	local goldErrMsg = "Gold must be between " .. tostring(GetDefaults("GoldMinVal")) .. " and " .. tostring(GetDefaults("GoldMaxVal")) .. ".";

	--print(goldVal);
	--print(armiesVal);

	-- validate - may as well list all errors
	if goldVal < GetDefaults("GoldMinVal") or goldVal > GetDefaults("GoldMaxVal") then
		errMsg = goldErrMsg;
	end

	if errMsg then
		return alert(errMsg);
	end

	-- write to Mod.Settings
	Mod.Settings.Gold = goldVal/100;
end