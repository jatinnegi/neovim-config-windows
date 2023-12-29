local parser_configs = require('nvim-treesitter.parsers').get_parser_configs

-- Install required parsers
local function setup_parsers()
  local parsers = {
    'html',
    'css',
    'javascript',
    'typescript',
    'tsx',
    'javascriptreact',
    'typescriptreact',
    'sql',
    'markdown',
  }

  for _, parser in pairs(parsers) do
    local config = parser_configs()[parser]
    if config then
      config.install_info.url = 'https://github.com/nvim-treesitter/nvim-treesitter-' .. parser
    end
  end
end

-- Set up the treesitter configurations
local function setup_treesitter()
  require('nvim-treesitter.configs').setup {
    ensure_installed = parsers,
    highlight = {
      enable = true,
      disable = {},
    },
    indent = {
      enable = true,
    },
  }
end

-- Main setup function
local function setup()
  setup_parsers()
  setup_treesitter()
end

-- Call the setup function
setup()
