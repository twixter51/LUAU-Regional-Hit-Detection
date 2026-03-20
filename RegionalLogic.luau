local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local RunService = game:GetService("RunService")

local guiToShow = require(script.Parent:FindFirstChild("YourGUIHERE")) -- replace with your UI

--Regions
local region1 = game.Workspace:FindFirstChild("Combat Initiate").Region1 -- your region here, can be many just add parameters

--Variable to check wether the player is still inside the region
local firstTimeSeen = false






--SoundEXTRA STUFF DELETE IF U DONT NEED
local sound1 = region1:WaitForChild("Ambience1")
local alertS = region1:WaitForChild("alert")

local s1C = sound1:Clone()
local a1C = alertS:Clone()

s1C.Parent = sound1
a1C.Parent = region1

--remove clones use this
character.Humanoid.Died:Connect(function()
	s1C:Destroy()
	a1C:Destroy()
end)
-----


local regional = {}






function playerEntered(region)
	local humanoidRootPart = character.HumanoidRootPart
	
	if humanoidRootPart then
		local params = OverlapParams.new()
		params.FilterType = Enum.RaycastFilterType.Include
		params.FilterDescendantsInstances = {character}
		
		
		
		local touched = game.Workspace:GetPartBoundsInBox(region.CFrame, region.Size, params)
		
		
		local hitS = {}
		for i, part in pairs(touched) do
			
			if part.Parent:FindFirstChild("Humanoid") and not table.find(hitS, part.Parent) then
				
				table.insert(hitS, part.Parent)
				
			end
			
			
		end
		
		-- check if it is a character
		if table.find(hitS, character) then
			if not firstTimeSeen then
				guiToShow.GUISHOW()
				firstTimeSeen = true
				s1C:Play()
				a1C:Play()
				print(sound1.Parent)
			end
		end
		
		if not table.find(hitS, character) then
			firstTimeSeen = false
			s1C:Stop()
		end
	end
	
	
end







RunService.Heartbeat:Connect(function()
	playerEntered(region1)
end)






return regional
