local event = require("event")

local lmnet = require("lmnet")

local a = lmnet.receive(4000):subscribe(function(...)
    print('observer a', ...)
end)

local b = lmnet.receive(4000):subscribe(function(...)
    print('observer b', ...)
end)

event.pull("interrupted")
print("interupted")

a:unsubscribe()
b:unsubscribe()

print("End")
