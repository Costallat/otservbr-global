local setting = {
	timeToFightAgain = 20,
	clearRoomTime = 60, -- In hour
	centerRoom = {x = 33528, y = 32334, z = 12},
	range = 10,
	exitPosition = {x = 33609, y = 32365, z = 11},
	storage = Storage.PrinceDrazzakTime,
	bossName = "prince drazzak",
	bossPosition = {x = 33528, y = 32333, z = 12}
}

local playerPositions = {
	{fromPos = {x = 33607, y = 32362, z = 11}, toPos = {x = 33526, y = 32341, z = 12}},
	{fromPos = {x = 33608, y = 32362, z = 11}, toPos = {x = 33527, y = 32341, z = 12}},
	{fromPos = {x = 33609, y = 32362, z = 11}, toPos = {x = 33528, y = 32341, z = 12}},
	{fromPos = {x = 33610, y = 32362, z = 11}, toPos = {x = 33529, y = 32341, z = 12}},
	{fromPos = {x = 33611, y = 32362, z = 11}, toPos = {x = 33530, y = 32341, z = 12}}
}

function onUse(player, item, fromPosition, target, toPosition, monster, isHotkey)
	if toPosition == Position(33606, 32362, 11) then
		for i = 1, #playerPositions do
			local creature = Tile(playerPositions[i].fromPos):getTopCreature()
			if not creature then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need 5 players to fight with this boss.")
				return true
			end
		end
	end

	if toPosition == Position(33606, 32362, 11) then
		if roomIsOccupied(setting.centerRoom, setting.range, setting.range) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Someone is fighting against the boss! You need wait awhile.")
			return true
		end

		for i = 1, #playerPositions do
			local creature = Tile(playerPositions[i].fromPos):getTopCreature()
			if creature then
				if creature:getStorageValue(setting.storage) >= os.time() then
					creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have faced this boss in the last " .. setting.timeToFightAgain .. " hours.")
					return true
				end
				if creature:getStorageValue(setting.storage) < os.time() then
					item:remove()
					creature:setStorageValue(setting.storage, os.time() + setting.timeToFightAgain * 60 * 60)
					creature:teleportTo(playerPositions[i].toPos)
					creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
				end
			end
		end
		-- One hour for clean the room
		addEvent(clearRoom, setting.clearRoomTime * 60 * 1000, setting.centerRoom, setting.range, setting.range, setting.exitPosition)
		Game.createMonster(setting.bossName, setting.bossPosition)
	end
	return true
end
