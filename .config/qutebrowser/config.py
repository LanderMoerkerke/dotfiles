#    ____        _       _
#   / __ \      | |     | |
#  | |  | |_   _| |_ ___| |__  _ __ _____      _____  ___ _ __
#  | |  | | | | | __/ _ \ '_ \| '__/ _ \ \ /\ / / __|/ _ \ '__|
#  | |__| | |_| | ||  __/ |_) | | | (_) \ V  V /\__ \  __/ |
#   \___\_\\__,_|\__\___|_.__/|_|  \___/ \_/\_/ |___/\___|_|
#
#
#
# pylint: disable=C0111

import catppuccin

from qutebrowser.api import interceptor

c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {
    "w": "session-save",
    "q": "quit",
    "wq": "quit --save",
    "burp": "set content.proxy http://127.0.0.1:8080/",
    "tor": "set content.proxy socks://localhost:9050/",
    "noproxy": "set content.proxy system",
    "mpv": "spawn -d mpv --force-window=immediate {url}",
}

# How often (in milliseconds) to auto-save config/cookies/etc.
# Type: Int
# c.auto_save.interval = 15000

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# The backend to use to display websites. qutebrowser supports two
# different web rendering engines / backends, QtWebKit and QtWebEngine.
# QtWebKit was discontinued by the Qt project with Qt 5.6, but picked up
# as a well maintained fork: https://github.com/annulen/webkit/wiki -
# qutebrowser only supports the fork. QtWebEngine is Qt's official
# successor to QtWebKit. It's slightly more resource hungry that
# QtWebKit and has a couple of missing features in qutebrowser, but is
# generally the preferred choice. This setting requires a restart.
# Type: String
# Valid values:
# - webengine: Use QtWebEngine (based on Chromium)
# - webkit: Use QtWebKit (based on WebKit, similar to Safari)
c.backend = "webengine"

# This setting can be used to map keys to other keys. When the key used
# as dictionary-key is pressed, the binding for the key used as
# dictionary-value is invoked instead. This is useful for global
# remappings of keys, for example to map Ctrl-[ to Escape. Note that
# when a key is bound (via `bindings.default` or `bindings.commands`),
# the mapping is ignored.
# Type: Dict
c.bindings.key_mappings = {
    "<Ctrl-[>": "<Escape>",
    "<Ctrl-6>": "<Ctrl-^>",
    "<Ctrl-M>": "<Return>",
    "<Ctrl-J>": "<Return>",
    "<Shift-Return>": "<Return>",
    "<Enter>": "<Return>",
    "<Shift-Enter>": "<Return>",
    "<Ctrl-Enter>": "<Ctrl-Return>",
}

# How many commands to save in the command history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.cmd_history_max_items = 100

# The height of the completion, in px or as percentage of the window.
# Type: PercOrInt
c.completion.height = "20%"

# Move on to the next part when there's only one possible completion
# left.
# Type: Bool
c.completion.quick = True

# Padding of scrollbar handle in the completion window (in px).
# Type: Int
c.completion.scrollbar.padding = 2

# Width of the scrollbar in the completion window (in px).
# Type: Int
c.completion.scrollbar.width = 12

# When to show the autocompletion window.
# Type: String
# Valid values:
# - always: Whenever a completion is available.
# - auto: Whenever a completion is requested.
# - never: Never.
c.completion.show = "always"

# Shrink the completion to be smaller than the configured size if there
# are no scrollbars.
# Type: Bool
c.completion.shrink = False

# How to format timestamps (e.g. for the history completion).
# Type: TimestampTemplate
c.completion.timestamp_format = "%Y-%m-%d"

# How many URLs to show in the web history. 0: no history / -1:
# unlimited
# Type: Int
c.completion.web_history.max_items = -1

# Whether quitting the application requires a confirmation.
# Type: ConfirmQuit
# Valid values:
# - always: Always show a confirmation.
# - multiple-tabs: Show a confirmation if multiple tabs are opened.
# - downloads: Show a confirmation if downloads are running
# - never: Never show a confirmation.
c.confirm_quit = ["multiple-tabs", "downloads"]

# Size of the HTTP network cache. Null to use the default value. With
# QtWebEngine, the maximum supported value is 2147483647 (~2 GB).
# Type: Int
c.content.cache.size = None

# Control which cookies to accept.
# Type: String
# Valid values:
# - all: Accept all cookies.
# - no-3rdparty: Accept cookies from the same origin only.
# - no-unknown-3rdparty: Accept cookies from the same origin only, unless a cookie is already set for the domain.
# - never: Don't accept cookies at all.
c.content.cookies.accept = "all"

# Store cookies. Note this option needs a restart with QtWebEngine on Qt
# < 5.9.
# Type: Bool
c.content.cookies.store = True

# Default encoding to use for websites. The encoding must be a string
# describing an encoding such as _utf-8_, _iso-8859-1_, etc.
# Type: String
c.content.default_encoding = "iso-8859-1"

# Allow websites to request geolocations.
# Type: BoolAsk
# Valid values:
# - true
# - false
# - ask
c.content.geolocation = "ask"

# Value to send in the `Accept-Language` header.
# Type: String
c.content.headers.accept_language = "en-US,en"

# Set custom headers for qutebrowser HTTP requests.
# Type: Dict
c.content.headers.custom = {}

# Value to send in the `DNT` header. When this is set to true,
# qutebrowser asks websites to not track your identity. If set to null,
# the DNT header is not sent at all.
# Type: Bool
c.content.headers.do_not_track = True

