--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type BP_MyPlayerController_C
local M = UnLua.Class()
require("LuaPanda").start("127.0.0.1",8818);
-- function M:Initialize(Initializer)
-- end

-- function M:UserConstructionScript()
-- end

function M:ReceiveBeginPlay()
    self.ControlRot = UE.FRotator()
    self.ForwardVec = UE.FVector()
    self.RightVec = UE.FVector()
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

function M:MoveForward(AxisValue)
    if self.Pawn then
        local Rotation = self:GetControlRotation(self.ControlRot)
        Rotation:Set(0, Rotation.Yaw, 0)
        local Direction = Rotation:ToVector(self.ForwardVec)
        self.Pawn:AddMovementInput(Direction, AxisValue)
    end
end

function M:MoveRight(AxisValue)
    if self.Pawn then
        local Rotation = self:GetControlRotation(self.ControlRot)
        Rotation:Set(0, Rotation.Yaw, 0)
        local Direction = Rotation:GetRightVector(self.RightVec)
        self.Pawn:AddMovementInput(Direction, AxisValue)
    end
end

function M:Turn(AxisValue)
    self:AddYawInput(AxisValue)
end

function M:LookUp(AxisValue)
    self:AddPitchInput(AxisValue)
end

function M:Fire_Pressed()
    if not self.Pawn then
        return
    end
    local MyInterface = UE.UClass.Load('/Game/Blueprints/BPI_Interface.BPI_Interface_C')
    MyInterface.StartFire(self.Pawn, true)
end

function M:Fire_Released()
    if not self.Pawn then
        return
    end
    local MyInterface = UE.UClass.Load('/Game/Blueprints/BPI_Interface.BPI_Interface_C')
    MyInterface.StopFire(self.Pawn, true)
end

function M:Aim_Pressed()
    if not self.Pawn then
        return
    end
    local MyInterface = UE.UClass.Load('/Game/Blueprints/BPI_Interface.BPI_Interface_C')
    MyInterface.UpdateAiming(self.Pawn, true)
end

function M:Aim_Released()
    if not self.Pawn then
        return
    end
    local MyInterface = UE.UClass.Load('/Game/Blueprints/BPI_Interface.BPI_Interface_C')
    MyInterface.UpdateAiming(self.Pawn, false)
end

-- body end

return M
