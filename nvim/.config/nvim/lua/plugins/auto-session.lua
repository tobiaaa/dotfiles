return {
    "rmagatti/auto-session",
    --event = "VimEnter",
    enable=false,
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = {"~/", "~/Dev"},
        })

        local map = vim.keymap.set

        map("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session"})
        map("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session" })
    end
}