# Send the Referer header. The Referer header tells websites from which
# website you were coming from when visting them.
# Type: String
# Valid values:
# - always: Always send the Referer.
# - never: Never send the Referer. This is not recommended, as some sites may break.
# - same-domain: Only send the Referer for the same domain. This will still protect your privacy, but shouldn't break any sites.
c.content.headers.referer = "same-domain"

# User agent to send. Unset to send the default.
# Type: String
# c.content.headers.user_agent = None

# Whether host blocking is enabled.
# Type: Bool
c.content.blocking.enabled = True

# List of URLs of lists which contain hosts to block.  The file can be
# in one of the following formats:  - An `/etc/hosts`-like file - One
# host per line - A zip-file of any of the above, with either only one
# file, or a file named   `hosts` (with any extension).
# Type: List of Url
c.content.blocking.hosts.lists = [
    "https://www.malwaredomainlist.com/hostslist/hosts.txt",
    "https://someonewhocares.org/hosts/hosts",
    "https://winhelp2002.mvps.org/hosts.zip",
    "https://malwaredomains.lehigh.edu/files/justdomains.zip",
    "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&mimetype=plaintext",
    "https://easylist.to/easylist/easylist.txt",
    "https://easylist.to/easylist/easyprivacy.txt",
    "https://easylist.to/easylist/fanboy-annoyance.txt",
    "https://easylist.to/easylist/fanboy-social.txt",
    "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts",
]

# List of domains that should always be loaded, despite being ad-
# blocked. Domains may contain * and ? wildcards and are otherwise
# required to exactly match the requested domain. Local domains are
# always exempt from hostblocking.
# Type: List of String
c.content.blocking.whitelist = ["https://wegroup.be/*", "https://*.wegroup.be/*", "https://sentry.io/*"]

# Enable or disable hyperlink auditing (`<a ping>`).
# Type: Bool
c.content.hyperlink_auditing = False

# Whether images are automatically loaded in web pages.
# Type: Bool
c.content.images = True

# Show javascript alerts.
# Type: Bool
c.content.javascript.alert = True

# Whether JavaScript can read from or write to the clipboard. With
# QtWebEngine, writing the clipboard as response to a user interaction
# is always allowed.
# Type: Bool
# c.content.javascript.can_access_clipboard = False
# c.content.javascript.clipboard = False

# Whether JavaScript can open new tabs without user interaction.
# Type: Bool
c.content.javascript.can_open_tabs_automatically = False

# Enables or disables JavaScript.
# Type: Bool
c.content.javascript.enabled = True

# Log levels to use for JavaScript console logging messages. When a
# JavaScript message with the level given in the dictionary key is
# logged, the corresponding dictionary value selects the qutebrowser
# logger to use. On QtWebKit, the "unknown" setting is always used.
# Type: Dict
c.content.javascript.log = {"unknown": "debug", "info": "debug", "warning": "debug", "error": "debug"}

# Use the standard JavaScript modal dialog for `alert()` and `confirm()`
# Type: Bool
c.content.javascript.modal_dialog = False

# Show javascript prompts.
# Type: Bool
c.content.javascript.prompt = True

# Whether locally loaded documents are allowed to access other local
# urls.
# Type: Bool
c.content.local_content_can_access_file_urls = True

# Whether locally loaded documents are allowed to access remote urls.
# Type: Bool
c.content.local_content_can_access_remote_urls = False

# Whether support for HTML 5 local storage and Web SQL is enabled.
# Type: Bool
c.content.local_storage = True

# Location of a netrc-file for HTTP authentication. If unset, `~/.netrc`
# is used.
# Type: File
c.content.netrc_file = None

# Enable pdf.js to view PDF files in the browser. Note that the files
# can still be downloaded by clicking the download button in the pdf.js
# viewer.
# Type: Bool
c.content.pdfjs = False

# Enables or disables plugins in Web pages.
# Type: Bool
c.content.plugins = True

# Whether the background color and images are also drawn when the page
# is printed.
# Type: Bool
c.content.print_element_backgrounds = True

# Open new windows in private browsing mode which does not record
# visited pages.
# Type: Bool
c.content.private_browsing = False

# The proxy to use. In addition to the listed values, you can use a
# `socks://...` or `http://...` URL.
# Type: Proxy
# Valid values:
# - system: Use the system wide proxy.
# - none: Don't use any proxy
c.content.proxy = "system"

# Validate SSL handshakes.
# Type: BoolAsk
# Valid values:
# - true
# - false
# - ask
# c.content.ssl_strict = 'ask'

# A list of user stylesheet filenames to use.
# Type: List of File, or File
c.content.user_stylesheets = []

# Enables or disables WebGL.
# Type: Bool
c.content.webgl = True

# Whether load requests should be monitored for cross-site scripting
# attempts. Suspicious scripts will be blocked and reported in the
# inspector's JavaScript console. Enabling this feature might have an
# impact on performance.
# Type: Bool
c.content.xss_auditing = False

# The directory to save downloads to. If unset, a sensible os-specific
# default is used.
# Type: Directory
c.downloads.location.directory = None

# Prompt the user for the download location. If set to false,
# `downloads.location.directory` will be used.
# Type: Bool
c.downloads.location.prompt = False


# Remember the last used download directory.
# Type: Bool
c.downloads.location.remember = True

# What to display in the download filename input.
# Type: String
# Valid values:
# - path: Show only the download path.
# - filename: Show only download filename.
# - both: Show download path and filename.
c.downloads.location.suggestion = "path"

