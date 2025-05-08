--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_MyMonster_C
local M = UnLua.Class('BP_CharacterBase_C')

function M:Initialize(Initializer)
    self.Super.Initialize(self)
    self.Damage = 100
end

function M:UserConstructionScript()
end

function M:ReceiveBeginPlay()
    self.Super.ReceiveBeginPlay(self)
    self.Sphere.OnComponentBeginOverlap:Add(self, M.OnComponentBeginOverlap_Sphere)
end

function M:OnComponentBeginOverlap_Sphere(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
    print('enemy hit something')
    local BP_PlayerCharacter = UE.UClass.Load("/Game/Blueprints/BP_MyPlayer.BP_MyPlayer_C")
	local PlayerCharacter = OtherActor:Cast(BP_PlayerCharacter)
	if PlayerCharacter then
		local Controller = self:GetController()
		UE.UGameplayStatics.ApplyDamage(PlayerCharacter, self.Damage, Controller, self, self.DamageType)
	end
end

-- function M:ReceiveEndPlay()
-- end

-- function M:ReceiveTick(DeltaSeconds)
-- end

-- function M:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
-- end

-- function M:ReceiveActorBeginOverlap(OtherActor)
-- end

-- function M:ReceiveActorEndOverlap(OtherActor)
-- end

return M
