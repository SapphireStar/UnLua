--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_WeaponBase_C
local M = UnLua.Class()

-- function M:Initialize(Initializer)
-- end

function M:UserConstructionScript()
    self.IsFiring = false
    self.WeaponTraceDistance = 100000.0
    self.MuzzleSocketName = nil
end


function M:StartFire()
    if self.IsFiring then
        return 
    end
    self.IsFiring = true
    self:FireAmmunition()
end

function M:StopFire()
    self.IsFiring = false
end

function M:FireAmmunition()
    self:ProjectileFire()
end
 
function M:ProjectileFire()
    self:SpawnProjectile()
end

function M:SpawnProjectile()
    return nil
end

function M:GetFireInfo()
    local TraceStart, TraceDirection = UE.UClass.Load('/Game/Blueprints/BPI_Interface.BPI_Interface_C').GetWeaponTraceInfo(self.Instigator)
    local Delta = TraceDirection * self.WeaponTraceDistance 
    local TraceEnd = TraceStart + Delta
    local Translation = self.SkeletalMesh:GetSocketLocation(self.MuzzleSocketName)
    TraceStart = Translation
    local HitResult = UE.FHitResult()
    local bResult = UE.UKismetSystemLibrary.LineTraceSingle(self, TraceStart, TraceEnd, UE.ETraceTypeQuery.Weapon, false, nil, UE.EDrawDebugTrace.ForDuration, HitResult, true)

    local Rotation
    if bResult then
        local ImpactPoint = HitResult.ImpactPoint
        Rotation = UE.UKismetMathLibrary.FindLookAtRotation(Translation, ImpactPoint)
    else
        Rotation = UE.UKismetMathLibrary.FindLookAtRotation(Translation, TraceEnd)
    end
    local Transform = UE.FTransform(Rotation:ToQuat(), Translation)
    return Transform
end

-- function M:ReceiveBeginPlay()
-- end

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
