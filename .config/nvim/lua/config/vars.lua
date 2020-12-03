local gvars = {
  gruvbox_filetype_hi_groups  = 0;
  gruvbox_material_palette    = "original";
  loaded_2html_plugin         = 0;
  loaded_pkgbuild_plugin      = 0;
  loaded_tutor_mode_plugin    = 0;
  mapleader                   = " ";
  maplocalleader              = ",";
  pear_tree_ft_disabled       = {'TelescopePrompt'};
  pear_tree_smart_backspace   = 1;
  pear_tree_smart_closers     = 1;
  pear_tree_smart_openers     = 1;
  pear_tree_repeatable_expand = 0;
  tex_flavor                  = "latex";
  vista_default_executive     = 'nvim_lsp';
  vista_executive_for         = { vimwiki = 'markdown', pandoc = 'markdown', markdown = 'toc' };
}

for name, value in pairs(gvars) do
  vim.g[name] = value
end
