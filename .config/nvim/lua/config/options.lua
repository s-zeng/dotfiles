local options = {
  autoindent=true;
  backspace="indent,eol,start";
  completeopt="menuone,noinsert,noselect";
  cursorline=true;
  expandtab=true;
  foldlevel=99;
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
  updatetime=300;
  virtualedit="block";
  wrap=false;
}

-- vim.o is not as good as :set
-- :set sets both global and local
-- but vim.o only sets global
-- so we have to reset certain options locally to get it to work
-- TODO: check for the better vim.opts api w/ 5.0 stable

local buffer_options = {
  expandtab=true;
  shiftwidth=4;
  tabstop=4;
}

local window_options = {
  linebreak=true;
  number=true;
  relativenumber=true;
  signcolumn="number";
  wrap=false;
}


for name, value in pairs(options) do
  vim.o[name] = value
end

for name, value in pairs(window_options) do
  vim.wo[name] = value
end

for name, value in pairs(buffer_options) do
  vim.bo[name] = value
end
