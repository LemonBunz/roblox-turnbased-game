local GameState = {
	Idle = require(script.Idle),
	PlayerTurn = require(script.PlayerTurn),
	EnemyTurn = require(script.EnemyTurn),
	GameOver = require(script.GameOver)
}

local StateMachine = {}
StateMachine.__index = StateMachine

-- Constructor
function StateMachine:new(initialStateName)
	local self = setmetatable({}, StateMachine)
	self.CurrentState = GameState[initialStateName]
	self.CurrentStateName = initialStateName
    return self
end
-- Methods
function StateMachine:ChangeState(newStateName)
	if self.CurrentState and self.CurrentState.OnExit then 
		self.CurrentState.OnExit()
	end
	
	local newState = GameState[newStateName]
	print(newStateName)
	assert(newState, "State ".. tostring(newStateName).." not found")

	self.CurrentState = newState
	self.CurrentStateName = newStateName
	
	if self.CurrentState and self.CurrentState.OnEnter then 
		self.CurrentState.OnEnter()
	end
end


function StateMachine:Update()
	if self.CurrentState and self.CurrentState.OnUpdate then 
		self.CurrentState.OnUpdate()
	end
end


return StateMachine

