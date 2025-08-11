local remoteEvents = game.ReplicatedStorage.RemoteEvents

local function safeCall(callback, ...)
	if typeof(callback) ~= "function" then
		return
	end

	local success, err = pcall(callback, ...)
	if not success then
		warn("State callback error:", err)
	end
end
local StateMachine = {}
StateMachine.__index = StateMachine

-- Constructor
function StateMachine:new(initialStateName, TbGame)
	local self = setmetatable({}, StateMachine)
	self.GameState = {
		Idle = require(script.Idle),
		PlayerTurn = require(script.PlayerTurn),
		EnemyTurn = require(script.EnemyTurn),
		GameOver = require(script.GameOver)
	}

	self.CurrentState = self.GameState[initialStateName]
	self.CurrentStateName = initialStateName
	self.TbGame = TbGame
    return self
end
-- Methods
function StateMachine:ChangeState(newStateName)
	if self.CurrentState then
		safeCall(self.CurrentState.OnExit, self.CurrentState, self.TbGame)
	end

	local newState = self.GameState[newStateName]
	assert(newState, "State ".. tostring(newStateName).." not found")
	
	self.CurrentState = newState
	self.CurrentStateName = newStateName
	safeCall(self.CurrentState.OnEnter, self.CurrentState, self.TbGame)
end

function StateMachine:Update()
	if self.CurrentState then
		safeCall(self.CurrentState.OnUpdate, self.CurrentState, self.TbGame)
	end
end


return StateMachine


