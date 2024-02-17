-- Initialize bootstrap configuration
require("config.bootstrap")

-- Load options and mappings
require("config.options")
require("config.mappings")

-- Setup lazy.nvim for plugin management
require("lazy").setup("config.plugins")
