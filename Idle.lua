local Idle = {}
function Idle:OnEnter() 
	print("Entered Idle State")
end

function Idle:OnUpdate() 
	print("Updating Idle State")
end

function Idle:OnExit() 
	print("Exited Idle State")
end
return Idle
