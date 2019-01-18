local event = require("event")
local serialize = require("serialization").serialize

local lmevent = require("lmevent")

local a = lmevent.receive():subscribe(function(message)
    print('recieve', serialize(message))
end)

local b = lmevent.receive():filter(function(message) 
    return message.context == "placer" and message.action == "place"
end):subscribe(function(message)
    print('responder', serialize(message))
    lmevent.responde("placer", "placed", message.correlation, "here")
end)

lmevent.send("hest", "fisk", "hund")

local c = lmevent.request("placer", "place", "here"):subscribe(function(message)
    print('placer resonse', serialize(message))
end)

event.pull("interrupted")
print("interupted")

a:unsubscribe()
b:unsubscribe()
c:unsubscribe()

print("End")
