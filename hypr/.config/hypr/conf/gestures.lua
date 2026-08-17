-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- Gestures are no longer a config section; each one is declared with hl.gesture().
-- The old `gestures { workspace_swipe = true }` is now:

-- hl.gesture({
--     fingers   = 3,
--     direction = "horizontal",
--     action    = "workspace",
-- })
