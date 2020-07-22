local currentCursor = 0
local cursors = {
	"crosshair",
	"pointingHand",
	"beam",
	"notAllowed",
	"resizeLeftRight",
	"resizeUpDown",
	"arrow"
}
local windowsCursors = {
	"appStarting",
	"resizeAll",
	"resizeNorthEastSouthWest",
	"resizeNorthWestSouthEast",
	"upArrow",
	"hourglass"
}
local macCursors = {
	"closedHand", 
	"openHand",
	"resizeRight", 
	"resizeLeft",
	"resizeUp", 
	"resizeDown",
	"disappearingItem", 
	"beamHorizontal", 
	"dragLink", 
	"dragCopy", 
	"contextMenu",
}
local linuxCursors = {
	"rightArrow",
	"bullseye",
	"leftButton",
	"middleButton",
	"paintBrush",
	"pencil",
	"pointLeft",
	"pointRight",
	"questionArrow",
	"rightButton",
	"sizing",
	"sprayCan",
	"wait",
}
local isWindows = system.getInfo("platform") == "win32"
local isMac = system.getInfo("platform") == "macos"
local isLinux = system.getInfo("platform") == "linux"

if (isWindows) then
	for i = #windowsCursors, 1, -1 do
		table.insert(cursors, 1, windowsCursors[i])
	end
elseif (isMac) then
	for i = #macCursors, 1, -1 do
		table.insert(cursors, 1, macCursors[i])
	end
elseif (isLinux) then
	for i = #linuxCursors, 1, -1 do
		table.insert(cursors, 1, linuxCursors[i])
	end
end

local cursorText =
	display.newText(
	{
		text = "",
		fontSize = 24
	}
)
cursorText.x = display.contentCenterX
cursorText.y = display.contentCenterY

local function changeCursor(event)
	currentCursor = currentCursor + 1

	if (currentCursor > #cursors) then
		timer.cancel(event.source)
		return
	end

	cursorText.text = cursors[currentCursor]
	native.setProperty("mouseCursor", cursors[currentCursor])
end

timer.performWithDelay(800, changeCursor, 0)