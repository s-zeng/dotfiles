local autocmds = {
  {cond="BufNewFile, BufRead", cmd ={pattern="*.ghci", command="set filetype=haskell"}},
  {cond="Filetype", cmd ={ pattern="markdown", command="set tw=80 formatoptions+=wn2 spell shiftwidth=2 tabstop=2"}},
  {cond="Filetype", cmd ={ pattern="ruby", command="set shiftwidth=2 tabstop=2"}},
  {cond="Filetype", cmd ={ pattern="lua", command="set shiftwidth=2 tabstop=2"}},
  {cond="Filetype", cmd ={ pattern="scheme", command="set lispwords+=match lispwords-=if"}},
  {cond="Filetype", cmd ={ pattern="tex", command="set tw=80 formatoptions+=wn2 spell"}},
  {cond="TabLeave", cmd ={ pattern="*", command="let g:lasttab = tabpagenr()"}},
  {cond="TermClose", cmd ={ pattern="*", command=[[exe "bd! " . expand('<abuf>')]]}},
  {cond="TermClose", cmd ={ pattern="*", command="setlocal number relativenumber"}},
  {cond="TermEnter", cmd ={ pattern="*", command="setlocal scrolloff=0"}},
  {cond="TermLeave", cmd ={ pattern="*", command="setlocal scrolloff=999999"}},
  {cond="TermOpen", cmd ={ pattern="*", command="setlocal nonumber norelativenumber nospell"}},
  {cond="CompleteDone", cmd ={ pattern="*", command="silent! pclose!"}},
  {cond="CursorHold", cmd ={ pattern="<buffer>", callback = vim.lsp.diagnostic.show_line_diagnostics}},
  {cond="CursorHoldI", cmd ={ pattern="<buffer>", callback =vim.lsp.diagnostic.show_line_diagnostics}},
  {cond="FileType", cmd ={ pattern="json", command=[[syntax match Comment +\/\/.\+$+]]}},
  {cond="FileType", cmd ={ pattern="lisp,clojure,scheme,racket", command="set lisp"}},
  {cond="TextYankPost", cmd ={ pattern="*", command="silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank{timeout=300}"}},
}

for i, cmd in ipairs(autocmds) do
  vim.api.nvim_create_autocmd(cmd.cond, cmd.cmd)
end
