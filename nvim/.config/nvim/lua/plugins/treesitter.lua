return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        -- New nvim-treesitter only manages parser installation.
        -- Highlighting is handled automatically by vim.treesitter when a parser is present.
        -- Ensure parsers are installed on startup.
        local ensure_installed = {
            "json", "yaml", "markdown", "markdown_inline",
            "bash", "python", "lua", "latex",
        }
        local installed = require("nvim-treesitter.config").get_installed()
        local to_install = vim.tbl_filter(function(lang)
            return not vim.tbl_contains(installed, lang)
        end, ensure_installed)
        if #to_install > 0 then
            require("nvim-treesitter").install(to_install)
        end

        -- Use nvim-treesitter's indent expression where supported
        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                if pcall(vim.treesitter.start) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
