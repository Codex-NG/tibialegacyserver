function onUse(cid, item, frompos, item2, topos)
if item.uid == 10014 then
  queststatus = getPlayerStorageValue(cid,10014)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a golden key.")
   item_uid = doPlayerAddItem(cid,2091,1)
   doSetItemActionId(item_uid,3980)
   setPlayerStorageValue(cid,10014,1)
  else
   doPlayerSendTextMessage(cid,22,"The hole is empty.")
  end
else
  return 0
end
return 1
end

