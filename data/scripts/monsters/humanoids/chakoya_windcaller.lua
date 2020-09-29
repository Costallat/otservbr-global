local mType = Game.createMonsterType("Chakoya Windcaller")
local monster = {}

monster.description = "a chakoya windcaller"
monster.experience = 48
monster.outfit = {
	lookType = 260,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 84
monster.maxHealth = 84
monster.race = "blood"
monster.corpse = 7320
monster.speed = 142
monster.summonCost = 305
monster.maxSummons = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = true,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Mupi! Si siyoqua jinuma!", yell = false},
	{text = "Siqsiq ji jusipa!", yell = false},
	{text = "Jagura taluka taqua!", yell = false},
	{text = "Quatu nguraka!", yell = false}
}

monster.loot = {
	{id = "gold coin", chance = 71170, maxCount = 27},
	{id = "brass helmet", chance = 4390},
	{id = "bone shield", chance = 960},
	{id = 2667, chance = 30790, maxCount = 3},
	{id = "northern pike", chance = 40},
	{id = "rainbow trout", chance = 40},
	{id = "green perch", chance = 110},
	{id = "fireproof horn", chance = 410}
}

monster.attacks = {
	{name ="combat", type = COMBAT_PHYSICALDAMAGE, interval = 2000, chance = 100, minDamage = 0, maxDamage = -22, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 2000, chance = 15, minDamage = -16, maxDamage = -32, type = COMBAT_ICEDAMAGE, range = 7, shootEffect = CONST_ANI_ICE, target = false},
	--
	{name ="combat", interval = 2000, chance = 10, minDamage = -130, maxDamage = -160, type = CONDITION_FREEZING, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 2000, chance = 10, minDamage = -9, maxDamage = -30, type = COMBAT_ICEDAMAGE, length = 5, spread = 2, effect = CONST_ME_ICEAREA, target = false}
}

monster.defenses = {
	defense = 10,
	armor = 10,
	{name ="invisible", interval = 2000, chance = 15, effect = CONST_ME_MAGIC_BLUE}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = -15},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 100},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -10}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
