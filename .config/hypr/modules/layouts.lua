---------------
--- LAYOUTS ---
---------------

-- for i = 1, 4 do
-- 	hl.workspace_rule({
-- 		workspace = tostring(i),
-- 		monitor = "eDP-1",
-- 		persistent = true,
-- 	})
-- end

-- for i = 5, 8 do
-- 	hl.workspace_rule({
-- 		workspace = tostring(i),
-- 		monitor = "HDMI-A-2",
-- 		persistent = true,
-- 	})
-- end

hl.config({
  master = {
    new_status = "slave",
    mfact = 0.5,
    special_scale_factor = 2.1,
  },
})
