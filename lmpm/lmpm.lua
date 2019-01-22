local shell = require("shell")

-- RxLua
shell.execute("mkdir /home/lib")
shell.execute("wget -f https://github.com/bjornbytes/RxLua/raw/v0.0.3/rx.lua /home/lib/rx.lua")

-- JSON.lua
shell.execute("mkdir /home/lib")
shell.execute("wget -f https://github.com/rxi/json.lua/raw/v0.1.1/json.lua /home/lib/json.lua")

-- RxOC
shell.execute("mkdir /home/lib")
shell.execute("wget -f https://github.com/rickirunge/LMCraft-OpenComputer-Scripts/raw/master/rxoc/rxoc.lua /home/lib/rxoc.lua")

-- LMEvent
shell.execute("mkdir /home/lib")
shell.execute("wget -f https://github.com/rickirunge/LMCraft-OpenComputer-Scripts/raw/master/lmevent/lmevent.lua /home/lib/lmevent.lua")

-- LMNet
shell.execute("mkdir /home/lib")
shell.execute("wget -f https://github.com/rickirunge/LMCraft-OpenComputer-Scripts/raw/master/lmnet/lmnet.lua /home/lib/lmnet.lua")
