-- See https://wiki.hypr.land/Configuring/Basics/Variables/#group
hl.config({
    group = {
        col = {
            border_active   = { colors = { "rgba(CBA6F7DD)", "rgba(F38BA8DD)" }, angle = 45 },
            border_inactive = "rgba(1E1E2E88)",
        },

        groupbar = {
            height              = 18,
            font_size           = 14,
            text_color          = "rgba(CDD6F4FF)",
            text_color_inactive = "rgba(CBA6F7DD)",

            col = {
                active   = { colors = { "rgba(CBA6F7DD)", "rgba(F38BA8DD)" }, angle = 45 },
                inactive = "rgba(1E1E2E88)",
            },
        },
    },
})
