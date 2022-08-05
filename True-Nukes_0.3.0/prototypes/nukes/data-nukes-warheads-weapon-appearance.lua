local create_utils = require("__True-Nukes__.prototypes.warhead-system.sprite-assembly-util")


local setupWarheadsForWeapon = create_utils.setupWarheadsForWeapon
local tints = create_utils.tints


weaponTypes["rounds-magazine"].icons["-atomic-0_1t"] = { "__True-Nukes__/graphics/rounds/gg-atomic-rounds-magazine.png"}
weaponTypes["rounds-magazine"].lights["-atomic-0_1t"] = {"__True-Nukes__/graphics/rounds/atomic-rounds-magazine-light.png"}
weaponTypes["rounds-magazine"].icons["-atomic-0_5t"] = { "__True-Nukes__/graphics/rounds/yg-atomic-rounds-magazine.png"}
weaponTypes["rounds-magazine"].lights["-atomic-0_5t"] = {"__True-Nukes__/graphics/rounds/atomic-rounds-magazine-light.png"}
weaponTypes["rounds-magazine"].icons["-atomic-2t"] = { "__True-Nukes__/graphics/rounds/yy-atomic-rounds-magazine.png"}
weaponTypes["rounds-magazine"].lights["-atomic-2t"] = {"__True-Nukes__/graphics/rounds/atomic-rounds-magazine-light.png"}


local setupForCannon = {
  type = "cannon",
  weapon = "cannon-shell",
  warheads = {}
}
setupForCannon.warheads["-atomic-0_1t"] = {version = 2, tints = {tints.californium}}
setupForCannon.warheads["-atomic-0_5t"] = {version = 3, tints = {tints.californium}}
setupForCannon.warheads["-atomic-2t"] = {version = 4, tints = {tints.californium, tints.californium}}
setupForCannon.warheads["-atomic-4t"] = {version = 4, tints = {tints.uraniumLive, tints.californium}}
setupForCannon.warheads["-atomic-8t"] = {version = 4, tints = {tints.californium, tints.uraniumLive}}
setupForCannon.warheads["-atomic-20t"] = {version = 4, tints = {tints.uraniumLive, tints.uraniumLive}}
setupWarheadsForWeapon(setupForCannon)

local setupForRocket = {
  type = "rocket",
  weapon = "small-rocket",
  warheads = {}
}
setupForRocket.warheads["-atomic-0_1t"] = {version = 2, tints = {tints.californium}}
setupForRocket.warheads["-atomic-0_5t"] = {version = 3, tints = {tints.lightNothing, tints.californium}}
setupForRocket.warheads["-atomic-2t"] = {version = 3, tints = {tints.californium, tints.californium}}

setupForRocket.warheads["-atomic-4t"] = {version = 4, tints = {tints.lightNothing, tints.californium, tints.californium}}
setupForRocket.warheads["-atomic-8t"] = {version = 4, tints = {tints.californium, tints.californium, tints.californium}}
setupForRocket.warheads["-atomic-20t"] = {version = 6, tints = {tints.californium, tints.californium, tints.californium, tints.californium, tints.lightNothing}}
setupWarheadsForWeapon(setupForRocket)

local setupForBigRocket = {
  type = "rocket",
  weapon = "big-rocket",
  warheads = {}
}
setupForBigRocket.warheads["-atomic-0_1t"] = {version = 6, tints = {tints.californium, tints.nothing, tints.nothing, tints.nothing, tints.explosive}}
setupForBigRocket.warheads["-atomic-0_5t"] = {version = 6, tints = {tints.nothing, tints.californium, tints.nothing, tints.nothing, tints.explosive}}
setupForBigRocket.warheads["-atomic-2t"] = {version = 6, tints = {tints.californium, tints.californium, tints.nothing, tints.nothing, tints.explosive}}

setupForBigRocket.warheads["-atomic-4t"] = {version = 6, tints = {tints.uraniumLive, tints.nothing, tints.nothing, tints.nothing, tints.explosive}}
setupForBigRocket.warheads["-atomic-8t"] = {version = 6, tints = {tints.nothing, tints.uraniumLive, tints.nothing, tints.nothing, tints.explosive}}
setupForBigRocket.warheads["-atomic-20t"] = {version = 6, tints = {tints.uraniumLive, tints.uraniumLive, tints.nothing, tints.nothing, tints.explosive}}

setupForBigRocket.warheads["-atomic-500t"] = {version = 6, tints = {tints.uraniumLive, tints.uraniumLive, tints.uraniumLive, tints.nothing, tints.explosive}}
setupForBigRocket.warheads["-atomic-1kt"] = {version = 6, tints = {tints.uraniumLive, tints.uraniumLive, tints.uraniumLive, tints.uraniumLive, tints.explosive}}
setupWarheadsForWeapon(setupForBigRocket)














