return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  ft = { "tex" },
  config = function()

    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover

    -- vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_view_general_viewer = ''
    vim.g.vimtex_quickfix_method = vim.fn.executable "pplatex" == 1 and "pplatex" or "latexlog"
    vim.g.vimtex_quickfix_open_on_warning = 0 -- let Trouble handle the quickfix window

    -- Suppress Trouble's warning about missing latex treesitter parser (latex requires
    -- tree-sitter generate which is incompatible with the installed CLI version)
    local orig_notify = vim.notify
    vim.notify = function(msg, level, opts)
      if type(msg) == "string" and msg:match("parser missing `latex`") then return end
      orig_notify(msg, level, opts)
    end

    -- Auto-open Trouble qflist after VimTeX compilation
    vim.api.nvim_create_autocmd("User", {
      pattern = { "VimtexEventCompileSuccess", "VimtexEventCompileFailed" },
      callback = function()
        local ok, trouble = pcall(require, "trouble")
        if not ok then return end
        local qf = vim.fn.getqflist()
        if #qf > 0 then
          trouble.open({ mode = "qflist" })
        else
          trouble.close()
        end
      end,
    })
  end,
  keys = {
    { "<localLeader>l", "", desc = "+vimtext" },
  },
}
