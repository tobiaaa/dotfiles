return {
  "lervag/vimtex",
  lazy = false, -- lazy-loading will disable inverse search
  ft = { "tex" },
  config = function()

    vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover

    -- SyncTeX with Okular.
    -- Forward search (source -> PDF): <localleader>lv. `--unique` reuses the
    -- already-open Okular window instead of spawning a new one.
    -- Inverse search (PDF -> source) is configured in Okular's GUI, not here:
    --   Settings -> Configure Okular -> Editor -> Custom Text Editor:
    --     nvim --headless -c "VimtexInverseSearch %l '%f'"
    -- (`-synctex=1` is already passed by vimtex's default latexmk compiler.)
    vim.g.vimtex_view_method = 'general'
    vim.g.vimtex_view_general_viewer = 'okular'
    vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
    vim.g.vimtex_quickfix_method = vim.fn.executable "pplatex" == 1 and "pplatex" or "latexlog"
    vim.g.vimtex_quickfix_mode = 0 -- let Trouble handle the quickfix window

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
