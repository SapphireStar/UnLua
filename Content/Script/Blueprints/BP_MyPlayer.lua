--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_MyPlayer_C
local M = UnLua.Class('BP_CharacterBase_C')

-- function M:Initialize(Initializer)
-- end

-- function M:UserConstructionScript()
-- end

local Lerp = UE.UKismetMathLibrary.Lerp

function M:ReceiveBeginPlay()
    self.Super.ReceiveBeginPlay(self)
    self.DefaultFOV = self.Camera.FieldOfView
    local InterpFloats = self.ZoomInOut.TheTimeline.InterpFloats
    local FloatTrack = InterpFloats:GetRef(1)
    FloatTrack.InterpFunc:Bind(self, M.OnZoomInOutUpdate)
end

function M:OnZoomInOutUpdate(Alpha)
    local FOV = Lerp(self.DefaultFOV, 50, Alpha)
    self.Camera:SetFieldOfView(FOV)
end


function M:UpdateAiming(IsAiming)
    self.Super.UpdateAiming(self, IsAiming)
end

function M:NotifyEnemyDied()
end

function M:GetWeaponTraceInfo()
    local TraceLocation = self.Camera:K2_GetComponentLocation()
    local TraceDirection = self.Camera:GetForwardVector()
    return TraceLocation, TraceDirection
end

function M:StartFire()
    self.Super.StartFire(self)
    print('BP_MyPlayer_C:StartFire')
end

function M:StopFire()
    self.Super.StopFire(self)
    print('BP_MyPlayer_C:StopFire')
end

function M:SpawnWeapon()
    print('BP_MyPlayer:SpawnWeapon')
    local World = self:GetWorld()
    if not World then
        return 
    end
    local WeaponClass = UE.UClass.Load("/Game/Blueprints/Weapon/BP_DefaultWeapon.BP_DefaultWeapon_C")
    --动态将lua脚本绑定到新生成的actor上，下面的Blueprints.Weapon.BP_DefaultWeapon是lua脚本的路径
    local NewWeapon = World:SpawnActor(WeaponClass, self:GetTransform(), UE.ESpawnActorCollisionHandlingMethod.AlwaysSpawn,self,self,"Blueprints.Weapon.BP_DefaultWeapon")
    return NewWeapon
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
