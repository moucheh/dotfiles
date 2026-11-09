# pyright: reportUndefinedVariable=false

#              _       _                                     
#   __ _ _   _| |_ ___| |__  _ __ _____      _____  ___ _ __ 
#  / _` | | | | __/ _ \ '_ \| '__/ _ \ \ /\ / / __|/ _ \ '__|
# | (_| | |_| | ||  __/ |_) | | | (_) \ V  V /\__ \  __/ |   
#  \__, |\__,_|\__\___|_.__/|_|  \___/ \_/\_/ |___/\___|_|   
#     |_|                                                    

config.load_autoconfig(True)
config.source('noctalia/colors.py')

c.url.start_pages = ["https://start.duckduckgo.com/"]

c.colors.webpage.preferred_color_scheme = "dark"
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "smart"
c.colors.webpage.darkmode.policy.page = "smart"

c.tabs.show = "multiple"
c.tabs.position = "left"
c.tabs.width = 50
c.tabs.last_close = "blank"
c.tabs.favicons.show = "always"
c.tabs.favicons.scale = 2.0
c.tabs.title.format = "{audio}{current_title}"
c.tabs.title.alignment = "left"
c.tabs.title.elide = "right"
c.tabs.padding = {
    "top": 8,
    "bottom": 8,
    "left": 10,
    "right": 10
}
c.tabs.new_position.related = "next"
c.tabs.select_on_remove = "last-used"
c.tabs.tooltips = True

c.statusbar.show = "in-mode"

c.scrolling.smooth = True

c.content.autoplay = False

config.bind(",d", "config-cycle colors.webpage.darkmode.enabled")
config.bind(",v", "config-cycle tabs.width 50 230")

config.bind("J", "tab-prev")
config.bind("K", "tab-next")
config.bind("x", "tab-close")
config.bind("X", "undo")
config.bind("H", "back")
config.bind("L", "forward")

config.unbind("d")

config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')
