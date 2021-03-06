dofile(getDataDir() .. 'libs/greeting.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'white pearl'}, 					ID_whitepearl, 160)
shopModule:addSellableItem({'black pearl'}, 					ID_blackpearl, 280)
shopModule:addSellableItem({'small diamond'}, 					ID_smalldiamond, 300)
shopModule:addSellableItem({'small sapphire'}, 					ID_smallsapphire, 250)
shopModule:addSellableItem({'small ruby'}, 					ID_smallruby, 250)
shopModule:addSellableItem({'small emerald'}, 					ID_smallemerald, 250)
shopModule:addSellableItem({'small amethyst'}, 					ID_smallamethyst, 200)

shopModule:addBuyableItem({'white pearl'}, 					ID_whitepearl, 320)
shopModule:addBuyableItem({'black pearl'}, 					ID_blackpearl, 560)
shopModule:addBuyableItem({'small diamond'}, 					ID_smalldiamond, 600)
shopModule:addBuyableItem({'small sapphire'}, 					ID_smallsapphire, 500)
shopModule:addBuyableItem({'small ruby'}, 					ID_smallruby, 500)
shopModule:addBuyableItem({'small emerald'}, 					ID_smallemerald, 500)
shopModule:addBuyableItem({'small amethyst'}, 					ID_smallamethyst, 400)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am responsible for buying and selling gems, pearls, and the like."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am Odemara Taleris, it's a pleasure to meet you."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We offer a great assortment of gems and pearls."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We offer a great assortment of gems and pearls."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We offer a great assortment of gems and pearls."})
keywordHandler:addKeyword({'gem'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We trade small diamonds, sapphires, rubies, emeralds, and amethysts."})
keywordHandler:addKeyword({'pearls'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We trade white and black pearls."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's |TIME|."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
