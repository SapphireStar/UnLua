---@type BP_CharacterBase_C
local M = UnLua.Class()

local Lerp = UE.UKismetMathLibrary.Lerp

function M:Initialize(Initializer)
    self.Life = 100
    self.IsDead = false
end


function M:ReceiveBeginPlay()
    local Weapon = self:SpawnWeapon()
    if Weapon then
        print('Weapon is not nil')
        Weapon:K2_AttachToComponent(self.WeaponPoint, nil, UE.EAttachmentRule.SnapToTarget, UE.EAttachmentRule.SnapToTarget, UE.EAttachmentRule.SnapToTarget)
        self.Weapon = Weapon
    end
end


function M:UpdateAiming(IsAiming)
    if IsAiming then
        self.ZoomInOut:Play()
    else
        self.ZoomInOut:Reverse()
    end
end

function M:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
    self.Life = math.max(self.Life - Damage, 0)
    if self.Life <= 0 then
        self:Died()
        self.TimerDie = UE.UKismetSystemLibrary.K2_SetTimerDelegate({self, M.Destroy}, 2, true)
    end
end

function M:Died()
    self.IsDead = true
    self.CapsuleComponent:SetCollisionEnabled(UE.ECollisionEnabled.NoCollision)
    local Controller = self:GetController()
    if Controller then
        Controller:UnPossess()
    end
end

function M:Destroy()
    if self.Weapon then
        self.Weapon:K2_DestroyActor()
    end
    self:K2_DestroyActor()
end


function M:NotifyEnemyDied()
end

function M:GetWeaponTraceInfo()
end

function M:StartFire()
    print('BP_CharacterBase_C:StartFire')
    if self.Weapon then
        self.Weapon:StartFire()
    end
end

function M:StopFire()
    print('BP_CharacterBase_C:StartFire')
    if self.Weapon then
        self.Weapon:StopFire()
    end
end

function M:SpawnWeapon()
    print('BP_CharacterBase:SpawnWeapon')
    return nil
end 

return M
