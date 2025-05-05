--[[--
This is a debug plugin to test Plugin functionality.

@module koplugin.HelloWorld
--]]--

-- This is a debug plugin, remove the following if block to enable it

local Dispatcher = require("dispatcher")  -- luacheck:ignore
local InfoMessage = require("ui/widget/infomessage")
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local _ = require("gettext")
local settings = require("settings")
local koplanner = WidgetContainer:extend{
    name = "koplanner",
    is_doc_only = false,
}

function koplanner:onDispatcherRegisterActions()
    Dispatcher:registerAction("koplanner_ui_show", {category="KOPlanner", event="KoplannerUiShow", title=_("Show KOPlanner UI"), general=true,})
end

function koplanner:init()
    self:onDispatcherRegisterActions()
    self.ui.menu:registerToMainMenu(self)
end

function koplanner:addToMainMenu(menu_items)
    menu_items.hello_world = {
        text = _("KOPlanner"),
        -- in which menu this should be appended
        sorting_hint = "tools",
        -- a callback when tapping
        sub_item_table = {
            {
                text = _("test"),
                keep_menu_open = true,
                callback = function()
                    UIManager:show(settings:test())
                end
            },
            {
                text = _("Wireless Settings"),
                keep_menu_open = true,
                callback = function()
                    UIManager:show(InfoMessage:new{
                        text = _("showing calendar window")
                    })
                end
            },
            {
                text = _("Calendar Settings"),
                keep_menu_open = true,
                callback = function()
                    UIManager:show(InfoMessage:new{
                        text = _("showing calendar window")
                    })
                end
            },
            {
                text = _("Sync Mode"),
                keep_menu_open = true,
                callback = function()
                    UIManager:show(InfoMessage:new{
                        text = _("showing sync mode selection")
                    })
                end
            },
            {
                text = _("Sync Settings"),
                keep_menu_open = true,
                callback = function()
                    UIManager:show(InfoMessage:new{
                        text = _("showing sync mode selection")
                    })
                end
            },
            {
                text = _("Sync Now"),
                keep_menu_open = true,
                callback = function()
                    UIManager:show(InfoMessage:new{
                        text = _("showing sync mode selection")
                    })
                end
            }
        }
    }
end

function koplanner:onDoStuff()
    local popup = InfoMessage:new{
        text = _("i did stuff!"),
    }
    UIManager:show(popup)
end

function koplanner:wirelessSettings()
    return {
        text = _("Network Configuration"),

    }
end

return koplanner
