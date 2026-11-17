local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local coinCollected = ReplicatedStorage:WaitForChild("CoinCollected")

for i, coin in pairs(workspace:GetChildren()) do
	if coin.Name == "Coin" then
		local debounce = false

		-- Loop semua anak di dalam Model Coin
		for _, part in pairs(coin:GetChildren()) do
			-- Cek apakah anaknya adalah Part fisik (bukan ParticleEmitter)
			if part:IsA("BasePart") then
				part.Touched:Connect(function(hit)
					print("Coin tersentuh!") -- Penanda untuk debugging

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
							print(player.Name, "mendapatkan 1 koin!")

							-- Tambah nilai Leaderstats
							local playerStats = player:FindFirstChild("leaderstats")
							if playerStats then
								local coinsValue = playerStats:FindFirstChild("Coins")
								if coinsValue then
									coinsValue.Value = coinsValue.Value + 1
								end
							end
						end
					end
				end)
			end
		end
	end
end
