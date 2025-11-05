local opt = vim.opt
local g = vim.g

-- opt.autowriteall = true
opt.background = "dark"
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)
opt.cmdheight = 0
opt.completeopt = { "menu", "menuone" }
-- opt.confirm = true
opt.cursorline = true
vim.opt.diffopt = "internal,filler,closeoff,indent-heuristic,linematch:60,algorithm:histogram"
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
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldopen = "block,mark,percent,quickfix,search,tag,undo"
opt.foldtext = ""
opt.guicursor = "n-v-c:blinkon200-blinkoff150,i-ci:ver30-blinkon200-blinkoff150"
opt.ignorecase = false
opt.iskeyword = "@,48-57,_,192-255,-,#"
opt.laststatus = 3
if opt.wrap then
  vim.opt.linebreak = true
end
opt.list = true
opt.listchars = {
  eol = "󰘌",
  tab = "..",
  lead = "·",
  trail = "·",
  extends = "󰶺",
  precedes = "󰶻",
}
opt.mouse = "a"
opt.mousemoveevent = true
opt.number = true
opt.pumheight = 15
if opt.number then
  opt.relativenumber = true
end
opt.scrolloff = 6
opt.shiftwidth = 2
opt.shortmess:append { s = true, I = true, c = true }
if opt.cmdheight ~= "0" then
  opt.showmode = false
end
opt.sidescrolloff = 16
if opt.ignorecase then
  opt.smartcase = true
end
-- opt.smoothscroll = true
opt.splitbelow = true
opt.splitright = true
-- opt.startofline = true
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
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

vim.cmd "colorscheme habamax"

if g.neovide then
  opt.guifont = "JetBrainsMonoNL NFM:h13"
  opt.linespace = 0
  opt.winblend = 10
  opt.pumblend = 15
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
  vim.keymap.set({ "n", "i" }, "<c-s-v>", '<esc>l"+Pli')
end
