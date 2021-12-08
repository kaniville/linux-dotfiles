-- Telescope
vim.cmd('nnoremap <M-f> <cmd>Telescope find_files<CR>')
vim.cmd('nnoremap <M-e> <cmd>Telescope buffers<CR>')
vim.cmd('nnoremap <M-h> <cmd>Telescope command_history<CR>')
vim.cmd('nnoremap <M-c> <cmd>Telescope git_commits<CR>')

-- Nvim Tree
vim.cmd('nnoremap <M-t> <cmd>NvimTreeToggle<CR>')

-- Preview Markdown
vim.cmd('nnoremap <M-m> <cmd>MarkdownPreviewToggle<CR>')

-- Go to next/previous buffer in buffer list
--vim.cmd('nnoremap <TAB> <cmd>bnext<CR>')
--vim.cmd('nnoremap <S-TAB> <cmd>bprevious<CR>')

-- Use jk or kj to escape
vim.cmd ('inoremap jk <Esc>')
vim.cmd ('inoremap kj <Esc>')
