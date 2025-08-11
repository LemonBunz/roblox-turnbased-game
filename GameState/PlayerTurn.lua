local PlayerTurn = {}
function PlayerTurn:OnEnter(tbgame) 
	print("Entered PlayerTurn State")
end

function PlayerTurn:OnUpdate(tbgame) 
	print("Updating PlayerTurn State")
	local stateMachine = tbgame.StateMachine
	local contestants = tbgame.Contestants
	local player1 = contestants.Player1
	
	stateMachine:ChangeState("EnemyTurn") -- Change State
	stateMachine:Update() --Update NewState:OnUpdate()
end

function PlayerTurn:OnExit(tbgame) 
	print("Exited PlayerTurn State")
end
return PlayerTurn


