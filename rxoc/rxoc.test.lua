local event = require("event")

local rxoc = require("rxoc")

local eventObservable = rxoc.fromEvent("touch")
local eventSubscription = eventObservable:subscribe(function(...)
    print('observer', ...)
  end)

event.pull("interrupted")
print("interupted")

eventSubscription:unsubscribe()

print("End")
