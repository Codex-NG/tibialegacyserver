dofile(getDataDir() .. 'libs/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function greetCallback(cid)
	if getPlayerSex(cid) == 1 then
	npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Sir ".. getPlayerName(cid) ..".")
	return true
	else
	npcHandler:setMessage(MESSAGE_GREET, "Welcome on board, Madam ".. getPlayerName(cid) ..".")
	return true
	end	
end	

npcHandler:setCallback(CALLBACK_GREET, greetCallback)

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)
 
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am known all over the world as Captain Sinbeard"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this sailing-ship."})
keywordHandler:addKeyword({'captain'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am the captain of this sailing-ship."})
keywordHandler:addKeyword({'ship'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'line'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'company'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My ship is the fastest in the whole world."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We can transport everything you want."})
keywordHandler:addKeyword({'passanger'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We would like to welcome you on board."})
keywordHandler:addKeyword({'trip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'route'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'passage'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'town'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'destination'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'sail'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'go'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Where do you want to go? To Darashia, Venore, Port Hope or Edron?"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm sorry but my ship does not currently service that port."})

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end
	
	-- NPC Captain Sinbeard Ankrahmun Boat feito por Rodrigo (Nottinghster)
		
	local venore = {x=32954,y=32023,z=6, stackpos=0}
	local porthope = {x=32530,y=32784,z=6, stackpos=0}
	local darashia = {x=33290,y=32481,z=6, stackpos=0}
	local edron = {x=33175,y=31764,z=6, stackpos=0}
	
-- Venore
if msgcontains(msg, 'venore') then
	if isPlayerVip(cid) == TRUE then
		npcHandler:say('Do you seek a passage to Venore for free?')
		talk_state = 1
		town_boat = venore
	else
		npcHandler:say('Do you seek a passage to Venore for 150 gold?')
		talk_state = 1
		price = 150
		town_boat = venore
	end	
	
-- Port Hope
elseif msgcontains(msg, 'port hope') then
	if isPlayerVip(cid) == TRUE then
		npcHandler:say('Do you seek a passage to Port Hope for free')
		talk_state = 1
		town_boat = porthope
	else
		npcHandler:say('Do you seek a passage to Port Hope for 80 gold?')
		talk_state = 1
		price = 80
		town_boat = porthope
	end	
	
-- Darashia
elseif msgcontains(msg, 'darashia') then
	if isPlayerVip(cid) == TRUE then
		npcHandler:say('Do you seek a passage to Darashia for free?')
		talk_state = 1
		town_boat = darashia
	else
		npcHandler:say('Do you seek a passage to Darashia for 100 gold?')
		talk_state = 1
		price = 100
		town_boat = darashia
	end	
	
-- Edron
elseif msgcontains(msg, 'edron') then
	if isPlayerVip(cid) == TRUE then
		npcHandler:say('Do you seek a passage to Edron for free?')
		talk_state = 1
		town_boat = edron
	else
		npcHandler:say('Do you seek a passage to Edron for 160 gold?')
		talk_state = 1
		price = 160
		town_boat = edron
	end	
	
-- Confirm Yes or No 
elseif msgcontains(msg, 'yes') and talk_state == 1 then
	if isPremium(cid) == TRUE then
		if getTilePzInfo(getPlayerPosition(cid)) == 1 then
			if getPlayerMoney(cid) >= price or isPlayerVip(cid) == TRUE then
				if isPlayerVip(cid) == TRUE then
					selfSay('Set the sails!')
					doTeleportThing(cid, town_boat)
					doSendMagicEffect(getCreaturePosition(cid), 10)
					talk_state = 0
				else
					selfSay('Set the sails!')
					doPlayerRemoveMoney(cid, price)
					doTeleportThing(cid, town_boat)
					doSendMagicEffect(getCreaturePosition(cid), 10)
					talk_state = 0
				end
			else
				npcHandler:say('You don\'t have enough money.')
				talk_state = 0
			end
		else
			npcHandler:say('First get rid of those blood stains! You are not going to ruin my vehicle!')
			talk_state = 0
		end
	else
		npcHandler:say('I\'m sorry, but you need a premium account in order to travel onboard our ships.')
		talk_state = 0
	end
elseif msgcontains(msg, 'no') and talk_state == 1 then
	npcHandler:say('We would like to serve you some time.')
	talk_state = 0	
end

	return TRUE	
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())