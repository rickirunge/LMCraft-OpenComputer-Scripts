local event = require("event")

local rx = require("rx")

-- fromEvent(event: string): Observable 
local function fromEvent(eventName)

    return rx.Observable.create(function (subscriber)
        local handler = function(...)
            subscriber:onNext(...)
        end

        event.listen(eventName, handler)

        return rx.Subscription.create(function() 
            event.ignore(eventName, handler)
        end)
    end);

end

local function fromObservable(observable)
    return observable:filter(function() return true end)
end

return {
    fromEvent = fromEvent,
    fromObservable = fromObservable,
}
