local EnemyTurn = {}
function EnemyTurn:OnEnter(tbgame) 
	print("Entered EnemyTurn State")
end

function EnemyTurn:OnUpdate(tbgame) 
	print("Updating EnemyTurn State")
	local stateMachine = tbgame.StateMachine
	local contestants = tbgame.Contestants
	local player1 = contestants.Player1
	
	stateMachine:ChangeState("EnemyTurn")
	stateMachine:Update()
end

function EnemyTurn:OnExit(tbgame) 
	print("Exited EnemyTurn State")
end
return EnemyTurn

