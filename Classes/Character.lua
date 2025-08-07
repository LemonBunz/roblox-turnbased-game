local Character = {}
function Character:new(characterInfo)
	local self = setmetatable({}, Character)
	self.Name = characterInfo.Name
	self.Model = characterInfo.Model
	self.Stats = {
		HP = characterInfo.HP,
		MaxHP = characterInfo.MaxHP,
		Speed = characterInfo.Speed,
		Attack = characterInfo.Attack,
		Defense = characterInfo.Defense
	}
	self.IsAlive = true
	return self
end

function Character:Move1() 
	print("Used Move1")
end
function Character:Move2() 
	print("Used Move3")
end
function Character:Move3() 
	print("Used Move4")
end
function Character:Ultimate() 
	print("Used Ultimate")
end
function Character:Action(action) 
	if action then
		self[action]();
	end
end
return Character
