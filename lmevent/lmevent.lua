local computer = require("computer")
local uuid = require("uuid")
local serialization = require("serialization")

local rx = require("rx")
local json = require("json")

local rxoc = require("rxoc")
local lmnet = require("lmnet")

local function receive()
    return lmnet.receive():filter(function(_, _, _, _, _, protocol)
        --print("recieve filter", protocol)
        return protocol == "lmevent"
    end):map(function(_, _, _, _, _, _, sender, context, action, correlation, payload)
        --print("recieve map", sender, context, action, correlation, payload)
        return {
            sender = sender,
            context = context,
            action = action,
            correlation = correlation,
            payload = serialization.unserialize(payload),
        }
    end)
end

local function _send(context, action, correlation, payload)
    --print("_send", context, action, correlation, payload)
    return lmnet.send("lmevent", computer.address(), context, action, correlation, serialization.serialize(payload))
end

local function send(context, action, payload)
    --print("send", context, action, payload, _send)
    return _send(context, action, nil, payload)
end

local function request(context, action, payload)
    local correlation = uuid.next()
    _send(context, action, correlation, payload)
    return receive():filter(function(response)
        return response.correlation == correlation
    end)
end

local function respond(context, action, correlation, payload)
    _send(context, action, correlation, payload)
end

return {
    receive = receive,
    send = send,
    request = request,
    respond = respond,
}
