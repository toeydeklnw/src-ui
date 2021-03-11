--[[
            ███╗░░░███╗░█████╗░███╗░░░███╗███╗░░░███╗░█████╗░███████╗  ██╗░░██╗██╗░░░██╗██████╗░
        ████╗░████║██╔══██╗████╗░████║████╗░████║██╔══██╗╚════██║  ██║░░██║██║░░░██║██╔══██╗
        ██╔████╔██║███████║██╔████╔██║██╔████╔██║██║░░██║░░███╔═╝  ███████║██║░░░██║██████╦╝
        ██║╚██╔╝██║██╔══██║██║╚██╔╝██║██║╚██╔╝██║██║░░██║██╔══╝░░  ██╔══██║██║░░░██║██╔══██╗
        ██║░╚═╝░██║██║░░██║██║░╚═╝░██║██║░╚═╝░██║╚█████╔╝███████╗  ██║░░██║╚██████╔╝██████╦╝
        ╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░░░░╚═╝╚═╝░░░░░╚═╝░╚════╝░╚══════╝  ╚═╝░░╚═╝░╚═════╝░╚═════╝░
    MAMMOZ HUB Source Code Release (Projectxl)
    If you do take the code or whatever, at least give credits

    Discord : https://discord.gg/FyyGcG6zQB
    Released by the MAmMOZ HUB Hub owner, discord IDs: 544161581664174093 & 328526902279143434
]]
local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/VL"))()
local market = game:GetService("MarketplaceService")
local info = market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
local Toggle_var = {}
function Toggle_var:new(n, t)
    local ojb = {
        class = "Toggle_var",
        name = n,
        type = t
    }
    Toggle_var.__index = Toggle_var
    setmetatable(ojb, Toggle_var)
    if type(n) == "string" and type(t) == "boolean" then
        return ojb
    end
end

local games = {
    [2753915549] = {
        Title = "Blox Fruits",
        Icons = "C"
    },
    [6186867282] = {
        Title = "Project XL",
        Icons = "P"
    }
}
function Projectxl()
    local plr = game:GetService("Players").LocalPlayer
    local VirtualUser = game:GetService("VirtualUser")
    local itemtp = Toggle_var:new("item-Teleport", false)
    local farmaura = Toggle_var:new("Farm-Aura", false)
    local weapon = {}
    local weaponselect = nil

    for i, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
        if v:FindFirstChild("AbilityTool") then
            table.insert(weapon, v.Name)
        end
    end

    local discen = 50
    local function marketmob() -- return name mob in discen local
        -- body
        for i, v in ipairs(game:GetService("Workspace").QuestMarkers:GetChildren()) do
            local discan =
                (v.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if discan <= discen then
                local ppp = v.Name:sub(1, 9)
                local oo = ppp:match("%d+")
                local op = oo:len()
                local opl = op + 9
                local names = v.Name:sub(opl)
                return tostring(names)
            end
        end
    end

    local function marketquest() -- return remote
        -- body
        for i, v in ipairs(game:GetService("ReplicatedStorage").Quests:GetChildren()) do
            if v.Name:match(marketmob()) then
                local args = {
                    [1] = game:GetService("ReplicatedStorage").Quests[v.Name]
                }

                return game:GetService("ReplicatedStorage").RemoteEvents.ChangeQuestRemote:FireServer(unpack(args))

            end
        end
    end

    local function tpitems() -- teleport tools in plr character
        for i, v in ipairs(game:GetService("Workspace"):GetChildren()) do
            if v:IsA "Tool" then
                v.Handle.CFrame = plr.Character.HumanoidRootPart.CFrame
            end
        end
    end

    spawn(function()
        while true do
            wait()
            pcall(function()
                if itemtp.type then
                    tpitems()
                end
            end)
        end
    end)
    spawn(function()
        while true do
            wait()
            pcall(function()
                if farmaura.type then
                    for i, v in ipairs(game:GetService("Players").LocalPlayer.PlayerGui.Menu.QuestFrame:GetChildren()) do
                        -- body
                        local l__LocalPlayer__1 = game.Players.LocalPlayer;
                        local l__QuestFrame__17 = l__LocalPlayer__1:WaitForChild("PlayerGui"):WaitForChild("Menu")
                                                      :WaitForChild("QuestFrame");
                        local l__QuestName__18 = l__QuestFrame__17:WaitForChild("QuestName");
                        for i2, v2 in ipairs(game:GetService("Players").LocalPlayer.QuestValues:GetChildren()) do
                            if v2.Name:match(marketmob() .. "Progress") then
                                if v.Visible and l__QuestName__18.Text:match(marketmob()) and v2.MinValue ~= v2.MaxValue then
                                    for i3, v3 in ipairs(game:GetService("Workspace").Live:GetChildren()) do
                                        if v3.Name:match(marketmob()) then
                                            for i4, v4 in pairs(v3:GetChildren()) do
                                                if v4.Humanoid.Health > 0 and v4:FindFirstChild("Humanoid") then
                                                    repeat
                                                        wait()
                                                        plr.Character.HumanoidRootPart.CFrame =
                                                            v4.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
                                                        VirtualUser:CaptureController()
                                                        VirtualUser:ClickButton1(Vector2.new(50, 50),
                                                            CFrame.new(Vector3.new(0, 0, 0)))
                                                    until v4.Humanoid.Health <= 0 or not farmaura.type or v.Visible ==
                                                        false or v2.MinValue == v2.MaxValue
                                                end
                                            end
                                        end
                                    end
                                else
                                    marketquest()
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    spawn(function()
        -- body
        while true do
            wait()
            pcall(function()
                if farmaura.type then
                    if weaponselect ~= nil then
                        plr.Character.Humanoid:EquipTool(plr.Backpack[weaponselect])
                    else
                        farmaura.type = false
                    end
                end
            end)
        end
    end)

    -- ui 
    local Main = VLib:Window("INAHEE", games[game.PlaceId].Title, games[game.PlaceId].Icons)
    local Page1 = Main:Tab("Main Tab")

    local label = Page1:Label("Label")

    Page1:Toggle(itemtp.name, function(value)
        itemtp.type = value
    end)
    Page1:Toggle(farmaura.name, function(value)
        farmaura.type = value
    end)
    Page1:Dropdown("Weapon Select", weapon, function(value)
        weaponselect = value
    end)

    Page1:Slider("Slider", 50, 100000, 0, function(t)
        discen = t
    end)
end
if games[game.PlaceId] and info.Name:match(games[game.PlaceId].Title) then
    if games[game.PlaceId].Title == "Project XL" then
        Projectxl()
    end

else
    local Main = VLib:Window("INAHEE", "NONE", games[game.PlaceId].Icons)
    local Page1 = Main:Tab("Main Tab")

    local label = Page1:Label("Label")
end