# The default program used to open downloads. If null, the default
# internal handler is used. Any `{}` in the string will be expanded to
# the filename, else the filename will be appended.
# Type: String
c.downloads.open_dispatcher = "xdg-open {}"

# Where to show the downloaded files.
# Type: VerticalPosition
# Valid values:
# - top
# - bottom
c.downloads.position = "top"

# Number of milliseconds to wait before removing finished downloads. If
# set to -1, downloads are never removed.
# Type: Int
c.downloads.remove_finished = 60000

# The editor (and arguments) to use for the `edit-text` command. `{}`
# gets replaced by the filename of the file to be edited.
# Type: ShellCommand
c.editor.command = ["st", "-e", "nvim", "{}", "+call cursor({line}, {column})"]

# Encoding to use for the editor.
# Type: Encoding
c.editor.encoding = "utf-8"

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = "bold 9pt monospace"

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = "9pt monospace"

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = "9pt monospace"

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = "9pt monospace"

# Font used for the hints.
# Type: Font
c.fonts.hints = "bold 9pt monospace"

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = "9pt monospace"

# Font used for error messages.
# Type: Font
c.fonts.messages.error = "9pt monospace"

# Font used for info messages.
# Type: Font
c.fonts.messages.info = "9pt monospace"

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = "9pt monospace"

# Font used for prompts.
# Type: Font
c.fonts.prompts = "9pt sans-serif"

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = "9pt monospace"

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs.selected = "9pt monospace"
c.fonts.tabs.unselected = "9pt monospace"

# Font family for cursive fonts.
# Type: FontFamily
c.fonts.web.family.cursive = ""

# Font family for fantasy fonts.
# Type: FontFamily
c.fonts.web.family.fantasy = ""

# Font family for fixed fonts.
# Type: FontFamily
c.fonts.web.family.fixed = ""

# Font family for sans-serif fonts.
# Type: FontFamily
c.fonts.web.family.sans_serif = ""

# Font family for serif fonts.
# Type: FontFamily
c.fonts.web.family.serif = ""

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = ""

# The default font size for regular text.
# Type: Int
c.fonts.web.size.default = 16

# The default font size for fixed-pitch text.
# Type: Int
c.fonts.web.size.default_fixed = 13

# The hard minimum font size.
# Type: Int
c.fonts.web.size.minimum = 0

# The minimum logical font size that is applied when zooming out.
# Type: Int
c.fonts.web.size.minimum_logical = 6

# Controls when a hint can be automatically followed without pressing
# Enter.
# Type: String
# Valid values:
# - always: Auto-follow whenever there is only a single hint on a page.
# - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
# - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
# - never: The user will always need to press Enter to follow a hint.
c.hints.auto_follow = "always"

# A timeout (in milliseconds) to ignore normal-mode key bindings after a
# successful auto-follow.
# Type: Int
c.hints.auto_follow_timeout = 0

# Chars used for hint strings.
# Type: UniqueCharString
c.hints.chars = "asdfghjkl"

# The dictionary file to be used by the word hints.
# Type: File
c.hints.dictionary = "/usr/share/dict/words"

# Hide unmatched hints in rapid mode.
# Type: Bool
c.hints.hide_unmatched_rapid_hints = True

# Minimum number of chars used for hint strings.
# Type: Int
c.hints.min_chars = 1

# Mode to use for hints.
# Type: String
# Valid values:
# - number: Use numeric hints. (In this mode you can also type letters from the hinted element to filter and reduce the number of elements that are hinted.)
# - letter: Use the chars in the `hints.chars` setting.
# - word: Use hints words based on the html elements and the extra words
c.hints.mode = "letter"

# A comma-separated list of regexes to use for 'next' links.
# Type: List of Regex
c.hints.next_regexes = ["\\bnext\\b", "\\bmore\\b", "\\bnewer\\b", "\\b[>→≫]\\b", "\\b(>>|»|>)\\b", "\\bcontinue\\b"]

# A comma-separated list of regexes to use for 'prev' links.
# Type: List of Regex
c.hints.prev_regexes = ["\\bprev(ious)?\\b", "\\bback\\b", "\\bolder\\b", "\\b[<←≪]\\b", "\\b(<<|«|<)\\b"]

# Scatter hint key chains (like Vimium) or not (like dwb). Ignored for
# number hints.
# Type: Bool
c.hints.scatter = True

# Make chars in hint strings uppercase.
# Type: Bool
c.hints.uppercase = False

# The maximum time in minutes between two history items for them to be
# considered being from the same browsing session. Items with less time
# between them are grouped when being displayed in `:history`. Use -1 to
# disable separation.
# Type: Int
c.history_gap_interval = 30

# Find text on a page case-insensitively.
# Type: String
# Valid values:
# - always: Search case-insensitively
# - never: Search case-sensitively
# - smart: Search case-sensitively if there are capital chars
c.search.ignore_case = "smart"

# Forward unbound keys to the webview in normal mode.
# Type: String
# Valid values:
# - all: Forward all unbound keys.
# - auto: Forward unbound non-alphanumeric keys.
# - none: Don't forward any keys.
c.input.forward_unbound_keys = "auto"

# Leave insert mode if a non-editable element is clicked.
# Type: Bool
c.input.insert_mode.auto_leave = True

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = False

# Switch to insert mode when clicking flash and other plugins.
# Type: Bool
c.input.insert_mode.plugins = False

# Include hyperlinks in the keyboard focus chain when tabbing.
# Type: Bool
c.input.links_included_in_focus_chain = True

