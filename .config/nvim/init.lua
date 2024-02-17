-- Initialize bootstrap configuration
require("config.bootstrap")

-- Load options and mappings
require("config.options")
require("config.mappings")

-- Setup lazy.nvim to install plugins
lazy_plugins = require("config.plugins")
lazy_config = require("config.lazy")
require("lazy").setup(lazy_plugins, lazy_config)
