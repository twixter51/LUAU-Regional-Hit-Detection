local Player = game:GetService("Players")
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GUI = player.PlayerGui:WaitForChild("Region1") -- your GUI here, could be any
local TweenService = game:GetService("TweenService")


--Things you want to tween, leave empty otherwise
local frame1 = GUI.Frame
local text = GUI.Frame.DojoT
local text2 = GUI.Frame.Info

local leftIcon = GUI.Frame.LeftIcon
local rightIcon = GUI.Frame.RightIcon
local main = GUI.Frame.Main
local stroke = GUI.Frame.Part2
--
local showGui = {}






function showGui.GUISHOW(Table)
	
	if not GUI then
		return
	end
	
	if frame1.Visible == true then
		return
	end
	
	stroke.Visible = true
	leftIcon.Visible = true
	rightIcon.Visible = true
	
	frame1.Visible = true
	text.Visible = true
	text.TextTransparency = 1
	text.Size = UDim2.new(0.32, 0, 0.334, 0)
	TweenService:Create(text, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 0, Size = UDim2.new(0.66, 0, 0.547, 0) }):Play()
	
	
	text2.Visible = true
	text2.TextTransparency = 1
	TweenService:Create(text2, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 0}):Play()
	
	
	main.Visible = true
	main.ImageTransparency = 1
	main.Size = UDim2.new(0, 0, 0, 0)
	TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {ImageTransparency = 0, Size = UDim2.new(1.178, 0, 0.808, 0) }):Play()
	
	
	
	task.spawn(function()
		if frame1.Visible == true then
			task.wait(3)
			stroke.Visible = false
			leftIcon.Visible = false
			rightIcon.Visible = false
			TweenService:Create(text, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1, Size = UDim2.new(0.32, 0, 0.334, 0) }):Play()
			TweenService:Create(text2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
			TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {ImageTransparency = 1, Size = UDim2.new(0, 0, 0, 0) }):Play()
			task.wait(0.5)
			frame1.Visible = false
		end
	end)
	
	
end


function showGui.removeGUI()
	if not GUI then
		return
	end
	

	TweenService:Create(text, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1, Size = UDim2.new(0.32, 0, 0.334, 0) }):Play()
	TweenService:Create(text2, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {TextTransparency = 1}):Play()
	TweenService:Create(main, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {ImageTransparency = 1, Size = UDim2.new(0, 0, 0, 0) }):Play()
	
	
	task.wait(0.5)
	frame1.Visible = false
end



return showGui