# Timeout (in milliseconds) for partially typed key bindings. If the
# current input forms only partial matches, the keystring will be
# cleared after this time.
# Type: Int
c.input.partial_timeout = 5000

# Enable Spatial Navigation. Spatial navigation consists in the ability
# to navigate between focusable elements in a Web page, such as
# hyperlinks and form controls, by using Left, Right, Up and Down arrow
# keys. For example, if a user presses the Right key, heuristics
# determine whether there is an element he might be trying to reach
# towards the right and which element he probably wants.
# Type: Bool
c.input.spatial_navigation = False

# Keychains that shouldn't be shown in the keyhint dialog. Globs are
# supported, so `;*` will blacklist all keychains starting with `;`. Use
# `*` to disable keyhints.
# Type: List of String
c.keyhint.blacklist = []

# Time from pressing a key to seeing the keyhint dialog (ms).
# Type: Int
c.keyhint.delay = 500

# Time (in ms) to show messages in the statusbar for. Set to 0 to never
# clear messages.
# Type: Int
c.messages.timeout = 2000

# How to open links in an existing instance if a new one is launched.
# This happens when e.g. opening a link from a terminal. See
# `new_instance_open_target_window` to customize in which window the
# link is opened in.
# Type: String
# Valid values:
# - tab: Open a new tab in the existing window and activate the window.
# - tab-bg: Open a new background tab in the existing window and activate the window.
# - tab-silent: Open a new tab in the existing window without activating the window.
# - tab-bg-silent: Open a new background tab in the existing window without activating the window.
# - window: Open in a new window.
c.new_instance_open_target = "tab"

# Which window to choose when opening links as new tabs. When
# `new_instance_open_target` is not set to `window`, this is ignored.
# Type: String
# Valid values:
# - first-opened: Open new tabs in the first (oldest) opened window.
# - last-opened: Open new tabs in the last (newest) opened window.
# - last-focused: Open new tabs in the most recently focused window.
# - last-visible: Open new tabs in the most recently visible window.
c.new_instance_open_target_window = "last-focused"

# Show a filebrowser in upload/download prompts.
# Type: Bool
c.prompt.filebrowser = True

# The rounding radius for the edges of prompts.
# Type: Int
c.prompt.radius = 8

# Additional arguments to pass to Qt, without leading `--`. With
# QtWebEngine, some Chromium arguments (see
# https://peter.sh/experiments/chromium-command-line-switches/ for a
# list) will work. This setting requires a restart.
# Type: List of String
# c.qt.args = ["ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so", "blink-settings=darkMode=4"]
c.qt.args = []

# Force a Qt platform to use. This sets the `QT_QPA_PLATFORM`
# environment variable and is useful to force using the XCB plugin when
# running QtWebEngine on Wayland.
# Type: String
c.qt.force_platform = None

# Show a scrollbar.
# c.scrolling.bar = 'false'

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# The name of the session to save by default. If this is set to null,
# the session which was last loaded is saved.
# Type: SessionName
c.session.default_name = None

# Spell checking languages. You can check for available languages and
# install dictionaries using scripts/install_dict.py. Run the script
# with -h/--help for instructions.
# Type: List of String
# Valid values:
# - af-ZA: Afrikaans (South Africa)
# - bg-BG: Bulgarian (Bulgaria)
# - ca-ES: Catalan (Spain)
# - cs-CZ: Czech (Czech Republic)
# - da-DK: Danish (Denmark)
# - de-DE: German (Germany)
# - el-GR: Greek (Greece)
# - en-CA: English (Canada)
# - en-GB: English (United Kingdom)
# - en-US: English (United States)
# - es-ES: Spanish (Spain)
# - et-EE: Estonian (Estonia)
# - fa-IR: Farsi (Iran)
# - fo-FO: Faroese (Faroe Islands)
# - fr-FR: French (France)
# - he-IL: Hebrew (Israel)
# - hi-IN: Hindi (India)
# - hr-HR: Croatian (Croatia)
# - hu-HU: Hungarian (Hungary)
# - id-ID: Indonesian (Indonesia)
# - it-IT: Italian (Italy)
# - ko: Korean
# - lt-LT: Lithuanian (Lithuania)
# - lv-LV: Latvian (Latvia)
# - nb-NO: Norwegian (Norway)
# - nl-NL: Dutch (Netherlands)
# - pl-PL: Polish (Poland)
# - pt-BR: Portuguese (Brazil)
# - pt-PT: Portuguese (Portugal)
# - ro-RO: Romanian (Romania)
# - ru-RU: Russian (Russia)
# - sh: Serbo-Croatian
# - sk-SK: Slovak (Slovakia)
# - sl-SI: Slovenian (Slovenia)
# - sq: Albanian
# - sr: Serbian
# - sv-SE: Swedish (Sweden)
# - ta-IN: Tamil (India)
# - tg-TG: Tajik (Tajikistan)
# - tr-TR: Turkish (Turkey)
# - uk-UA: Ukrainian (Ukraine)
# - vi-VN: Vietnamese (Viet Nam)
c.spellcheck.languages = ["en-GB", "nl-NL"]

# Notifications
c.content.notifications.show_origin = False

# Hide the statusbar unless a message is shown.
# Type: Bool
# c.statusbar.hide = True

# Padding for the statusbar.
# Type: Padding
c.statusbar.padding = {"top": 1, "bottom": 1, "left": 0, "right": 0}

# The position of the status bar.
# Type: VerticalPosition
# Valid values:
# - top
# - bottom
c.statusbar.position = "bottom"

# Open new tabs (middleclick/ctrl+click) in the background.
# Type: Bool
c.tabs.background = False

