local Dispatcher = require("dispatcher") -- luacheck:ignore

local UIManager = require("ui/uimanager")
local WidgetContainer = require("ui/widget/container/widgetcontainer")
local FrameContainer = require("ui/widget/container/framecontainer")
local Popup = require("ui/widget/infomessage")
local Checkmark = require("ui/widget/checkmark")
local Text = require("ui/widget/textwidget")
local TextBox = require("ui/widget/inputdialogue")
local List = require("ui/widge/listview")

local _ = require("gettext")

local settings = {}

function settings:showWirelessSettings()
    return nil
end

function settings:test()
    return FrameContainer:new({
        List:new({
            items = {
                Text:new({
                    text = _("Hello"),
                }),
                TextBox:new({}),
            },
        }),
    })
end

return settings
