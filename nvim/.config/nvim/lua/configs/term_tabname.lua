-- Rename :term buffers based on the program's terminal title (b:term_title)
-- so NvChad's tabufline shows a meaningful label (e.g. "claude") instead of
-- the default "12345:/bin/bash".
--
-- tabufline derives the tab label from the buffer's basename
-- (see nvchad/tabufline/utils.lua -> filename(buf_name(nr))), so renaming the
-- buffer is enough for the label to update.

local M = {}

-- Rules matched (substring, case-insensitive) against b:term_title.
-- The first match wins. Add your own entries here.
local rules = {
  { pat = "claude", label = "claude" },
  -- { pat = "lazygit", label = "lazygit" },
  -- { pat = "btop",    label = "btop" },
}

local function label_from_title(title)
  if not title or title == "" then
    return nil
  end
  local t = title:lower()
  for _, r in ipairs(rules) do
    if t:find(r.pat, 1, true) then
      return r.label
    end
  end
  return nil -- no match -> leave the default NvChad name untouched
end

local function apply(buf)
  if not vim.api.nvim_buf_is_valid(buf) or vim.bo[buf].buftype ~= "terminal" then
    return
  end

  local label = label_from_title(vim.b[buf].term_title)
  if not label then
    return
  end

  local cur = vim.api.nvim_buf_get_name(buf)
  if cur:match "([^/\\]+)$" == label then
    return -- already labelled, avoid needless renames
  end

  -- Embed the buffer id in the path so two same-named terminals don't collide
  -- on E95; tabufline only shows the basename, so the label stays clean.
  pcall(vim.api.nvim_buf_set_name, buf, "term://" .. buf .. "/" .. label)
  pcall(vim.cmd.redrawtabline)
end

local timer
local running = false

local function poll()
  local found = false
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "terminal" then
      found = true
      apply(buf)
    end
  end
  -- Stop polling once no terminals remain; TermOpen restarts it.
  if not found then
    timer:stop()
    running = false
  end
end

local function start()
  if running then
    return
  end
  timer = timer or (vim.uv or vim.loop).new_timer()
  running = true
  timer:start(500, 1500, vim.schedule_wrap(poll))
end

function M.setup()
  local group = vim.api.nvim_create_augroup("TermTabName", { clear = true })
  vim.api.nvim_create_autocmd("TermOpen", {
    group = group,
    callback = function(a)
      vim.schedule(function()
        apply(a.buf)
      end)
      start()
    end,
  })
end

return M
