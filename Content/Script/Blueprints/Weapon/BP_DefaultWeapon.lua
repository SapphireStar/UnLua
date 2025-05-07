--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_DefaultWeapon_C
local M = UnLua.Class("Blueprints.Weapon.BP_WeaponBase")

-- function M:Initialize(Initializer)
-- end

function M:UserConstructionScript()
    self.Super.UserConstructionScript(self)
    self.MuzzleSocketName = "Muzzle"
    self.ProjectileClass = UE.UClass.Load("/Game/Blueprints/Weapon/BP_DefaultProjectile.BP_DefaultProjectile_C")
    self.World = self:GetWorld()
end

function M:StartFire()
    self.Super.StartFire(self)
end
function M:StopFire()
    self.Super.StopFire(self)
end


function M:FireAmmunition()
    self.Super.FireAmmunition(self)
end
 
function M:ProjectileFire()
    self.Super.ProjectileFire(self)
end

function M:SpawnProjectile()
    local Transform = self:GetFireInfo()
	local R = UE.UKismetMathLibrary.RandomFloat()
	local G = UE.UKismetMathLibrary.RandomFloat()
	local B = UE.UKismetMathLibrary.RandomFloat()
	local BaseColor = {}
	BaseColor[0] = UE.FLinearColor(R, G, B, 1.0)
	self.World:SpawnActor(self.ProjectileClass, Transform, UE.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, self, self.Instigator, "Blueprints.Weapon.BP_DefaultProjectile", BaseColor)
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
