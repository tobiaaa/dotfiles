return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Set header
        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button( "e", "󰈔  > New file" , "<cmd>ene<CR>"),
            dashboard.button( "SPC ee", "󰈔  > Toggle file explorer" , "<cmd>NvimTreeToggle<CR>"),
            dashboard.button( "SPC sr", "󰁯  > Restore session for current directory" , "<cmd>SessionRestore<CR>"),
            dashboard.button( "SPC ff", "󰱼  > Find file", "<cmd>Telescope find_files<CR>"),
            dashboard.button( "SPC fr", "󱋡  > Find recent"   , "<cmd>Telescope oldfiles<CR>"),
            dashboard.button( "q", "󰈆  > Quit NVIM", "<cmd>qa<CR>"),
        }

        alpha.setup(dashboard.opts)
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

    end
}
