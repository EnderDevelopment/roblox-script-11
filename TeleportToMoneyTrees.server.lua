-- TeleportToMoneyTrees.server.lua

local Players = game:GetService("Players")

local function teleportToMoneyTrees(player)
    -- Find all money trees in the game
    local moneyTrees = workspace:GetDescendants()
    
    -- Filter for money trees (assuming they have a specific name or tag)
    local validMoneyTrees = {}
    for _, descendant in ipairs(moneyTrees) do
        if descendant.Name == "MoneyTree" or descendant:FindFirstChild("IsMoneyTree") then
            table.insert(validMoneyTrees, descendant)
        end
    end
    
    -- If no money trees are found, notify the player
    if #validMoneyTrees == 0 then
        warn("No money trees found in the game.")
        return
    end
    
    -- Choose a random money tree
    local randomIndex = math.random(1, #validMoneyTrees)
    local chosenMoneyTree = validMoneyTrees[randomIndex]
    
    -- Teleport the player to the chosen money tree
    player.Character:MoveTo(chosenMoneyTree.Position)
end

-- Connect the teleport function to the player's character added event
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        teleportToMoneyTrees(player)
    end)
end)
