dofile(getDataDir() .. 'libs/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

	function FocusModule:init(handler)
	FOCUS_GREETSWORDS = {'hi nezil', 'hello nezil', 'hiho nezil'}
	FOCUS_FAREWELLSWORDS = {'bye', 'farewell', 'hi bezil', 'hello bezil', 'hiho bezil'}
		self.npcHandler = handler
		for i, word in pairs(FOCUS_GREETSWORDS) do
			local obj = {}
			table.insert(obj, word)
			obj.callback = FOCUS_GREETSWORDS.callback or FocusModule.messageMatcher
			handler.keywordHandler:addKeyword(obj, FocusModule.onGreet, {module = self})
		end
		
		for i, word in pairs(FOCUS_FAREWELLSWORDS) do
			local obj = {}
			table.insert(obj, word)
			obj.callback = FOCUS_FAREWELLSWORDS.callback or FocusModule.messageMatcher
			handler.keywordHandler:addKeyword(obj, FocusModule.onFarewell, {module = self})
		end
		
		return true
	end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'vial', 'potion', 'flask'}, 					ID_emptypotion, 5)
shopModule:addBuyableItem({'torch'}, 					ID_torch, 2)
shopModule:addBuyableItem({'candelabrum'}, 					ID_candelabrum, 8)
shopModule:addBuyableItem({'candlestick'}, 					ID_candlestick, 2)
shopModule:addBuyableItem({'bag'}, 					ID_greybag, 4)
shopModule:addBuyableItem({'scroll'}, 					ID_scroll, 5)
shopModule:addBuyableItem({'document'}, 					ID_document, 12)
shopModule:addBuyableItem({'parchment'}, 					ID_parchment, 8)
shopModule:addBuyableItem({'shovel'}, 					ID_shovel, 10)
shopModule:addBuyableItem({'backpack'}, 					ID_greybackpack, 10)
shopModule:addBuyableItem({'scythe'}, 					ID_scythe, 40)
shopModule:addBuyableItem({'pick'}, 					ID_pick, 50)
shopModule:addBuyableItem({'watch'}, 					ID_watch, 20)
shopModule:addBuyableItem({'rope'}, 					ID_rope, 50)
shopModule:addBuyableItem({'rod'}, 					ID_fishingrod, 150, 0, 'fishing rod')
shopModule:addBuyableItem({'crowbar'}, 					ID_crowbar, 260)
shopModule:addBuyableItem({'present'}, 					ID_present, 10)
shopModule:addBuyableItem({'bucket'}, 					ID_bucket, 10, 0)
shopModule:addBuyableItem({'bottle'}, 					ID_bottle, 3, 0)
shopModule:addBuyableItem({'water'}, 					ID_waterhose, 10, 0, 'water hose')
shopModule:addBuyableItem({'oil'}, 					2006, 20, 11, 'vial of oil')
shopModule:addBuyableItem({'worm'}, 					ID_worm, 1)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell equipment of all kinds. Is there anything you need?"})
keywordHandler:addKeyword({'equipment'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell shovels, picks, scythes, bags, ropes, backpacks, cups, scrolls, documents, parchments, and watches. We also sell lightsources."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell shovels, picks, scythes, bags, ropes, backpacks, cups, scrolls, documents, parchments, and watches. We also sell lightsources."})
keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We sell torches, candlesticks, candelabra, and oil."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Nezil Whetstone, son of Fire, of the Savage Axes. I and my sis' Bezil are selling stuff, ye' know?"})
keywordHandler:addKeyword({'bezil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "She's my sis'."})
keywordHandler:addKeyword({'food'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Sorry, visit the Jolly Axeman Tavern for that."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Let me see ... we have shovels, picks, scythes, bags, ropes, backpacks, scrolls, documents, parchments, watches, fishing rods, sixpacks of worms and some lightsources."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Let me see ... we have shovels, picks, scythes, bags, ropes, backpacks, scrolls, documents, parchments, watches, fishing rods, sixpacks of worms and some lightsources."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Let me see ... we have shovels, picks, scythes, bags, ropes, backpacks, scrolls, documents, parchments, watches, fishing rods, sixpacks of worms and some lightsources."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I think it's about |TIME|. If you'd bought a watch you'd know for sure."})

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end

if  msgcontains(msg, 'bezil') or msgcontains(msg, 'Bezil') then
elseif msgcontains(msg, 'hi') or msgcontains(msg, 'Hi') or msgcontains(msg, 'hello') or msgcontains(msg, 'Hello') or msgcontains(msg, 'Hiho') or msgcontains(msg, 'hiho') then
	npcHandler:say("Uhm, me or my sis', ".. getPlayerName(cid) .."?", 1)
	talk_state = 0

        end	
    return TRUE
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())