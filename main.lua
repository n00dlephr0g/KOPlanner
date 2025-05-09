--[[--
This is a debug plugin to test Plugin functionality.

@module koplugin.KoPlanner
--]]--


-- essentials
local Dispatcher = require("dispatcher")  -- luacheck:ignore
local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local _ = require("gettext")

-- widgets
local InfoMessage = require("ui/widget/infomessage")
local MultiInput = require("ui/widget/multiinputdialogue")


local KoPlanner = WidgetContainer:extend{
    name = "koplanner",
    fullname = _("KoPlanner"),
    is_doc_only = false,
}
--[[
function KoPlanner:onDispatcherRegisterActions()
    Dispatcher:registerAction("KoPlanner_ui_show", {category="KOPlanner", event="KoPlannerUiShow", title=_("Show KoPlanner UI"), general=true,})
end
]]
function KoPlanner:init()
    -- self:onDispatcherRegisterActions()
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
function KoPlanner:addToMainMenu(menu_items)
    menu_items.KoPlanner = {
        text = _("KoPlanner"),
        sorting_hint = "tools",
        sub_item_table = {
            --[[
            {
                text = _("Server Settings (TESTING)"),
                keep_menu_open = true,
                callback = function()
                    local dialogue
                    dialogue = MultiInput:new{
                        title = _("Server Settings"),
                        fields = {
                            {
                                description = _("CalDAV Server URL"),
                                -- input_type = nil, -- default for text
                                text = self.settings.server.url,
                                hint = _("URL"),
                            },
                            {
                                description = _("Username"),
                                text = self.settings.server.username,
                                hint = _("Username"),
                            },
                            {
                                description = _("Password"),
                                text_type = "password",
                                hint = _("Password"),
                            },
                        },
                        buttons = {
                            {
                                {
                                    text = _("Cancel"),
                                    id = "close",
                                    callback = function()
                                        UIManager:close(dialogue)
                                    end
                                },
                                {
                                    text = _("Apply"),
                                    callback = function()
                                        local fields = dialogue:getFields()
                                        -- check for user input
                                        if fields[1] ~= "" and fields[2] ~= "" and fields[3] ~= "" then
                                            -- insert code here
                                            UIManager:close(dialogue)
                                            -- If we have a touch menu: Update menu entries,
                                            -- when called from a menu
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
            ]]
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



function KoPlanner:onDoStuff()
    local popup = InfoMessage:new{
        text = _("i did stuff!"),
    }
    UIManager:show(popup)
end

function KoPlanner:wirelessSettings()
    return {
        text = _("Network Configuration"),

    }
end

return KoPlanner
