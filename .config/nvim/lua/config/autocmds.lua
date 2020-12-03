local autocmds = {
  {cond="BufNewFile,BufRead", ft="*.ghci", action="set filetype=haskell"},
  {cond="Filetype", ft="markdown", action="set tw=80 formatoptions+=wn2 spell shiftwidth=2 tabstop=2"},
  {cond="Filetype", ft="ruby", action="set shiftwidth=2 tabstop=2"},
  {cond="Filetype", ft="lua", action="set shiftwidth=2 tabstop=2"},
  {cond="Filetype", ft="scheme", action="set lispwords+=match lispwords-=if"},
  {cond="Filetype", ft="tex", action="set tw=80 formatoptions+=wn2 spell"},
  {cond="TabLeave", ft="*", action="let g:lasttab = tabpagenr()"},
  {cond="TermClose", ft="*", action=[[exe "bd! " . expand('<abuf>')]]},
  {cond="TermClose", ft="*", action="setlocal number relativenumber"},
  {cond="TermEnter", ft="*", action="setlocal scrolloff=0"},
  {cond="TermLeave", ft="*", action="setlocal scrolloff=999999"},
  {cond="TermOpen", ft="*", action="setlocal nonumber norelativenumber nospell"},
  {cond="CompleteDone", ft="*", action="silent! pclose!"},
  {cond="CursorHold", ft="<buffer>", action="lua vim.lsp.diagnostic.show_line_diagnostics()"},
  {cond="CursorHoldI", ft="<buffer>", action="lua vim.lsp.diagnostic.show_line_diagnostics()"},
  {cond="FileType", ft="json", action=[[syntax match Comment +\/\/.\+$+]]},
  {cond="FileType", ft="lisp,clojure,scheme,racket", action="set lisp"},
  {cond="TextYankPost", ft="*", action="silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank{timeout=300}"},
}

-- TODO: wait on https://github.com/neovim/neovim/pull/12378
for i, cmd in ipairs(autocmds) do
  vim.cmd(table.concat({"autocmd", cmd.cond, cmd.ft, cmd.action}, " "))
end
