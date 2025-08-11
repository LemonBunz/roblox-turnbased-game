local GameOver = {}
function GameOver:OnEnter(tbgame) 
	print("Entered GameOver State")
end

function GameOver:OnUpdate(tbgame) 
	print("Updating GameOver State")
	local stateMachine = tbgame.StateMachine
	local contestants = tbgame.Contestants
	local player1 = contestants.Player1
	
	stateMachine:ChangeState("EnemyTurn")
	stateMachine:Update()
end

function GameOver:OnExit(tbgame) 
	print("Exited GameOver State")
end
return GameOver

