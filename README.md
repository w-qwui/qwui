QWUI (Quick WindUI)

QWUI is a lightweight UI wrapper for WindUI, designed to simplify the creation of Roblox interfaces.

Features
Simple window creation
Customizable themes, icons, titles, and authors
Built-in notification system
Access to the original WindUI library
Support for native WindUI components
Easy integration through loadstring
Installation

Load QWUI directly from your GitHub repository:

lua
local QWUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/QWUI.lua"
))()


Replace USERNAME with your GitHub username and REPOSITORY with your repository name.

Creating a Window

Use QWUI.CW() to create a window quickly.

lua
local Window = QWUI.CW(
    "QW Hub",
    "Dark",
    "house",
    "by QW",
    "QWHub"
)

Parameters
Parameter	Description	Default
title	Window title	QW Hub
theme	UI theme	Dark
icon	Window icon	house
author	Author label	by QW
folder	Configuration folder	QWUI
Creating a Window with Configuration

For more control, use QWUI.CreateWindow().

lua
local Window = QWUI.CreateWindow({
    Title = "QW Hub",
    Author = "by QW",
    Icon = "house",
    Theme = "Dark",
    Folder = "QWHub",
    ToggleKey = Enum.KeyCode.RightControl,
    Resizable = true,
    HideSearchBar = false,
})


Additional optional settings include:

Size
MinSize
MaxSize
Transparent
OpenButton

These settings are passed to WindUI's window creation function.

Creating Tabs and Components

QWUI returns the native WindUI window, so you can use WindUI's component methods directly.

lua
local Window = QWUI.CW(
    "QW Hub",
    "Dark",
    "house",
    "by QW",
    "QWHub"
)

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "house",
})

MainTab:Button({
    Title = "Test Button",
    Icon = "mouse",
    Callback = function()
        print("Button clicked!")
    end,
})

MainTab:Toggle({
    Title = "Example Toggle",
    Desc = "Enable or disable an option",
    Value = false,
    Callback = function(value)
        print("Toggle state:", value)
    end,
})

MainTab:Slider({
    Title = "Example Slider",
    Step = 1,
    Value = {
        Min = 1,
        Max = 100,
        Default = 16,
    },
    Callback = function(value)
        print("Slider value:", value)
    end,
})

MainTab:Dropdown({
    Title = "Example Dropdown",
    Values = {
        "Option 1",
        "Option 2",
        "Option 3",
    },
    Value = "Option 1",
    Callback = function(value)
        print("Selected:", value)
    end,
})


For more components and configuration options, refer to the WindUI documentation and examples.

Notifications

Use QWUI.Notify() to display a notification.

lua
QWUI.Notify(
    "QWUI",
    "Interface loaded successfully!",
    3
)

Parameters
Parameter	Description	Default
title	Notification title	QWUI
content	Notification message	Empty string
duration	Display duration in seconds	3
Accessing WindUI

If you need features that are not exposed directly by QWUI, use QWUI.GetWindUI().

lua
local WindUI = QWUI.GetWindUI()


You can also access the library through:

lua
local WindUI = QWUI.WindUI

Complete Example
lua
local QWUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/USERNAME/REPOSITORY/main/QWUI.lua"
))()

local Window = QWUI.CW(
    "QW Hub",
    "Dark",
    "house",
    "by QW",
    "QWHub"
)

local MainTab = Window:Tab({
    Title = "Main",
    Icon = "house",
})

MainTab:Button({
    Title = "Say Hello",
    Callback = function()
        QWUI.Notify("QWUI", "Hello, world!", 3)
    end,
})

MainTab:Toggle({
    Title = "Example Toggle",
    Value = false,
    Callback = function(value)
        print("Enabled:", value)
    end,
})

QWUI.Notify("QWUI", "Loaded successfully!", 3)

QWUI is a wrapper around WindUI. Refer to the WindUI repository for its license and usage terms.
