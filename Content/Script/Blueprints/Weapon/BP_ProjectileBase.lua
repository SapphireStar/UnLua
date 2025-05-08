--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_ProjectileBase_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

function M:UserConstructionScript()
	self.Damage = 128.0
	self.DamageType = nil
	self.Sphere.OnComponentHit:Add(self, M.OnComponentHit_Sphere)
end

function M:OnComponentHit_Sphere(HitComponent, OtherActor, OtherComp, NormalImpulse, Hit)
	local BP_CharacterBase = UE.UClass.Load("/Game/Core/Blueprints/BP_CharacterBase.BP_CharacterBase_C")
	local Character = OtherActor:Cast(BP_CharacterBase)
	if Character then
		Character.BoneName = Hit.BoneName;
		local Controller = self.Instigator:GetController()
		UE.UGameplayStatics.ApplyDamage(Character, self.Damage, Controller, self.Instigator, self.DamageType)
	end
	self:K2_DestroyActor()
end


function M:ReceiveBeginPlay()
    self:SetLifeSpan(2.0)
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
