local EnemyTurn = {}
function EnemyTurn:OnEnter() 
	print("Entered EnemyTurn State")
end

function EnemyTurn:OnUpdate() 
	print("Updating EnemyTurn State")
end

function EnemyTurn:OnExit() 
	print("Exited EnemyTurn State")
end
return EnemyTurn