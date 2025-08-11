local Idle = {}
function Idle:OnEnter(tbgame) 
	print("Entered Idle State")
end

function Idle:OnUpdate(tbgame) 
	print("Updating GameOver State")
	local stateMachine = tbgame.StateMachine
	local contestants = tbgame.Contestants
	local player1 = contestants.Player1
	
	stateMachine:ChangeState("EnemyTurn") -- Change State
	stateMachine:Update() --Update NewState:OnUpdate()
end

function Idle:OnExit(tbgame) 
	print("Exited Idle State")
end
return Idle


