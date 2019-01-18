local component = require("component")
local event = require("event")
local m = component.modem -- get primary modem component
-- Send some message.
m.broadcast(4000, "this is a test")