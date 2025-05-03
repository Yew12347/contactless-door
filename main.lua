local component = require("component")
local event = require("event")
local shell = require("shell")

local motionSensor = component.motion_sensor
local whitelist = {
  ["Yew12347"] = true,
  ["PlayerTwo"] = true,
  ["YourNameHere"] = true,
}

print("Motion sensor terminal control active...")

while true do
  local _, _, x, y, z, name = event.pull("motion")
  if name then
    if whitelist[name] then
      print("Whitelisted player detected: " .. name)
      os.execute("redstone right 15")
      os.sleep(2)
      os.execute("redstone right 0")
    else
      print("Access denied to player: " .. name)
    end
  end
end
