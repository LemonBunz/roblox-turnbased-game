--[[
	Right now I'm going to be using the same team system as the old game.
	Then I need to work on the team positioning system. 
]]
--Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--Classes
local StateMachine = require(ReplicatedStorage.Classes.StateMachine)
local GAME = require(ReplicatedStorage.Classes.TBGame)
local Character = require(ReplicatedStorage.Classes.Character)
--Getting Teams
local testTeam = game.Workspace.Battlefield.TeamsFolder
local Ally1 = {
	Name = "Ally1",
	Model = testTeam.Team1.TestAlly1,
	HP = 100,
	MaxHP = 100,
	Speed = math.random(60, 200), --simulate speed
	Attack = 100,
	Defense = 100,
}
local Ally2 = {
	Name = "Ally2",
	Model = testTeam.Team1.TestAlly2,
	HP = 100,
	MaxHP = 100,
	Speed = math.random(60, 200), --simulate speed
	Attack = 100,
	Defense = 100,
}
local Enemy1 = {
	Name = "Enemy1",
	Model = testTeam.Team2.TestEnemy1,
	HP = 100,
	MaxHP = 100,
	Speed = math.random(60, 200), --simulate speed
	Attack = 100,
	Defense = 100,
}
local Enemy2 = {
	Name = "Enemy2",
	Model = testTeam.Team2.TestEnemy2,
	HP = 100,
	MaxHP = 100,
	Speed = math.random(60, 200), --simulate speed
	Attack = 100,
	Defense = 100,
}
local currentTeamTest = {
	Team1 = { 
		[1] = Character:new(Ally1),
		[2] = Character:new(Ally2)
	},
	Team2 = {
		[1] = Character:new(Enemy1),
		[2] = Character:new(Enemy2)
	}
}

local initialTurnsTable= {}
-- Gather all characters into a flat array
for _, team in pairs(currentTeamTest) do
	for _, character in ipairs(team) do
		table.insert(initialTurnsTable, character)
	end
end

-- Sort the table by Speed (highest first)
table.sort(initialTurnsTable, function(a, b)
	return a.Stats.Speed > b.Stats.Speed
end)

print(initialTurnsTable)

----Getting Game
local battleField = game.Workspace.Battlefield
local teamsFolder = battleField.TeamsFolder
local teamPositionsFolder = battleField.TeamPositionsFolder
local tbGame= GAME:new("Test Game", "Idle", currentTeamTest, initialTurnsTable)
tbGame:PositionTeam(teamsFolder, teamPositionsFolder)
--tbGame:Start()