local options = {
  autoindent=true;
  backspace="indent,eol,start";
  completeopt="menuone,noinsert,noselect";
  cursorline=true;
  expandtab=true;
  foldexpr="nvim_treesitter#foldexpr()";
  foldlevel=99;
  -- foldmethod="expr";
  foldmethod="indent";
  guifont="JetBrainsMono Nerd Font Mono:h13";
  hidden=true;
  hlsearch=true;
  inccommand="split";
  lazyredraw=true;
  linebreak=true;
  mouse="nvi";
  number=true;
  pastetoggle="<F2>";
  relativenumber=true;
  scrolloff=999999;
  shada="'20,<50,s10";
  shiftwidth=4;
  shortmess="aoOTIcF";
  showmatch=true;
  sidescrolloff=5;
  signcolumn="number";
  smartcase=true;
  smarttab=true;
  splitbelow=true;
  splitright=true;
  tabstop=4;
  termguicolors=true;
  timeout=true;
  timeoutlen=300;
  -- updatetime=300;
  virtualedit="block";
  wrap=false;
}


for name, value in pairs(options) do
  vim.o[name] = value
end
