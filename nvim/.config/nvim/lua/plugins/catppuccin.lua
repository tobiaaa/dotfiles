return {
    "catppuccin/nvim",
    priority = 1000,
    opt = {
        transparent = true
    },
    config = function()
         require("catppuccin").setup({
             custom_highlights = function(colors)
                 return {
                     AlphaShortcut = { fg = colors.red, bg = colors.mauve},
                     AlphaHeader = { fg = colors.red, bg = colors.mauve},
                 }
             end
         })
     end
}
