local TurnsManager = require(script.Parent.TurnsManager);
local StateMachine = require(script.Parent.StateMachine)
local RunService = game:GetService("RunService")

local TBGame = {}
TBGame.__index = TBGame

function TBGame:new(name, initialStateName, currentInitialTeam, initialturnsTable, initialContestants)
	if (not initialStateName) then
		error("Missing initial state name")
		return
	end
	if (not currentInitialTeam) then
		error("Missing initial team")
		return
	end
	if (not initialturnsTable) then
		error("Missing initial turns table")
		return
	end
	
	local self = setmetatable({}, TBGame)
	self.Name = name or "NoName"
	self.TurnsManager = TurnsManager:new(currentInitialTeam ,initialturnsTable);
	self.StateMachine = StateMachine:new(initialStateName, self);
	self.Contestants = initialContestants
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
	self.StateMachine:Update()
end

return TBGame
