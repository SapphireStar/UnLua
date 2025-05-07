---@type BP_CharacterBase_C
local M = UnLua.Class()

local Lerp = UE.UKismetMathLibrary.Lerp

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
