-- GMod Mocks
-- Simulate Garry's Mod API for Busted Tests

SERVER = false
CLIENT = true

local spy = require("luassert.spy")

-- Mock Globals
_G.CreateClientConVar = function(name, default, save, userdata, helptext)
    local convar = {
        name = name,
        value = tostring(default),
        save = save,
        userdata = userdata,
        helptext = helptext,
        GetInt = function(self) return tonumber(self.value) or 0 end,
        GetFloat = function(self) return tonumber(self.value) or 0 end,
        GetBool = function(self) return self.value == "1" or self.value == "true" end,
        GetString = function(self) return self.value end,
        SetFloat = function(self, val) self.value = tostring(val) end,
        SetString = function(self, val) self.value = tostring(val) end
    }
    return convar
end

_G.RunConsoleCommand = spy.new(function(cmd, ...) end)
_G.GetConVar = function(name)
    -- This is a simplified mock. Ideally, we map names to created convars.
    -- For tests, we mock what's needed for the specific test scope.
    return {
        GetInt = function() return 0 end,
        GetBool = function() return false end,
        GetFloat = function()
            if name == "sensitivity" then return 3 end
            if name == "m_yaw" then return 0.022 end
            if name == "m_pitch" then return 0.022 end
            if name == "fov_desired" then return 90 end
            return 0
        end
    }
end

_G.surface = {
    PlaySound = spy.new(function(path) end)
}

_G.concommand = {
    Add = function(name, callback)
        _G.concommand[name] = callback
    end
}

_G.math = math or {}
_G.math.Clamp = function(val, min, max)
    if val < min then return min end
    if val > max then return max end
    return val
end
_G.math.Approach = function(cur, target, inc)
    inc = math.abs(inc)
    if cur < target then return math.min(cur + inc, target) end
    if cur > target then return math.max(cur - inc, target) end
    return target
end
_G.math.ApproachAngle = function(cur, target, inc)
    -- Simplified approach angle for tests
    return target
end
_G.math.NormalizeAngle = function(ang)
    ang = ang % 360
    if ang > 180 then ang = ang - 360 end
    return ang
end
_G.math.AngleDifference = function(a, b)
    local diff = (a - b) % 360
    if diff > 180 then diff = diff - 360 end
    return diff
end

_G.Lerp = function(t, a, b)
    return a + (b - a) * t
end

_G.LerpAngle = function(t, a, b)
    if type(a) == "table" and type(b) == "table" then
        return Angle(
            a.pitch + _G.math.AngleDifference(b.pitch, a.pitch) * t,
            a.yaw + _G.math.AngleDifference(b.yaw, a.yaw) * t,
            a.roll + _G.math.AngleDifference(b.roll, a.roll) * t
        )
    end
    return a
end

_G.LerpVector = function(t, a, b)
    return a + (b - a) * t
end

_G.FrameTime = function() return 0.016 end

-- Vectors
local VectorMeta = {}
VectorMeta.__index = VectorMeta
function VectorMeta.__add(a, b) return Vector(a.x + b.x, a.y + b.y, a.z + b.z) end
function VectorMeta.__sub(a, b) return Vector(a.x - b.x, a.y - b.y, a.z - b.z) end
function VectorMeta.__mul(a, b)
    if type(b) == "number" then return Vector(a.x * b, a.y * b, a.z * b) end
    return Vector(a.x * b.x, a.y * b.y, a.z * b.z)
end
function VectorMeta:Length2D() return math.sqrt(self.x * self.x + self.y * self.y) end
function VectorMeta:Angle() return Angle(0,0,0) end
function VectorMeta:Normalize() end

_G.Vector = function(x, y, z)
    local v = {x = x or 0, y = y or 0, z = z or 0}
    setmetatable(v, VectorMeta)
    return v
end

-- Angles
local AngleMeta = {}
AngleMeta.__index = AngleMeta
_G.Angle = function(p, y, r)
    if type(p) == "table" then return Angle(p.pitch, p.yaw, p.roll) end
    local a = {pitch = p or 0, yaw = y or 0, roll = r or 0}
    setmetatable(a, AngleMeta)
    return a
end
function AngleMeta:Forward() return Vector(1, 0, 0) end
function AngleMeta:Right() return Vector(0, -1, 0) end
function AngleMeta:Up() return Vector(0, 0, 1) end

-- Entities / Player
_G.LocalPlayer = function()
    return {
        Alive = function() return true end,
        InVehicle = function() return false end,
        GetFOV = function() return 90 end,
        Crouching = function() return false end,
        EyePos = function() return Vector(0,0,64) end,
        EyeAngles = function() return Angle(0,0,0) end,
        GetShootPos = function() return Vector(0,0,64) end,
        GetAimVector = function() return Vector(1,0,0) end,
        GetViewOffset = function() return Vector(0,0,64) end,
        GetCurrentViewOffset = function() return Vector(0,0,64) end
    }
end
_G.IsValid = function(ent) return ent ~= nil end

-- Hooks
_G.hook = {
    Add = spy.new(function(event, name, callback) end),
    Call = function(event, ...) end
}

-- Input
_G.input = {
    IsButtonDown = function(btn) return false end,
    GetKeyName = function(btn) return btn == 108 and "MOUSE2" or "UNKNOWN" end,
    LookupBinding = function(bind) return bind == "+attack2" and "mouse2" or nil end
}

-- Traces
_G.util = {
    TraceHull = function(data)
        return { HitPos = data.endpos }
    end
}

_G.MASK_SOLID_BRUSHONLY = "mask_solid_brushonly"
_G.IN_FORWARD = 1
_G.IN_BACK = 2
_G.IN_MOVELEFT = 3
_G.IN_MOVERIGHT = 4

-- Editor Mocks
_G.vgui = {
    Create = function() return {
        SetSize = function() end,
        SetTitle = function() end,
        SetVisible = function() end,
        SetDraggable = function() end,
        ShowCloseButton = function() end,
        MakePopup = function() end,
        SetPos = function() end,
        Add = function() return _G.vgui.Create() end,
        Dock = function() end,
        AddSheet = function() end,
        SizeToContents = function() end,
        SetText = function() end,
        SetTextColor = function() end,
        SetValue = function() end,
        SetNumeric = function() end,
        SetUpdateOnType = function() end,
        SetMin = function() end,
        SetMax = function() end,
        SetDecimals = function() end,
        SetConVar = function() end
    } end
}

_G.list = {
    Set = spy.new(function() end)
}
_G.ScrW = function() return 1920 end
_G.LEFT = 1
_G.Color = function(r,g,b,a) return {r=r,g=g,b=b,a=a} end

_G.AddCSLuaFile = spy.new(function() end)
_G.include = spy.new(function() end)

_G.language = {
    GetPhrase = function(key) return key end
}

_G.gui = {
    MousePos = function() return 100, 100 end
}
