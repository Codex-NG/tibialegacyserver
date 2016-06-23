-- NPC Converter System - developed by Utroz <utroz@oakcoders.com>
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)	npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)	npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg) end
function onThink()	npcHandler:onThink() end

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am known as Gabel. I have borne this name for as long as I remember, and believe me - that is quite some time.'})
keywordHandler:addKeyword({'gabel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I have often thought about changing this name because... Ah well <sighs>. Let us talk about more cheerful things.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I am the true leader of all djinn, both in worldly and in spiritual matters.<sighs> Unfortunately, there are those among my kind who disagree.'})
keywordHandler:addKeyword({'djinn'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Once we were a mighty race. I like to think that one day we will return to our former glory, but as long as this tragic war is not won that is not likely to happen.'})
keywordHandler:addKeyword({'war'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We had thought the war was over for good when Malor was finally imprisoned. And now he is free again! How could it ever come so far. ...'})
keywordHandler:addKeyword({'malor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The accursed usurper is free! I can\'t believe it! To think that power-hungry cockroach is once again roaming the world! ...'})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Some call me a king, even though I do not like the title. Daraman has taught us to think little of worldly matters such as power or station in life.'})
keywordHandler:addKeyword({'daraman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Daraman may have been just a human, but he bore in him the spark of the divine. We have paid a heavy price for following his teachings, but I have never felt any regret for my decision.'})
keywordHandler:addKeyword({'ashta\'daramai'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'This place is a gift of Daraman to the djinn people. Oh, he did not build it himself, of course. It was us Marid who did it. We erected it on the place where once stood my old palace. ...'})
keywordHandler:addKeyword({'marid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We, the Marid, are the true inheritors of the djinn legacy. Those errant fools who call themselves the Efreet are nothing but usurpers.'})
keywordHandler:addKeyword({'efreet'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Our fallen brethren claim they are different, but I have not given up hope yet that all djinn will be reunited one day! If only they saw the light!'})
keywordHandler:addKeyword({'mal\'ouquah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The Mal\'ouquah is the Efreets\' fortress. Malor built it when it was clear that the djinns had definitely split in two fractions. I will personally raze it to the ground once we have finally won this disastrous war!'})
keywordHandler:addKeyword({'kha\'zeel'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'These majestic mountains were chosen by the gods as a vantage point from which they watched their creation.'})
keywordHandler:addKeyword({'kha\'labal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ah yes - that horrid desert. I still recall how beautiful it was back in the times before the struggle it began. It was a land full of song and bliss - a veritable paradise. But look at it now. <sighs> It is such a shame.'})
keywordHandler:addKeyword({'orc king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The power hungry fool released Malor from his prison, and now the evil is upon us once again! He should have known better than to believe Malor\'s sugar covered lies. ...'})
keywordHandler:addKeyword({'human'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'For a long time we have despised and oppressed your kind. I still feel ashamed for the things we have done in those dark days. The gods be praised that they sent Daraman to open our eyes. ...'})
keywordHandler:addKeyword({'zathroth'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The name brings up painful memories. I\'d rather not talk about this subject.'})
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'For a long time I found it difficult to love them. But Daraman has opened my eyes.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The world of Tibia is like a gemstone carved by the greatest of all craftsmen. It is sad that it took a human to make me realise its perfection.'})
keywordHandler:addKeyword({'darashia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Darashia was nothing but a forlorn pool of mud last time I passed there. I hear it has now risen to great wealth and glory. Perhaps the Caliph is more open to the true creed than that dangerous fool, the pharaoh of Ankrahmun.'})
keywordHandler:addKeyword({'scarab'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The scarabs are ancient beings, as ancient as ourselves. We djinns feel a lot of respect for them.'})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I have often heard of the splendid cities the humans have erected on the continent. I would like to visit them one day and send them a message of peace and friendship in the name of my people.'})
keywordHandler:addKeyword({'ankrahmun'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'I haven\'t seen the venerable city in a long time. I would like to visit it again, but I can\'t help the feeling that I would not be welcome these days.'})
keywordHandler:addKeyword({'pharaoh'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'The new pharaoh seems to hold some very eccentric ideas about life and death. I have a feeling that his so-called teachings are nothing but an ignorant perversion of the true creed.'})
keywordHandler:addKeyword({'palace'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Stay clear of that place. I have heard bad things about it.'})
keywordHandler:addKeyword({'temple'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'In these heretic times the temple is devoted to the teachings of that pompous pharaoh. I haven\'t been there for a long time.'})
keywordHandler:addKeyword({'ascension'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Apparently that is what the followers of the pharaoh are striving for. It has to do with his heretical teachings.'})
keywordHandler:addKeyword({'rah'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'That\'s just some heretic drivel. Don\'t ask me about it.'})
keywordHandler:addKeyword({'djema'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Poor thing. She\'s an orphan you know. We took her to us when she was a child, and we have never regretted it. So fresh and lively - she has really brought some life to this place. ...'})
keywordHandler:addKeyword({'bo\'ques'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'My good old cook. Of all worldly temptations his food is the greatest.'})
keywordHandler:addKeyword({'baa\'leal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He is Malor\'s lieutenant and the commander-in-chief of all his minions. He is nothing without his master. Never stirred while Malor was gone.'})
keywordHandler:addKeyword({'alesar'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Alesar... Alesar. You know, it pains me to even hear this name. When he left I lost both my best smith and a personal friend. I don\'t know what is worse. ...'})
keywordHandler:addKeyword({'fa\'hradin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'He is my trusted counsellor and friend. If you would like to help us you should talk to him. ...'})
keywordHandler:addKeyword({'lamp'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'We djinn use them to sleep. Well, you may find it is a funny notion to sleep in a lamp, but then, for us it seems just as silly to sleep in a longish wooden construction with a fluffy mattress on top.'})
keywordHandler:addKeyword({'fa\'hradin lamp'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Ah yes. This lamp was his masterpiece. It was so satisfying to see that dirty little schemer fall for a ploy himself. If only he\'d never come back!'})
keywordHandler:addKeyword({'rata\'mari'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'So you know about him. Hm. Since nobody else knows about him Fa\'Hradin must have told you. ...'})

npcHandler:addModule(FocusModule:new())