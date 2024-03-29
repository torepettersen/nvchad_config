local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "elixir",
        "heex",
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "stylua",
        "typescript-language-server",
        "prettier",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },
    opts = {
      direction = "float",
      float_opts = { border = "rounded" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").cycle_history_next,
            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup {
        filesystem = {
          filtered_items = {
            visible = true,
          },
        },
        window = {
          mappings = {
            ["<Tab>"] = "next_source",
            ["<S-Tab>"] = "prev_source",
          },
          fuzzy_finder_mappings = {
            ["<C-j>"] = "move_cursor_down",
            ["<C-k>"] = "move_cursor_up",
          },
        },
        buffers = {
          window = {
            mappings = {
              ["c"] = "buffer_delete",
            },
          },
        },
      }
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "jfpedroza/neotest-elixir",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-elixir",
        },
      }
    end,
  },
  {
    "tpope/vim-projectionist",
    event = "VeryLazy",
    config = function()
      vim.api.nvim_set_var("projectionist_heuristics", {
        ["mix.exs|lib/*.ex"] = {
          ["lib/**/live/*_live.ex"] = {
            alternate = "lib/{dirname}/live/{basename}_live.html.heex",
            type = "source",
            template = {
              "defmodule {dirname|camelcase|capitalize}.{basename|camelcase|capitalize}Live do",
              "  use {dirname|camelcase|capitalize}, :live_view",
              "",
              "  def mount(_params, _session, socket) do",
              "    {open}:ok, socket{close}",
              "  end",
              "end",
            },
          },
          ["lib/**/live/*_live.html.heex"] = {
            alternate = "lib/{dirname}/live/{basename}_live.ex",
            type = "template",
          },
          ["lib/*.ex"] = {
            alternate = "test/{}_test.exs",
            type = "source",
            template = {
              "defmodule {camelcase|capitalize|dot} do",
              "end",
            },
          },
          ["test/*_test.exs"] = {
            alternate = "lib/{}.ex",
            type = "source",
            template = {
              "defmodule {camelcase|capitalize|dot}Test do",
              "  use ExUnit.Case, async: true",
              "",
              "  alias {camelcase|capitalize|dot}",
              "end",
            },
          },
        },
      })
    end,
  },
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("custom.configs.elixir").setup()
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    config = function()
      require("leap").add_default_mappings()
    end,
    dependencies = {
      "tpope/vim-repeat",
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enable = false },
        panel = { enable = false },
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
      },
    },
  },
  { "NvChad/nvterm",           enabled = false },
  { "nvim-tree/nvim-tree.lua", enabled = false },
}

return plugins
