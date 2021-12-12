require "Util"

-- force-enable commerce if needed and apply bonus overrider if needed

function Server_Created(game, settings)
	print("init Server_Created");
	-- print(settings.CommerceArmyCostMultiplier); is 0 to treat Gold just like armies
	if not settings.CommerceGame then
		settings.CommerceArmyCostMultiplier = 0;
		print("force enabled commerce");
	end

	local publicGameData = Mod.PublicGameData;-- can be read by client

	publicGameData.enteredServer_StartGame = false;
	Mod.PublicGameData = publicGameData;
end