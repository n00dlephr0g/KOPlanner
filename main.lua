--[[--
This is a debug plugin to test Plugin functionality.

@module koplugin.HelloWorld
--]]--



local Dispatcher = require("dispatcher")  -- luacheck:ignore

-- widgets
local InfoMessage = require("ui/widget/infomessage")
local MultiInput = require("ui/widget/multiinputdialogue")
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local _ = require("gettext")


-- works
local koplanner = WidgetContainer:extend{
    name = "koplanner",
    is_doc_only = false,
}

-- works
function koplanner:onDispatcherRegisterActions()
    Dispatcher:registerAction("koplanner_ui_show", {category="KOPlanner", event="KoplannerUiShow", title=_("Show KOPlanner UI"), general=true,})
end

-- works
function koplanner:init()
    self:onDispatcherRegisterActions()
    self.ui.menu:registerToMainMenu(self)
end


function koplanner:addToMainMenu(menu_items)
    menu_items.koplanner = {
        text = _("KOPlanner"),
        -- in which menu this should be appended
        sorting_hint = "tools",
        -- a callback when tapping
        sub_item_table = {
            {
                text = _("Server Settings"),
                keep_menu_open = true,
                
                callback = function()
                   UIManager:show() 
                end
            },
            {
                text = _("Sync Settings (TODO)"),
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
