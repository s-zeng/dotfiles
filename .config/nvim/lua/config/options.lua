local options = {
  autoindent=true;
  backspace="indent,eol,start";
  completeopt="menuone,noinsert,noselect";
  foldlevel=99;
  foldmethod="indent";
  guifont="JetBrainsMono Nerd Font Mono:h13";
  hidden=true;
  hlsearch=true;
  inccommand="split";
  lazyredraw=true;
  mouse="nvi";
  pastetoggle="<F2>";
  scrolloff=999999;
  shada="'20,<50,s10";
  shortmess="aoOTIcF";
  showmatch=true;
  sidescrolloff=5;
  smartcase=true;
  smarttab=true;
  splitbelow=true;
  splitright=true;
  termguicolors=true;
  timeout=true;
  timeoutlen=300;
  updatetime=300;
  virtualedit="block";
}

-- vim.o is not as good as :set
-- :set sets both global and local
-- but vim.o only sets global
-- so we have to reset certain options locally to get it to work
-- TODO: check for the better vim.opts api w/ 5.0 stable https://github.com/neovim/neovim/issues/13433

local buffer_options = {
  expandtab=true;
  shiftwidth=4;
  tabstop=4;
}

local window_options = {
  cursorline=true;
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
  vim.o[name] = value
  vim.wo[name] = value
end

for name, value in pairs(buffer_options) do
  vim.o[name] = value
  vim.bo[name] = value
end
