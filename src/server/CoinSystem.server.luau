local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local coinCollected = ReplicatedStorage:WaitForChild("CoinCollected")

for i, coin in pairs(workspace:GetChildren()) do
	if coin.Name == "Coin" then
		local debounce = false

		coin.Touched:Connect(function(hit)
			if debounce then
				return
			end

			local humanoid = hit.Parent:FindFirstChild("Humanoid")

			if humanoid then
				debounce = true

				local character = hit.Parent
				local player = Players:GetPlayerFromCharacter(character)

				if player then
					coin:Destroy()
					coinCollected:FireClient(player)
				end
			end
		end)
	end
end
