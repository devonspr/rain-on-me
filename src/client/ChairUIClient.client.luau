local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local gui = playerGui:WaitForChild("ChairPromptGui")

-- Ambil tombol-tombolnya
local frame = gui:WaitForChild("Frame")
local tombolYa = frame:WaitForChild("TombolYa")
local tombolTidak = frame:WaitForChild("TombolTidak")

local showChairUI = ReplicatedStorage:WaitForChild("ShowChairUI")

-- 1. Terima sinyal dari Server untuk memunculkan UI
showChairUI.OnClientEvent:Connect(function()
	gui.Enabled = true
end)

-- 2. Jika klik YA
tombolYa.MouseButton1Click:Connect(function()
	gui.Enabled = false -- Sembunyikan UI
	print("Pemain memilih LANJUT duduk.")
	-- (Nanti kita bisa tambahkan logika lain di sini)
end)

-- 3. Jika klik TIDAK
tombolTidak.MouseButton1Click:Connect(function()
	gui.Enabled = false -- Sembunyikan UI
	print("Pemain memilih BERDIRI.")
	
	-- Paksa pemain berdiri dengan mematikan status duduknya
	local karakter = player.Character
	if karakter then
		local humanoid = karakter:FindFirstChild("Humanoid")
		if humanoid then
			humanoid.Sit = false
		end
	end
end)