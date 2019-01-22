local shell = require("shell")
 
shell.execute("mkdir /home/bin")
shell.execute("wget -f https://github.com/rickirunge/LMCraft-OpenComputer-Scripts/raw/master/lmpm/lmpm.lua /home/bin/lmpm.lua")
shell.execute("lmpm")