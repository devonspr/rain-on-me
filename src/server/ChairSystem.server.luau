local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Ambil RemoteEvent yang tadi kita buat di Studio
local showChairUI = ReplicatedStorage:WaitForChild("ShowChairUI")

local chair = workspace:WaitForChild("Chair")
local seat = chair:WaitForChild("Seat")

seat:GetPropertyChangedSignal("Occupant"):Connect(function()
	local pemainDuduk = seat.Occupant
	
	if pemainDuduk ~= nil then
		local karakter = pemainDuduk.Parent
		-- Cari objek Player dari karakter tersebut
		local player = Players:GetPlayerFromCharacter(karakter)
		
		if player then
			print(player.Name, "sedang duduk!")
			-- Tembak sinyal ke Client pemain ini
			showChairUI:FireClient(player)
		end
	else
		print("Pemain sudah berdiri.")
	end
end)