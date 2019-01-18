local component = require("component")
local event = require("event")

local rx = require("rx")

local rxoc = require("rxoc")

local function receive(port)
    return rx.Observable.create(function (subscriber)
        component.modem.open(port)

        local eventObservable = rxoc.fromEvent("modem_message"):filter(function(_, _, _, xPort)
            return xPort == port
        end)
        
        local eventSubscription = eventObservable:subscribe(subscriber)

        return rx.Subscription.create(function() 
            --component.modem.close(4000)
            eventSubscription:unsubscribe()
        end)
    end);
end

-- broadcast(message: any, protocol?: string, correlation?: string/UUID) : rx.Observable
local function broadcast(port, ...)
    return component.modem.broadcast(port, ...)
end

-- send(receiver: string/UUID, message: any, protocol?: string, correlation?: string/UUID) : rx.Observable
local function send(port, receiver, ...)
    return component.modem.send(receiver, port, ...)
end

return {
    receive = receive,
    send = send,
    broadcast = broadcast,
}
