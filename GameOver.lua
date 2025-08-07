local GameOver = {}
function GameOver:OnEnter() 
	print("Entered GameOver State")
end

function GameOver:OnUpdate() 
	print("Updating GameOver State")
end

function GameOver:OnExit() 
	print("Exited GameOver State")
end
return GameOver