# On which mouse button to close tabs.
# Type: String
# Valid values:
# - right: Close tabs on right-click.
# - middle: Close tabs on middle-click.
# - none: Don't close tabs using the mouse.
c.tabs.close_mouse_button = "middle"

# Scaling for favicons in the tab bar. The tab size is unchanged, so big
# favicons also require extra `tabs.padding`.
# Type: Float
c.tabs.favicons.scale = 1.0

# Show favicons in the tab bar.
# Type: Bool
# c.tabs.favicons.show = True

# Padding for tab indicators
# Type: Padding
c.tabs.indicator.padding = {"top": 2, "bottom": 2, "left": 0, "right": 4}

# Behavior when the last tab is closed.
# Type: String
# Valid values:
# - ignore: Don't do anything.
# - blank: Load a blank page.
# - startpage: Load the start page.
# - default-page: Load the default page.
# - close: Close the window.
c.tabs.last_close = "close"

# Switch between tabs using the mouse wheel.
# Type: Bool
c.tabs.mousewheel_switching = False

# How new tabs opened from another tab are positioned.
# Type: NewTabPosition
# Valid values:
# - prev: Before the current tab.
# - next: After the current tab.
# - first: At the beginning.
# - last: At the end.
c.tabs.new_position.related = "next"

# How new tabs which aren't opened from another tab are positioned.
# Type: NewTabPosition
# Valid values:
# - prev: Before the current tab.
# - next: After the current tab.
# - first: At the beginning.
# - last: At the end.
c.tabs.new_position.unrelated = "last"

# Padding around text for tabs
# Type: Padding
c.tabs.padding = {"top": 0, "bottom": 0, "left": 5, "right": 5}

# The position of the tab bar.
# Type: Position
# Valid values:
# - top
# - bottom
# - left
# - right
c.tabs.position = "top"

# Which tab to select when the focused tab is removed.
# Type: SelectOnRemove
# Valid values:
# - prev: Select the tab which came before the closed one (left in horizontal, above in vertical).
# - next: Select the tab which came after the closed one (right in horizontal, below in vertical).
# - last-used: Select the previously selected tab.
c.tabs.select_on_remove = "next"

# When to show the tab bar.
# Type: String
# Valid values:
# - always: Always show the tab bar.
# - never: Always hide the tab bar.
# - multiple: Hide the tab bar if only one tab is open.
# - switching: Show the tab bar when switching tabs.
c.tabs.show = "multiple"

# Time to show the tab bar before hiding it when tabs.show is set to
# 'switching'.
# Type: Int
c.tabs.show_switching_delay = 3000

# Open a new window for every tab.
# Type: Bool
c.tabs.tabs_are_windows = False

# Alignment of the text inside of tabs.
# Type: TextAlignment
# Valid values:
# - left
# - right
# - center
c.tabs.title.alignment = "left"

# The format to use for the tab title. The following placeholders are
# defined:  * `{perc}`: The percentage as a string like `[10%]`. *
# `{perc_raw}`: The raw percentage, e.g. `10` * `{title}`: The title of
# the current web page * `{title_sep}`: The string ` - ` if a title is
# set, empty otherwise. * `{index}`: The index of this tab. * `{id}`:
# The internal tab ID of this tab. * `{scroll_pos}`: The page scroll
# position. * `{host}`: The host of the current web page. * `{backend}`:
# Either ''webkit'' or ''webengine'' * `{private}` : Indicates when
# private mode is enabled.
# Type: FormatString
# c.tabs.current_title.format = "{index}: {title}"

# The format to use for the tab title for pinned tabs. The same
# placeholders like for `tabs.title.format` are defined.
# Type: FormatString
c.tabs.title.format_pinned = "{index}"

c.colors.tabs.pinned.even.bg = "grey"
c.colors.tabs.pinned.odd.bg = "grey"

# c.colors.webpage.preferred_color_scheme = "dark"
# c.colors.webpage.darkmode.enabled = True
# c.colors.webpage.darkmode.policy.images = "never"

c.colors.webpage.preferred_color_scheme = "light"
c.colors.webpage.darkmode.enabled = False
c.colors.webpage.darkmode.policy.images = "never"

# The width of the tab bar if it's vertical, in px or as percentage of
# the window.
# Type: PercOrInt
c.tabs.width = "20%"

# Width of the progress indicator (0 to disable).
# Type: Int
c.tabs.indicator.width = 3

# Whether to wrap when changing tabs.
# Type: Bool
c.tabs.wrap = True

c.tabs.pinned.frozen = False

# Whether to start a search when something else than a URL is entered.
# Type: String
# Valid values:
# - naive: Use simple/naive check.
# - dns: Use DNS requests (might be slow!).
# - never: Never search automatically.
c.url.auto_search = "naive"

# The page to open if :open -t/-b/-w is used without URL. Use
# `about:blank` for a blank page.
# Type: FuzzyUrl
c.url.default_page = "https://duckduckgo.com/"

# The URL segments where `:navigate increment/decrement` will search for
# a number.
# Type: FlagList
# Valid values:
# - host
# - path
# - query
# - anchor
c.url.incdec_segments = ["path", "query"]

