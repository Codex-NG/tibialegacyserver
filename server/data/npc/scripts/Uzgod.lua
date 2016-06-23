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

shopModule:addSellableItem({'mace'}, 					ID_mace, 23)
shopModule:addSellableItem({'dagger'}, 					ID_dagger, 1)
shopModule:addSellableItem({'carlin sword'}, 					ID_carlinsword, 118)
shopModule:addSellableItem({'club'}, 					ID_club, 1)
shopModule:addSellableItem({'spear'}, 					ID_spear, 1)
shopModule:addSellableItem({'rapier'}, 					ID_rapier, 3)
shopModule:addSellableItem({'sabre'}, 					ID_sabre, 5)
shopModule:addSellableItem({'battle axe'}, 					ID_battleaxe, 75)
shopModule:addSellableItem({'battle hammer'}, 					ID_battlehammer, 50)
shopModule:addSellableItem({'morning star'}, 					ID_morningstar, 100)
shopModule:addSellableItem({'two handed sword'}, 					ID_twohandedsword, 190)
shopModule:addSellableItem({'halberd'}, 					ID_halberd, 310)
shopModule:addSellableItem({'double axe'}, 					ID_doubleaxe, 260)
shopModule:addSellableItem({'war hammer'}, 					ID_warhammer, 470)
shopModule:addSellableItem({'longsword'}, 					ID_longsword, 51)
shopModule:addSellableItem({'spike sword'}, 					ID_spikesword, 225)
shopModule:addSellableItem({'fire sword'}, 					ID_firesword, 1000)
shopModule:addSellableItem({'sword'}, 					ID_sword, 15)
shopModule:addBuyableItem({'spear'}, 					ID_spear, 10)
shopModule:addBuyableItem({'rapier'}, 					ID_rapier, 15)
shopModule:addBuyableItem({'sabre'}, 					ID_sabre, 35)
shopModule:addBuyableItem({'battle axe'}, 					ID_battleaxe, 235)
shopModule:addBuyableItem({'battle hammer'}, 					ID_battlehammer, 350)
shopModule:addBuyableItem({'morning star'}, 					ID_morningstar, 430)
shopModule:addBuyableItem({'two handed sword'}, 					ID_twohandedsword, 950)
shopModule:addBuyableItem({'club'}, 					ID_club, 5)
shopModule:addBuyableItem({'dagger'}, 					ID_dagger, 5)
shopModule:addBuyableItem({'mace'}, 					ID_mace, 90)
shopModule:addBuyableItem({'throwing knife'}, 					ID_throwingknife, 25)
shopModule:addBuyableItem({'axe'}, 					ID_axe, 20)
shopModule:addBuyableItem({'sword'}, 					ID_sword, 85)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me a blacksmith is, an' weapons me sell. You want buy weapons?"})
keywordHandler:addKeyword({'shop'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me a blacksmith is, an' weapons me sell. You want buy weapons?"})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me is Uzgod Hammerslammer, son of Fire, from the Savage Axes. You can say you to me."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You can buy the weapons me maked or sell weapons you have, jawoll."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me make often hunt on big nasties. Me small, but very big muscles me have, jawoll."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We no dungeon need. We prison isle have."})
keywordHandler:addKeyword({'prison'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bad ones locked up there. Never come out again there, jawoll."})
keywordHandler:addKeyword({'mines'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me hacking and smashing rocks as me was little dwarf, jawoll."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me enjoy doing that."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? Me just the weapons sell."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "What you need? Me just the weapons sell."})
keywordHandler:addKeyword({'light'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me having clubs, daggers, spears, axes, swords, maces, rapiers, and sabres. What is your choice?"})
keywordHandler:addKeyword({'heavy'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me having the best two handed swords in tibia. I also sell battle hammers. What is your choice?"})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me offer you light an' heavy weapons."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me offer you light an' heavy weapons."})
keywordHandler:addKeyword({'helmet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me just sell weapons."})
keywordHandler:addKeyword({'armor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me just sell weapons."})
keywordHandler:addKeyword({'shield'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me just sell weapons."})
keywordHandler:addKeyword({'legs'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Me just sell weapons."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Time is |TIME| now."})

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())