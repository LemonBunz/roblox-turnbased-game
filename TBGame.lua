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
	for i, teamMember in pairs(teamsFolder:GetChildren()) do
		local teams = teamsFolder:GetChildren();
		local teamPositions = teamsFolder:GetChildren();
	end
end

function TBGame:Start() 
	RunService.Heartbeat:Connect(function(T) 
		self.StateMachine:Update()
	end)
end

return TBGame
