local opts = {

  -- Opciones de Sangría
  expandtab = true,
  shiftwidth = 2,
  smartindent = true,

  -- Opciones de Búsqueda
  smartcase = true,

  -- Opciones de Renderizado de Texto
  encoding = "utf-8",
  guifont = "Victor Mono:h15",

  -- Opciones de Menú
  completeopt = "menuone,noselect",
  pumheight = 10,

  -- Opciones de Interfaz de Usuario
  background = "dark",
  cursorcolumn = false,
  cursorline = true,
  fillchars = "eob: ",
  foldenable = false,
  list = true,
  listchars = "eol:↩,trail:·,lead:·,tab:..",
  mouse = "a",
  number = true,
  relativenumber = true,
  showmode = false,
  termguicolors = true,
  title = true,
  wrap = false,
  guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20',

  -- Opciones Misceláneas
  backup = false,
  clipboard = "unnamedplus",
  hidden = true,
  laststatus = 3,
  iskeyword = "@,48-57,_,192-255,-",
  splitbelow = true,
  splitright = true,
  -- spell = true,
  spelllang = "en,es",
  swapfile = false,
  scrolloff = 12,
  sidescrolloff = 10,
  undofile = true,
  writebackup = false,
  whichwrap = "b,s,<,>,[,],h,l",
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,terminal",

  -- Opciones de Rendimiento
  -- redrawtime = 1500,
  timeoutlen = 300,
  -- ttimeoutlen = 10,
  updatetime = 100,

}

return opts
