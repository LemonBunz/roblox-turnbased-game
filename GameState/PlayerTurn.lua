local PlayerTurn = {}
function PlayerTurn:OnEnter() 
	print("Entered PlayerTurn State")
end

function PlayerTurn:OnUpdate() 
	print("Updating PlayerTurn State")
end

function PlayerTurn:OnExit() 
	print("Exited PlayerTurn State")
end
return PlayerTurn
