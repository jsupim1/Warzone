require "Util"
-- say to the server that we're ready to apply changes in gold for this player
-- only called on human players

function Client_GameRefresh(game)
	print("init Client_GameRefresh");

	-- if we're in the game
	if game == nil then
		return;
	end
	if game.Us == nil then
		return;
	end

	if not PlayerIsPlaying(game.Us) then
		return;
	end

	if not Mod.PublicGameData.enteredServer_StartGame then
		-- in manual dist, order is server_created client_refresh server_gamecustommessage etc.
		-- server_startgame isn't called before trying apply changes in server_gamecustommessage
		return;
	end

	local playerGameData = Mod.PlayerGameData;

	-- print("Mod.PlayerGameData =\n" .. tprint(Mod.PlayerGameData));

	if playerGameData.HasReduceGold then return; end

	local waitText = "Removing " .. tostring(Mod.Settings.Gold) .. " Gold for each army."
	local doneText = "Removed " .. tostring(Mod.Settings.Gold) .. " Gold for each army."
	local payload = {};
	payload.Msg = "Remove gold for armies";

	local callback = function(player)
		if not playerGameData.HasShownIncorrectGoldWarning then
			-- note that when the game starts, the displayed Gold is incorrect, afterwards the displayed amount is correct and removes the correct amount of Gold

			UI.Alert("Your Gold for this turn is " .. player.CorrectedGold .. ". The amount of Gold displayed elsewhere may be incorrect for this turn.");
		end

		-- prompting user each turn could get in the user's way
		-- UI.Alert(doneText);
	end

	game.SendGameCustomMessage(waitText, payload, callback);
end