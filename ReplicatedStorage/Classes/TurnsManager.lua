local TurnsManager = {}
function TurnsManager:new(currentTeam, InitialTurnsTable)
	local self = setmetatable({}, TurnsManager)
	--array of combatants
	self.currentTeam = currentTeam or {}
	--[[
	{
		Team1 = {
			1 = Combatant1,
			2 = Combatant2,
			3 = Combatant3, ...
			n = Combatant n
		},
		Team2 = {
			1 = Combatant1,
			2 = Combatant1,
			3 = Combatant1, ...
			n = Combatant n
	}
	]]
	
	self.TurnsTable = InitialTurnsTable or {}
	
	return self
end

--Warning: AI generated. Improve if needed
function TurnsManager:ReorderTeamSlots(teamName)
	local team = self.TurnsTable[teamName]
	if not team then return end

	local newTeam = {}

	for _, combatant in ipairs(team) do
		-- Optional: only include alive units
		if combatant and combatant.IsAlive ~= false then
			table.insert(newTeam, combatant)
		end
	end

	self.TurnsTable[teamName] = newTeam
end

return TurnsManager

