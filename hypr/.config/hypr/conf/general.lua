-- See https://wiki.hypr.land/Configuring/Basics/Variables/ for more
hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 20,
        border_size = 2,

        col = {
            active_border   = { colors = { "rgba(CBA6F7DD)", "rgba(F38BA8DD)" }, angle = 45 },
            inactive_border = "rgba(1E1E2E88)",
        },

        layout           = "dwindle",
        resize_on_border = true,
    },
})
