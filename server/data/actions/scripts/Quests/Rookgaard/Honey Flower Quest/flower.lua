function onUse(cid, item, frompos, item2, topos)
if item.uid == 10028 then
  queststatus = getPlayerStorageValue(cid,10028)
  if queststatus == -1 and getPlayerAccess(cid) == 0 then
   doPlayerSendTextMessage(cid,22,"You have found a honey flower.")
   item_uid = doPlayerAddItem(cid,2103,1)
   setPlayerStorageValue(cid,10028,1)

  else
   doPlayerSendTextMessage(cid,22,"The heaven blossom is empty.")
  end
else
  return 0
end
return 1
end

