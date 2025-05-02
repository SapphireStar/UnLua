--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

---@type MyFirst_C
local M = UnLua.Class()

--function M:Initialize(Initializer)
--end

--function M:PreConstruct(IsDesignTime)
--end

function M:Construct()
    print('Hello Unlua: ' .. UE.UMyLuaUtils.GetIndex() .. ' Title: ' .. self.title)

    self.btn_Test.OnPressed:Add(self, M.OnClickTest)

    self:PlayAnimation(self.AnimShowButton, 0, 1)
end

function M:OnClickTest()
    local World = self:GetWorld()
    if not World then
        return
    end
    local ActorClass = UE.UClass.Load("/Game/NewBlueprint.NewBlueprint_C")
    local Actor= World:SpawnActor(ActorClass,  UE.ESpawnActorCollisionHandlingMethod.AlwaysSpawn, self, self, "")
    self.Actor = Actor
    print('Actor name: ' .. self.Actor.Name)
end
--function M:Tick(MyGeometry, InDeltaTime)
--end

return M
