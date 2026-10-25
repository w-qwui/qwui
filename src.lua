local QWUI = {}

QWUI.Version = "1.0.0"

local success, WindUI = pcall(function()
    return loadstring(game:HttpGet(
        "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
    ))()
end)

if not success then
    error("[QWUI] Failed to load WindUI: " .. tostring(WindUI))
end

QWUI.WindUI = WindUI

function QWUI.CreateWindow(config)
    assert(type(config) == "table", "[QWUI] Config must be a table")

    local settings = {
        Title = config.Title or "QW Hub",
        Author = config.Author or "by QW",
        Icon = config.Icon or "house",
        Theme = config.Theme or "Dark",
        Folder = config.Folder or "QWUI",
        ToggleKey = config.ToggleKey or Enum.KeyCode.RightControl,
        Resizable = config.Resizable ~= false,
        HideSearchBar = config.HideSearchBar or false,
    }

    if config.Size then
        settings.Size = config.Size
    end

    if config.MinSize then
        settings.MinSize = config.MinSize
    end

    if config.MaxSize then
        settings.MaxSize = config.MaxSize
    end

    if config.Transparent ~= nil then
        settings.Transparent = config.Transparent
    end

    if config.OpenButton then
        settings.OpenButton = config.OpenButton
    end

    local window = WindUI:CreateWindow(settings)

    return window
end

function QWUI.CW(title, theme, icon, author, folder)
    return QWUI.CreateWindow({
        Title = title,
        Theme = theme,
        Icon = icon,
        Author = author,
        Folder = folder,
    })
end

function QWUI.Notify(title, content, duration)
    return WindUI:Notify({
        Title = title or "QWUI",
        Content = content or "",
        Duration = duration or 3,
    })
end

function QWUI.GetWindUI()
    return WindUI
end

return QWUI
