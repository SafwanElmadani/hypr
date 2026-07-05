-- After a workspace is destroyed, renumber all regular workspaces to 1..N.

local function compact()
    -- hl.notification.create({ text = "WS removed", timeout = 5000, icon = "ok" })
    local list = {}
    for _, ws in ipairs(hl.get_workspaces()) do
        if ws.id > 0 and not ws.special then
            table.insert(list, ws)
        end
    end

    table.sort(list, function(a, b)
        return a.id < b.id
    end)

    for i, ws in ipairs(list) do
        if ws.id ~= i then
            print("safwan_debug: " ..  "workspace id:" .. ws.id, "moved to index:" .. i) 
            hl.dispatch(hl.dsp.workspace.change_id({ workspace = tostring(ws.id), id = i }))
        end
    end
end

hl.on("workspace.removed", function()
    compact()
    -- the following is needed to update the workspaces in the dms bar and waybar
    hl.exec_cmd("hyprctl reload")
end)
