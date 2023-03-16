local button = script.Parent
local ivalue = game.Players.LocalPlayer.Values["As-Toggle"]
button.MouseButton1Down:Connect(function()
	if ivalue.Value == 0 then
		ivalue.Value = 1
	elseif ivalue.Value == 1 then
		ivalue.Value = 0
	end
	print("pressed.")
end)
