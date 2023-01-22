local opts = {
  expandtab = true,                                     -- Convertir tabulaciones en espacios
  shiftwidth = 2,                                       -- Número de espacios insertados de sangría
  smartindent = true,                                   -- Insertar sangría automáticamente
  smartcase = true,                                     -- No ignora el caso con mayúsculas
  ignorecase = false,                                   -- Ignorar mayúsculas y minúsculas en las búsquedas
  encoding = "utf-8",                                   -- Define la codificación
  guifont = "Victor Mono:h15",                          -- Define la fuente para las apps
  completeopt = "menuone,noselect",                     -- Opción principalmente para cmp
  pumheight = 10,                                       -- Altura del menú emergente
  background = "dark",
  conceallevel = 0,                                     -- Permite que `` sea visible en markdown
  cursorcolumn = false,                                 -- Desactiva el resaltado del cursor
  cursorline = true,                                    -- Resalta la línea actual
  fillchars = "eob: ",
  foldenable = false,
  list = true,                                          -- Muestra algunos caractares invisibles
  listchars = "eol:↩,trail:·,lead:·,tab:..",
  mouse = "a",                                          -- Permite usar mouse
  number = true,                                        -- Mostrar líneas numeradas
  relativenumber = true,                                -- Mostrar líneas numeradas relativas
  showmode = false,                                     -- Oculta -- INSERTAR
  termguicolors = true,                                 -- Permite los colores de ui
  title = true,                                         -- Establecer el título de la ventana
  wrap = false,                                         -- Mostrar líneas como una línea larga
  backup = false,                                       -- Crea un archivo de copia de seguridad
  clipboard = "unnamedplus",                            -- Permite acceder al portapapeles del sistema
  hidden = true,                                        -- Habilitar búferes modificados en segundo plano
  laststatus = 3,                                       -- Establece solo 1 línea de estado
  iskeyword = "@,48-57,_,192-255,-",
  splitbelow = true,                                    -- Obligar a todas las divisiones horizontales a ir debajo
  splitright = true,                                    -- Obligar a todas las divisiones verticales a ir a la derecha
  -- spell = true,
  spelllang = "en,es",
  swapfile = false,                                     -- Crea un archivo de intercambio
  scrolloff = 6,                                        -- Número mínimo de líneas encima y debajo del cursor
  sidescrolloff = 6,                                    -- Número mínimo de líneas izquierda y derecha del cursor
  undofile = true,                                      -- Habilitar deshacer persistente
  writebackup = false,                                  -- Habilita archivos protegidos para que no se edite 2 veces
  whichwrap = "b,s,<,>,[,],h,l",
  timeoutlen = 300,                                     -- Tiempo de espera para que se complete una secuencia mapeada
  updatetime = 300,                                     -- Finalización más rápida
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
  guicursor = 'n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor20',
}

local opt = vim.opt

opt.shortmess:append("sI")                              -- Elimina los mensajes al inicio
opt.shortmess = opt.shortmess + { c = true }

for _, k in pairs(opts) do
  opt[_] = k
end
