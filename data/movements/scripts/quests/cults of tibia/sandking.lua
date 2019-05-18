function onStepIn(creature, item, position, fromPosition)
	if not creature:isMonster() then
		return true
	end
	if creature:getName():lower() == "the sandking" then
		item:remove()
		creature:addHealth(math.random(100, 1000))
	end
	return true
end

