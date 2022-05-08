config.load_autoconfig(False)
config.set("content.cookies.accept", "all", "chrome-devtools://*")
config.set("content.cookies.accept", "all", "devtools://*")
config.set("content.headers.user_agent",
           "Mozilla/5.0 ({os_info}; rv:90.0) Gecko/20100101 Firefox/90.0", "https://accounts.google.com/*")
config.set("content.images", True, "chrome-devtools://*")
config.set("content.images", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome-devtools://*")
config.set("content.javascript.enabled", True, "devtools://*")
config.set("content.javascript.enabled", True, "chrome://*/*")
config.set("content.javascript.enabled", True, "qute://*/*")

c.tabs.show = "never"
c.tabs.position = "left"
config.bind("<Ctrl-t>", "config-cycle tabs.show always never")
c.url.start_pages = "https://start.duckduckgo.com"
c.url.searchengines = {"DEFAULT": "https://duckduckgo.com/?q={}", "aw": "https://wiki.archlinux.org/?search={}",
                       "aur": "https://aur.archlinux.org/packages/?K={}", "gh": "https://github.com/search?q={}",
                       "doc": "https://docs.rs/{}",
                       "hg": "https://hoogle.haskell.org/?hoogle={}"}
c.auto_save.session = True
c.completion.height = "20%"

# Colors
c.colors.webpage.darkmode.enabled = False

c.fonts.default_family = "FiraCode Nerd Font"
c.fonts.default_size = "9pt"

col_gray1 = "#222222"
col_gray2 = "#444444"
col_gray3 = "#bbbbbb"
col_gray4 = "#eeeeee"
col_hi = "#005577"

c.colors.completion.fg = col_gray3
c.colors.completion.odd.bg = col_gray1
c.colors.completion.even.bg = col_gray1
c.colors.completion.category.fg = col_hi
c.colors.completion.category.bg = "#282c34"
c.colors.completion.item.selected.fg = col_gray4
c.colors.completion.item.selected.bg = col_hi
c.colors.completion.item.selected.border.top = col_hi
c.colors.completion.item.selected.border.bottom = col_hi
c.colors.completion.item.selected.match.fg = col_gray2
c.colors.completion.match.fg = col_hi

c.colors.tabs.even.bg = col_gray1
c.colors.tabs.odd.bg = col_gray1
c.colors.tabs.even.fg = col_gray3
c.colors.tabs.odd.fg = col_gray3
c.colors.tabs.selected.even.bg = col_hi
c.colors.tabs.selected.odd.bg = col_hi
c.colors.tabs.selected.even.fg = col_gray4
c.colors.tabs.selected.odd.fg = col_gray4
