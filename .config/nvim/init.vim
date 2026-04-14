set termguicolors
set number
set expandtab
set tabstop=4
set shiftwidth=4

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'nvim-tree/nvim-web-devicons'
    " Este es el port correcto para Neovim
    Plug 'Ferouk/bearded-nvim'
call plug#end()

lua << END
-- Intentamos cargar el tema solo si el plugin existe
local status_ok, bearded = pcall(require, "bearded-nvim")
if status_ok then
    bearded.setup({
        variant = 'surprising-watermelon',
    })
    vim.cmd("colorscheme bearded-surprising-watermelon")
else
    print("Esperando a que se instale bearded-nvim...")
end

-- Configuración de Lualine
local lualine_ok, lualine = pcall(require, "lualine")
if lualine_ok then
    lualine.setup({
        options = { 
            theme = 'auto',
            icons_enabled = true
        }
    })
end
END
set termguicolors
colorscheme bearded-surprising-watermelon
" --- Transparencia Total ---
highlight Normal guibg=none
highlight NonText guibg=none
highlight NormalNC guibg=none
highlight StatusLine guibg=none
highlight StatusLineNC guibg=none
highlight SignColumn guibg=none
highlight EndOfBuffer guibg=none
