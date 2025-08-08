local TurnsManager = require(script.Parent.TurnsManager);
local StateMachine = require(script.Parent.StateMachine)
local RunService = game:GetService("RunService")

local TBGame = {}
TBGame.__index = TBGame

function TBGame:new(name, initialStateName, currentTeam, initialturnsTable)
	local self = setmetatable({}, TBGame)
	self.Name = name or "NoName"
	self.TurnsManager = TurnsManager:new(currentTeam ,initialturnsTable);
	self.StateMachine = StateMachine:new(initialStateName);
	print("New Game Created"..self.Name)
	return self
end

function TBGame:PositionTeam(teamsFolder, teamPositionsFolder)
	local currentTeam = self.TurnsManager.CurrentTeam;
	local teamPositions = teamPositionsFolder:GetChildren()
	
	for teamName, team in pairs(currentTeam) do
		for _, teamPosition in ipairs(teamPositions) do
			local totalSlots = #teamPosition:GetChildren()
			if teamName == "Team1" and teamPosition.Name == "Team1Positions" then
				local position = math.ceil(totalSlots/#team)
				for i, character in ipairs(team) do
					local slot = teamPosition:FindFirstChild("Slot"..position)
					character.Model.HumanoidRootPart.CFrame = CFrame.new(slot.CFrame.Position)
					position += 1
				end
				
			elseif teamName == "Team2" and teamPosition.Name == "Team2Positions" then
				local position = math.ceil(totalSlots/#team)
				for i, character in ipairs(team) do
					local slot = teamPosition:FindFirstChild("Slot"..position)
					character.Model.HumanoidRootPart.CFrame = CFrame.new(slot.CFrame.Position) * CFrame.Angles(0, math.rad(180), 0)
					position += 1
				end
			end
		end
	end
end	

function TBGame:Start() 
	RunService.Heartbeat:Connect(function(T) 
		print(self.StateMachine)
		self.StateMachine:Update()
	end)
end


return TBGame


