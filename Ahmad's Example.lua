local Speed_Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Main/refs/heads/main/Library/Optimitzed_V5.lua"))()

local window = Speed_Library:CreateWindow({
    Title = "Old Server Finder",
    Description = "Find servers with desired uptime",
    TabWidth = 150,
    SizeUi = UDim2.new(0, 600, 0, 300)
})

local mainTab = window:CreateTab({
    Name = "Main",
    Icon = ""
})

local mainSection = mainTab:AddSection("Server Finder", true)

mainSection:AddButton({
    Title = "Unblacklist Visited Server",
    Content = "Click here before using the old server finder",
    Callback = function()
        if pcall(function() return readfile("visited_servers.txt") end) then
            delfile("visited_servers.txt")
        end
    end
})

mainSection:AddLine()

local uptimeInput = mainSection:AddInput({
    Title = "Minimum Uptime",
    Content = "A white screen will flash once the old server is found, tap on it to remove it.",
    Default = "30:10:01",
    Callback = function(value)
    end
})

mainSection:AddButton({
    Title = "Begin to search",
    Content = "Start searching for old servers",
    Callback = function()
        local desiredUptime = uptimeInput.Value

        if desiredUptime:match("^%d+:%d+:%d+$") then
            local scriptUrl = "https://raw.githubusercontent.com/zryr/Fisch-Old-Server-Finder/refs/heads/main/Old-Server-Finder-Speed-Hub-X"
            loadstring(game:HttpGet(scriptUrl))()(desiredUptime)
        else
            Speed_Library:SetNotification({
                Title = "Invalid Format",
                Description = "!",
                Content = "Please enter time in HH:MM:SS format.",
                Time = 0.5,
                Delay = 5
            })
        end
    end
})

mainSection:AddParagraph({
    Title = "❗️• Information",
    Content = "If you keep serverhopping without clicking the 'Begin to Search' button, switch to a different game and then rejoin Fisch."
})

mainSection:AddLine()

mainSection:AddInput({
    Title = "Server Joiner (JobID)",
    Content = "Place a server's JobID here to join it",
    Callback = function(value)
        if value and value ~= "" then
            local TeleportService = game:GetService("TeleportService")
            pcall(function()
                TeleportService:TeleportToPlaceInstance(game.PlaceId, value, game.Players.LocalPlayer)
            end)
        end
    end
})