# Definitions of search engines which can be used via the address bar.
# Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
# `{}` placeholder. The placeholder will be replaced by the search term,
# use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "abb": "https://www.woorden.org/woord/{}",
    "abben": "https://acronyms.thefreedictionary.com/{}",
    "alp": "https://pkgs.alpinelinux.org/packages?name=*{}*",
    "aur": "https://aur.archlinux.org/packages/?K={}",
    "aw": "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}",
    "bc": "https://www.bitchute.com/search?q={}&sort=date_created%20desc",
    "ddg": "https://duckduckgo.com/?q={}",
    "ddgi": "https://duckduckgo.com/?q={}&t=ha&iar=images",
    "deepl": "https://www.deepl.com/nl/translator#en/nl/{}",
    "dicten": "https://www.wordnik.com/words/{}",
    "docker": "https://hub.docker.com/search?q={}",
    "rs": "https://doc.rust-lang.org/std/index.html?search={}",
    "rsd": "https://docs.rs/{}",
    "eb": "https://ebay.com/sch/{}",
    "g": "https://google.com/search?q={}",
    "ge": "https://genius.com/search?q={}",
    "gh": "https://github.com/search?q={}",
    "gi": "https://www.google.be/search?q={}&source=lnms&tbm=isch",
    "i": "https://duckduckgo.com/?q={}&t=ha&iar=images",
    "imdb": "https://www.imdb.com/find?s=all&q={}",
    "maps": "https://maps.google.com/?q={}",
    "mtp": "https://en.metapedia.org/m/index.php?title=Special%3ASearch&search={}",
    "osm": "https://www.openstreetmap.org/search?query={}",
    "urban": "https://www.urbandictionary.com/define.php?term={}",
    "py": "https://docs.python.org/3/search.html?q={}",
    "pypi": "https://pypi.org/search/?q={}",
    "red": "https://reddit.com/r/{}",
    "sl": "https://www.setlist.fm/search?query={}",
    "syn": "https://synoniemen.net/index.php?zoekterm={}",
    "syn2": "https://www.mijnwoordenboek.nl/synoniemen/{}",
    "synen": "https://www.thesaurus.com/browse/{}",
    "pcs": "https://www.procyclingstats.com/search.php?term={}",
    "thw": "https://www.thinkwiki.org/w/index.php?search={}&title=Special%3ASearch",
    "tpb": "https://pirateproxy.gdn/search/{}",
    "tw": "https://twitter.com/{}",
    "viw": "https://vim.wikia.com/wiki/Special:Search?fulltext=Search&query={}",
    "vw": "https://wiki.voidlinux.eu/index.php?search={}&title=Special%3ASearch",
    "w": "https://www.wikipedia.org/search-redirect.php?family=wikipedia&language=en&search={}&language=en&go=Go",
    "wnl": "https://www.wikipedia.org/search-redirect.php?family=wikipedia&language=nl&search={}&language=nl&go=Go",
    "wt": "https://en.wiktionary.org/?search={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "ytv": "https://hooktube.com/results?search_query={}",
    "ww": "https://wiki.azure.wegroup.be/search/{}",
}


# The page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = ["www.duckduckgo.com"]

# The URL parameters to strip with `:yank url`.
# Type: List of String
c.url.yank_ignored_parameters = ["ref", "utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content"]

# Hide the window decoration when using wayland (requires restart)
# Type: Bool
# c.window.hide_wayland_decoration = False

# The format to use for the window title. The following placeholders are
# defined:  * `{perc}`: The percentage as a string like `[10%]`. *
# `{perc_raw}`: The raw percentage, e.g. `10` * `{title}`: The title of
# the current web page * `{title_sep}`: The string ` - ` if a title is
# set, empty otherwise. * `{id}`: The internal window ID of this window.
# * `{scroll_pos}`: The page scroll position. * `{host}`: The host of
# the current web page. * `{backend}`: Either ''webkit'' or
# ''webengine'' * `{private}` : Indicates when private mode is enabled.
# Type: FormatString
# c.window.current_title_format = "{perc}{title}{title_sep}qutebrowser"

# The default zoom level.
# Type: Perc
c.zoom.default = "100%"

# The available zoom levels.
# Type: List of Perc
c.zoom.levels = [
    "25%",
    "33%",
    "50%",
    "67%",
    "75%",
    "90%",
    "100%",
    "110%",
    "125%",
    "150%",
    "175%",
    "200%",
    "250%",
    "300%",
    "400%",
    "500%",
]

# How much to divide the mouse wheel movements to translate them into
# zoom increments.
# Type: Int
c.zoom.mouse_divider = 512

c.scrolling.bar = "when-searching"

