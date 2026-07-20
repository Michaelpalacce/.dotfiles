---------------
--- SUBMAPS ---
---------------

local mainMod = "SUPER"

-- Switch to a submap called `resize`.
hl.bind("ALT + r", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    -- Set repeatable binds for resizing the active window.
    hl.bind("right", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
    hl.bind("left", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
    hl.bind("up", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
    hl.bind("down", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

    -- Use `escape` to go back to the global submap
    hl.bind("escape", hl.dsp.submap("reset"))
end)
