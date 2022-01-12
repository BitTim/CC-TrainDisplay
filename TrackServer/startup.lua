--Create Secure Modem
local ecnet = require("api/ecnet")
local modem = peripheral.find("modem")
local sModem = ecnet.wrap(modem)

--Create Variables
local title = "Tracks"
local version = "v1.0"

--Set title of shell
term.setTextColor(colors.yellow)
term.clear()
term.setCursorPos(1, 1)
print(title + " " + version)

--Route Output to Monitor
local mon = peripheral.find("monitor")
mon.setTextScale(0.5)
term.redirect(mon)

--Set title of monitor
term.setTextColor(colors.yellow)
term.clear()
term.setCursorPos(1, 1)
print(
print(title + " " + version)
term.setTextColor(colors.lightGray)

--Function for Logging
local log = function(head, str)
    logStr = "<" .. os.time() .. "> [" .. head .. "]: " .. str
    print(logStr)
end

--Import TrackDB
log("Init", "Importing TrackDB")
local tdbPath = ".trackDB"
local tdb = nil

if not fs.exists(tdbPath) then
    log("Init", "No TrackDB exists.")
else
    local tdbFile = fs.open(tdbPath, "r")
    tdb = textutils.unserialize(tdbFile.readAll())
    tdbFile.close()
end

--Print Address
log("Address", ecnet.address)

-- ================================
--  Track Functions
-- ================================

local trains = {}


-- ================================
--  Main Loop
-- ================================

--Main Loop
while true do
    --Receive Packet
    log("Main", "Receiving packet...")
    local s, msg = sModem.receive()
    local p = textutils.unserialize(msg)

    log("Main", "Received packet with head: " .. p.head)
    
    --Check Packet header
    if p.head == "DETECT" then
        
    elseif p.head == "REQUEST" then
        
    end
end


