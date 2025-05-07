--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_DefaultProjectile_C
local M = UnLua.Class('Blueprints/Weapon/BP_ProjectileBase')

-- function M:Initialize(Initializer)
-- end

function M:UserConstructionScript()
    self.Super.UserConstructionScript(self)
end

function M:ReceiveBeginPlay()
    self.Super.ReceiveBeginPlay(self)
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
