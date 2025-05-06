--[[--
This is a debug plugin to test Plugin functionality.

@module koplugin.HelloWorld
--]]--


-- essentials
local Dispatcher = require("dispatcher")  -- luacheck:ignore
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local _ = require("gettext")

-- widgets
local InfoMessage = require("ui/widget/infomessage")
local MultiInput = require("ui/widget/multiinputdialogue")


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
    self.settings = {
        server = {
            url = "",
            username = "",
            password = "",
        },
    }
end

-- menu
function koplanner:addToMainMenu(menu_items)
    menu_items.koplanner = {
        text = _("KOPlanner"),
        sorting_hint = "tools",
        sub_item_table = {
            {
                text = _("Server Settings"),
                keep_menu_open = true,
                callback = function()
                    local dialogue = MultiInput:new{
                        title = _("Server Settings"),
                        fields = {
                            {
                                description = _("CalDAV Server URL"),
                                -- input_type = nil, -- default for text
                                text = self.settings.server.url
                                hint = _("URL"),
                            },
                            {
                                description = _("Username")
                                text = self.settings.server.username,
                                hint = _("Username"),
                            },
                            {
                                description = _("Password"),  
                                text_type = "password",
                                hint = _("Password")
                            },
                        },
                        buttons = {
                            {
                                {
                                    text = _("Cancel"),
                                    id = "close",
                                    callback = function()
                                        UIManager:close(sample_input)
                                    end
                                },
                                {
                                    text = _("Info"),
                                    callback = function()
                                        -- do something
                                    end
                                },
                                {
                                    text = _("Use settings"),
                                    callback = function(touchmenu_instance)
                                        local fields = sample_input:getFields()
                                        -- check for user input
                                        if fields[1] ~= "" and fields[2] ~= ""
                                            and fields[3] ~= 0 then
                                            -- insert code here
                                            UIManager:close(sample_input)
                                            -- If we have a touch menu: Update menu entries,
                                            -- when called from a menu
                                            if touchmenu_instance then
                                                touchmenu_instance:updateItems()
                                            end
                                        else
                                            -- not all fields where entered
                                        end
                                    end
                                },
                            },
                        },
                    }
                    UIManager:show(dialogue)
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
