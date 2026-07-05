
local function moved_2_new_ws()
    -- find the active window
    local w = hl.get_active_window()
    if w ~= nil then
        -- moved to new workspace
        hl.dispatch(hl.dsp.window.move({ workspace = "emptynm", follow = true, window = w }))
    end 
end

hl.bind("SUPER + comma", moved_2_new_ws)