# Bindings for normal mode
c.bindings.commands = {
    "normal": {
        "'": "mode-enter jump_mark",
        "+": "zoom-in",
        "-": "zoom-out",
        ".": "cmd-repeat-last",
        "/": "cmd-set-text /",
        ":": "cmd-set-text :",
        ";;": "hint links download",
        ";I": "hint images tab",
        ";O": "hint links fill :open -rt {hint-url}",
        ";R": "hint --rapid links window",
        ";Y": "hint links yank-primary",
        ";b": "hint all tab-bg",
        ";d": "hint links download",
        ";f": "hint all tab-fg",
        ";h": "hint all hover",
        ";i": "hint images",
        ";m": "hint links spawn mpv {hint-url}",
        ";o": "hint links fill :open {hint-url}",
        ";r": "hint --rapid links tab-bg",
        ";t": "hint inputs",
        ";x": "hint links fill :spawn xdg-open {hint-url}",
        ";y": "hint links yank",
        "<Alt-1>": "tab-focus 1",
        "<Alt-2>": "tab-focus 2",
        "<Alt-3>": "tab-focus 3",
        "<Alt-4>": "tab-focus 4",
        "<Alt-5>": "tab-focus 5",
        "<Alt-6>": "tab-focus 6",
        "<Alt-7>": "tab-focus 7",
        "<Alt-8>": "tab-focus 8",
        "<Alt-9>": "tab-focus -1",
        "<Ctrl-Alt-p>": "print",
        "<Ctrl-F5>": "reload -f",
        "<Ctrl-PgDown>": "tab-next",
        "<Ctrl-PgUp>": "tab-prev",
        "<Ctrl-Return>": "selection-follow -t",
        "<Ctrl-Shift-n>": "open -p",
        "<Ctrl-Shift-t>": "undo",
        "<Ctrl-Shift-w>": "close",
        "<Ctrl-Tab>": "tab-focus last",
        "<Ctrl-a>": "navigate increment",
        "<Ctrl-d>": "cmd-set-text -s :set colors.webpage.darkmode.enabled false",
        "<Ctrl-Shift-d>": "cmd-set-text -s :set colors.webpage.darkmode.enabled true",
        "<Ctrl-f>": "hint --rapid links tab-bg",
        "<Ctrl-h>": "home",
        "<Ctrl-j>": "tab-move -",
        "<Ctrl-k>": "tab-move +",
        "<Ctrl-n>": "open -w",
        "<Ctrl-p>": "tab-pin",
        "<Ctrl-q>": "quit",
        "<Ctrl-s>": "stop",
        "<Ctrl-t>": "open -t",
        "<Ctrl-u>": "scroll-page 0 -0.5",
        "<Ctrl-g>": "mode-enter passthrough",
        "<Ctrl-v>": None,
        "<Ctrl-w>": "tab-close",
        "<Ctrl-x>": "navigate decrement",
        "<Escape>": "clear-keychain ;; search ;; fullscreen --leave",
        "<F11>": "fullscreen",
        "<F5>": "reload",
        "<Return>": "selection-follow",
        "<back>": "back",
        "<forward>": "forward",
        "=": "zoom",
        "?": "cmd-set-text ?",
        "@": "macro-run",
        "A": "cmd-set-text :open {url:pretty}",
        "B": "cmd-set-text -s :quickmark-load -t",
        "Cd": "download-cancel",
        "D": "tab-close -o",
        "E": "edit-url",
        "F": "hint all tab",
        "G": "scroll-to-perc",
        "H": "back",
        "J": "tab-prev",
        "K": "tab-next",
        "L": "forward",
        "M": "bookmark-add",
        "N": "search-prev",
        "O": "cmd-set-text -s :open -rt",
        "PM": "spawn mpv {clipboard}",
        "PP": "open -rt -- {primary}",
        "Pm": "spawn mpv {primary}",
        "Pp": "open -rt -- {clipboard}",
        "R": "reload -f",
        "Sb": "open qute://bookmarks#bookmarks",
        "Sh": "open qute://history",
        "Sq": "open qute://bookmarks",
        "Ss": "open qute://settings",
        "T": "tab-next",
        "U": "undo",
        "[[": "navigate prev",
        "]]": "navigate next",
        "ad": "download-cancel",
        "b": "cmd-set-text -s :quickmark-load",
        "cd": "download-clear",
        "co": "tab-only",
        "d": "scroll-page 0 0.5",
        "e": "cmd-set-text :open {url:pretty}",
        "f": "hint",
        "g$": "tab-focus -1",
        "g0": "tab-focus 1",
        "gB": "cmd-set-text -s :bookmark-load -t",
        "gC": "tab-clone",
        "gO": "cmd-set-text :open -rt {url:pretty}",
        "gU": "navigate up -t",
        "g^": "tab-focus 1",
        "ga": "open -t",
        "gb": "cmd-set-text -s :bookmark-load",
        "gd": "download-open",
        "gf": "view-source",
        "gg": "scroll-to-perc 0",
        "gm": "tab-move",
        "gn": "navigate next",
        "go": "cmd-set-text :open {url:pretty}",
        "gp": "navigate prev",
        "gt": "cmd-set-text -s :tab-select",
        "gu": "navigate up",
        "h": "scroll left",
        "i": "mode-enter insert",
        "j": "scroll down",
        "k": "scroll up",
        "l": "scroll right",
        "m": "quickmark-save",
        "n": "search-next",
        "o": "cmd-set-text -s :open",
        "pM": "spawn mpv {clipboard}",
        "pP": "open -- {primary}",
        "pm": "spawn mpv {primary}",
        "pp": "open -- {clipboard}",
        "q": "macro-record",
        "r": "reload",
        "sf": "save",
        "sk": "cmd-set-text -s :bind",
        "sl": "cmd-set-text -s :set -t",
        "ss": "cmd-set-text -s :set",
        "sb": "spawn --userscript getbib",
        "sc": "spawn --userscript cast",
        "sj": "spawn --userscript format_json stata-dark",
        "sm": "spawn --userscript view_in_mpv",
        "sp": "spawn --userscript ~/.config/qutebrowser/scripts/qute-pass",
        "th": "back -t",
        "tl": "forward -t",
        "tm": "tab-mute",
        "u": "scroll-page 0 -0.5",
        "v": "mode-enter caret",
        "wB": "cmd-set-text -s :bookmark-load -w",
        "wO": "cmd-set-text :open -w {url:pretty}",
        "wP": "open -w -- {primary}",
        "wb": "cmd-set-text -s :quickmark-load -w",
        "wf": "hint all window",
        "wh": "back -w",
        "wi": "devtools right",
        "wl": "forward -w",
        "wo": "cmd-set-text -s :open -w",
        "wp": "open -w -- {clipboard}",
        "ww": "download",
        "xO": "cmd-set-text :open -b -r {url:pretty}",
        "xb": "config-cycle statusbar.hide",
        "xo": "cmd-set-text -s :open -b",
        "xt": "config-cycle tabs.show always switching",
        "xx": "config-cycle statusbar.hide ;; config-cycle tabs.show always switching",
        "yD": "download-open copy-to-lf",
        "yd": "download-open dragon-drop -x",
        "yP": "yank pretty-url -s",
        "yT": "yank title -s",
        "yY": "yank -s",
        # "yd": "yank domain",
        "ym": "yank inline [{title}]({url})",
        "yp": "yank pretty-url",
        "yt": "yank title",
        "yy": "yank",
        "{{": "navigate prev -t",
        "}}": "navigate next -t",
    },
    "caret": {
        "$": "move-to-end-of-line",
        "0": "move-to-start-of-line",
        "<Ctrl-Space>": "selection-drop",
        "<Escape>": "mode-leave",
        "<Return>": "yank selection",
        "<Space>": "selection-toggle",
        "G": "move-to-end-of-document",
        "H": "scroll left",
        "J": "scroll down",
        "K": "scroll up",
        "L": "scroll right",
        "Y": "yank selection -s",
        "[": "move-to-start-of-prev-block",
        "]": "move-to-start-of-next-block",
        "b": "move-to-prev-word",
        "c": "mode-enter normal",
        "e": "move-to-end-of-word",
        "gg": "move-to-start-of-document",
        "h": "move-to-prev-char",
        "j": "move-to-next-line",
        "k": "move-to-prev-line",
        "l": "move-to-next-char",
        "v": "selection-toggle",
        "w": "move-to-next-word",
        "y": "yank selection",
        "{": "move-to-end-of-prev-block",
        "}": "move-to-end-of-next-block",
    },
    "command": {
        "<Alt-B>": "rl-backward-word",
        "<Alt-Backspace>": "rl-backward-kill-word",
        "<Alt-D>": "rl-kill-word",
        "<Alt-F>": "rl-forward-word",
        "<Ctrl-?>": "rl-delete-char",
        "<Ctrl-A>": "rl-beginning-of-line",
        "<Ctrl-B>": "rl-backward-char",
        "<Ctrl-D>": "completion-item-del",
        "<Ctrl-E>": "rl-end-of-line",
        "<Ctrl-F>": "rl-forward-char",
        "<Ctrl-H>": "rl-backward-delete-char",
        "<Ctrl-K>": "rl-kill-line",
        "<Ctrl-N>": "command-history-next",
        "<Ctrl-P>": "command-history-prev",
        "<Ctrl-Shift-Tab>": "completion-item-focus prev-category",
        "<Ctrl-Tab>": "completion-item-focus next-category",
        "<Ctrl-U>": "rl-unix-line-discard",
        "<Ctrl-W>": "rl-unix-word-rubout",
        "<Ctrl-Y>": "rl-yank",
        "<Down>": "command-history-next",
        "<Escape>": "mode-leave",
        "<Return>": "command-accept",
        "<Shift-Delete>": "completion-item-del",
        "<Shift-Tab>": "completion-item-focus prev",
        "<Tab>": "completion-item-focus next",
        "<Up>": "command-history-prev",
    },
    "hint": {
        "<Ctrl-B>": "hint all tab-bg",
        "<Ctrl-F>": "hint --rapid links tab-bg",
        "<Escape>": "mode-leave",
        "<Return>": "hint-follow",
    },
    "insert": {"<Ctrl-E>": "edit-text", "<Escape>": "mode-leave", "<Shift-Ins>": "insert-text {primary}"},
    "passthrough": {"<Ctrl-g>": "mode-leave"},
    "prompt": {
        "<Alt-B>": "rl-backward-word",
        "<Alt-Backspace>": "rl-backward-kill-word",
        "<Alt-D>": "rl-kill-word",
        "<Alt-F>": "rl-forward-word",
        "<Ctrl-?>": "rl-delete-char",
        "<Ctrl-A>": "rl-beginning-of-line",
        "<Ctrl-B>": "rl-backward-char",
        "<Ctrl-E>": "rl-end-of-line",
        "<Ctrl-F>": "rl-forward-char",
        "<Ctrl-H>": "rl-backward-delete-char",
        "<Ctrl-K>": "rl-kill-line",
        "<Ctrl-U>": "rl-unix-line-discard",
        "<Ctrl-W>": "rl-unix-word-rubout",
        "<Ctrl-X>": "prompt-open-download",
        "<Ctrl-Y>": "rl-yank",
        "<Down>": "prompt-item-focus next",
        "<Escape>": "mode-leave",
        "<Return>": "prompt-accept",
        "<Shift-Tab>": "prompt-item-focus prev",
        "<Tab>": "prompt-item-focus next",
        "<Up>": "prompt-item-focus prev",
    },
    "register": {"<Escape>": "mode-leave"},
}

# config.source('shortcuts.py')

# config.source("dark-qutebrowser-theme.py")

# set the flavor you'd like to use
# valid options are 'mocha', 'macchiato', 'frappe', and 'latte'
# last argument (optional, default is False): enable the plain look for the menu rows
catppuccin.setup(c, "mocha", True)


def filter_yt(info: interceptor.Request):
    """Block the given request if necessary."""
    url = info.request_url
    if url.host() == "www.youtube.com" and url.path() == "/get_video_info" and "&adformat=" in url.query():
        info.block()


interceptor.register(filter_yt)
