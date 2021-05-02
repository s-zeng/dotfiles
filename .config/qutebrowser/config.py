config.source('qutewal.py')
c.url.start_pages = ["file:///home/kronicmage/repos/startpage/index.html"]
c.url.default_page = "file:///home/kronicmage/repos/startpage/index.html"
c.url.searchengines = {"DEFAULT": "https://google.ca/search?q={}"}
c.tabs.background = True
c.editor.command = ['/usr/bin/kitty', '/usr/bin/nvim', '{}']
c.tabs.show = 'multiple'
c.aliases = {
    "q": "close",
    "qa": "quit",
    "w": "session-save",
    "wq": "quit --save",
    "wqa": "quit --save",
    "pass": "spawn --userscript qute-pass",
    "getbib": "spawn --userscript getbib",
    "json": "spawn --userscript format_json",
    "read": "spawn --userscript readability",
    "read_extern": "open https://outline.com/{url}",
    "dl": "spawn --userscript open_download"
}
c.colors.webpage.bg = ""
# c.content.user_stylesheets = ['~/.config/qutebrowser/css/gruvbox-all-sites.css'] 
config.bind('<Ctrl-R>', 'config-cycle content.user_stylesheets "~/.config/qutebrowser/css/apprentice-all-sites.css" "~/.config/qutebrowser/css/darculized-all-sites.css" "~/.config/qutebrowser/css/gruvbox-all-sites.css" "~/.config/qutebrowser/css/solarized-dark-all-sites.css" "~/.config/qutebrowser/css/solarized-light-all-sites.css" ""')
config.bind('cn', 'config-cycle content.user_stylesheets "~/.config/qutebrowser/css/gruvbox-all-sites.css" ""')


config.load_autoconfig(False)
