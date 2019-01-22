local component = require("component")
local event = require("event")

local rx = require("rx")

local rxoc = require("rxoc")

local function receive()
    return rx.Observable.create(function (subscriber)

        local eventObservable = rxoc.fromEvent("modem_message"):filter(function(_, _, _, xPort)
            return xPort == 0 -- only tunnel events
        end)
        
        local eventSubscription = eventObservable:subscribe(subscriber)

        return rx.Subscription.create(function() 
            eventSubscription:unsubscribe()
        end)
    end);
end

local function send(...)
    return component.tunnel.send(...)
end

return {
    receive = receive,
    send = send,
}
