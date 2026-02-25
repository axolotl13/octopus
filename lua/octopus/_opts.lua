local opt = vim.opt
local g = vim.g
local has_ts = pcall(require, "nvim-treesitter")
local has_snacks = pcall(require, "snacks.statuscolumn")

-- opt.autowriteall = true
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)
opt.cmdheight = 0
opt.completeopt = { "menu", "menuone" }
-- opt.confirm = true
opt.cursorline = true
opt.diffopt = vim.list_extend(opt.diffopt:get(), { "indent-heuristic", "algorithm:histogram", "linematch:60" })
opt.expandtab = true
opt.fileencoding = "utf-8"
opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.foldcolumn = "1"
opt.foldenable = true
opt.foldmethod = "expr"
if has_ts then
  opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
end
opt.foldlevel = 99
opt.foldlevelstart = 99
-- opt.foldopen = "block,mark,percent,quickfix,search,tag,undo"
opt.foldtext = ""
opt.guicursor = "n-v-c:blinkon200-blinkoff150,i-ci:ver30-blinkon200-blinkoff150"
opt.ignorecase = true
-- opt.iskeyword = "@,48-57,_,192-255,-,#"
opt.laststatus = 3
opt.list = true
opt.listchars = {
  eol = "󰘌",
  tab = "..",
  lead = " ",
  trail = "·",
  extends = "󰶺",
  precedes = "󰶻",
}
opt.mouse = "a"
opt.mousemoveevent = true
opt.number = true
opt.pumheight = 15
opt.relativenumber = true
opt.scrolloff = 6
opt.shiftwidth = 2
opt.shortmess:append { I = true }
opt.sidescrolloff = 16
opt.smartcase = true
-- opt.smoothscroll = true
opt.splitbelow = true
opt.splitright = true
if has_snacks then
  opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
end
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.timeoutlen = 300
opt.title = true
opt.undofile = true
opt.updatetime = 300
opt.virtualedit = "block"
opt.whichwrap = "b,s,<,>,[,],h,l"
opt.wrap = false
opt.writebackup = false

g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

vim.cmd.colorscheme "default"

if g.neovide then
  opt.guifont = "JetBrainsMonoNL NFM:h13"
  opt.linespace = 0
  opt.winblend = 10
  opt.pumblend = 15
  -- g.neovide_opacity = 0.96
  -- g.neovide_normal_opacity = 0.96
  g.neovide_scale_factor = 1
  g.neovide_text_gamma = 0.0
  g.neovide_text_contrast = 0.8
  g.neovide_floating_shadow = true
  g.neovide_floating_z_height = 15
  g.neovide_light_angle_degrees = 45
  g.neovide_light_radius = 5
  g.neovide_position_animation_length = 0.6
  g.neovide_scroll_animation_length = 0.3
  g.neovide_scroll_animation_far_lines = 1
  g.neovide_hide_mouse_when_typing = true
  g.neovide_underline_stroke_scale = 1.0
  g.neovide_cursor_animation_length = 0.13
  g.neovide_cursor_animate_in_insert_mode = true
  g.neovide_cursor_trail_size = 0.4
  g.neovide_cursor_antialiasing = true
  g.neovide_cursor_vfx_mode = "ripple"
  g.neovide_unlink_border_highlights = true
  g.neovide_remember_window_size = true
  g.neovide_progress_bar_enabled = true
  g.neovide_progress_bar_height = 5.0
  g.neovide_progress_bar_animation_speed = 200.0
  g.neovide_progress_bar_hide_delay = 0.2
  vim.keymap.set({ "n", "i" }, "<c-s-v>", '<esc>l"+Pli')
end
