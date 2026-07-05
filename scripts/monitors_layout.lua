-- Home desk monitor setup via Lua events (replaces kanshi).
-- Load it from hyprland.lua when you want it active:
--     require("scripts.monitors_layout")
--
-- Registers monitor.added / monitor.removed / hyprland.start handlers that
-- detect the home displays and apply their layout, with a fallback otherwise.

-- ---- Monitor definitions -------------------------------------------------

local sceptre = {
    output = "desc:Sceptre Tech Inc Sceptre F27 0x01010101",
    mode = "1920x1080@100",
    position = "0x0",
    scale = 1,
    transform = 3,
    disabled = false,
}

local philips = {
    output = "desc:Philips Consumer Electronics Company PHL 271V8LB UK02439053050",
    mode = "1920x1080@60",
    position = "1080x0",
    scale = 1,
    disabled = false,
}

local asus_home = {
    output = "desc:Ancor Communications Inc VG248 J5LMQS169912",
    mode = "1920x1080@60",
    position = "3000x0",
    scale = 1,
    disabled = false,
}

local asus_lab = {
    output = "desc:Ancor Communications Inc ASUS PB287Q 0x0001FDDD",
    mode = "2560x1440",
    position = "0x0",
    scale = 1,
    disabled = false,
}

local lenovo = {
    output = "desc:Lenovo Group Limited T27h-30 V5MWX659",
    mode = "2560x1440",
    position = "-1440x0",
    scale = 1,
    transform = 1,
    disabled = false,
}

local random = {
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
}

-- internal laptop panel, used in the fallback
local laptopMonitor = {
    output = "desc:Samsung Display Corp. 0x4164",
    mode = "preferred",
    position = "0x0",
    scale = 2,
    disabled = false,
}

local homeMonitors = { sceptre, philips, asus_home }

local labMonitors = { asus_lab, lenovo }

-- ---- Detection -----------------------------------------------------------

-- a monitor is "present" if any connected monitor matches its output selector.
-- handles "desc:..." (matched against m.description) and plain names (m.name).
local function isConnected(mon)
    local want = mon.output:gsub("^desc:", "")   -- strip the desc: prefix
    for _, m in ipairs(hl.get_monitors()) do
        if m.name == mon.output then return true end                -- plain-name match
        if m.description == want then return true end                -- exact description
        if m.description:sub(1, #want) == want then return true end  -- description has "(port)" suffix
    end
    return false
end

local function allMonitorsPresent(mons)
    for _, mon in ipairs(mons) do
        if not isConnected(mon) then return false end
    end
    return true
end

-- ---- Apply ---------------------------------------------------------------

local function applyMonitorSetup()
    -- this is for home office
    if allMonitorsPresent(homeMonitors) then
        for _, mon in ipairs(homeMonitors) do
            hl.monitor(mon)
        end
        hl.monitor({ output = laptopMonitor.output, disabled = true })
        hl.notification.create({ text = "home setup", timeout = 4000 })
    -- this is for lab setup
    elseif allMonitorsPresent(labMonitors) then
        for _, mon in ipairs(labMonitors) do
            hl.monitor(mon)
        end
        hl.monitor({ output = laptopMonitor.output, disabled = true })
        hl.notification.create({ text = "lab setup", timeout = 4000 })
    -- this is when plugin any random monitor (laptop + one unknown external)
    elseif (#hl.get_monitors() == 2) then
        hl.monitor(random)
        hl.monitor(laptopMonitor)  -- re-apply so the catch-all doesn't downscale the laptop
        hl.notification.create({ text = "random monitor", timeout = 4000 })
    -- else
    --     -- fallback action when the home monitors aren't all there
    --     hl.monitor(laptopMonitor)
    --     hl.notification.create({ text = "laptop monitor only", timeout = 4000 })
    end
end

-- ---- Event hooks ---------------------------------------------------------

-- the dock fires monitor.added once per display; re-check on every add/remove
-- hl.on("monitor.added",   function(_) applyMonitorSetup() end)
-- hl.on("monitor.removed", function(_) applyMonitorSetup() end)
--
-- -- also run at startup in case the dock is already plugged in at login
-- hl.on("hyprland.start",  function() applyMonitorSetup() end)

-- ---- Exports -------------------------------------------------------------

-- expose the monitor tables so other files (e.g. the lid handlers) can reuse them
return {
    sceptre       = sceptre,
    philips       = philips,
    asus_home     = asus_home,
    asus_lab      = asus_lab,
    lenovo        = lenovo,
    random        = random,
    laptopMonitor = laptopMonitor,
}
