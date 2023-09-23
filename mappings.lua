local M = {}

M.general = {
  n = {
    ["<leader>q"] = { "<cmd>:quit<cr>", "Quit" },
    ["<leader>Q"] = { "<cmd>:quitall<cr>", "Quit all" },
    ["<C-s>"] = { "<cmd>:write<cr>", "Save" },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "Hover",
    },
  },
  i = {
    ["<C-s>"] = { "<esc><cmd>:write<cr>", "Save" },
  },
}

M.telescope = {
  n = {
    ["<leader>f"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["<leader>g"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
  },
}

M.toggleterm = {
  n = {
    ["<C-t>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
  },
  t = {
    ["<C-t>"] = { "<cmd>ToggleTerm<cr>", "Toggle terminal" },
  },
}

M.neotree = {
  n = {
    ["<leader>e"] = { "<cmd>Neotree float %:./ %:p<cr>", "Open explorer" },
    ["<leader>be"] = { "<cmd>Neotree float buffers<cr>", "Buffer explorer" },
  },
}

M.neotest = {
  n = {
    ["<leader>tr"] = {
      function()
        require("neotest").run.run()
      end,
      "Run nearest",
    },
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Run file",
    },
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle()
      end,
      "Toggle summary",
    },
    ["<leader>to"] = {
      function()
        require("neotest").output.open { enter = true }
      end,
      "Show output",
    },
    ["<leader>th"] = {
      function()
        require("neotest").run.stop()
      end,
      "Stop",
    },
  },
}

M.projectionist = {
  n = {
    ["<leader>a"] = { "<cmd>A<cr>", "Alternate file" },
  },
}

M.elixir = {
  plugin = true,

  n = {
    ["<leader>tt"] = {
      function()
        local row = table.unpack(vim.api.nvim_win_get_cursor(0))
        require("toggleterm").exec("mix test " .. vim.fn.expand "%" .. ":" .. row)
      end,
      "Run in terminal",
    },
  },
}

M.diabeled = {
  n = {
    ["<A-h>"] = { "" },
    ["<A-i>"] = { "" },
    ["<A-v>"] = { "" },
    ["<leader>b"] = { "" },
    ["<leader>fa"] = { "" },
    ["<leader>fb"] = { "" },
    ["<leader>ff"] = { "" },
    ["<leader>fh"] = { "" },
    ["<leader>fm"] = { "" },
    ["<leader>fo"] = { "" },
    ["<leader>fw"] = { "" },
    ["<leader>fz"] = { "" },
    ["<leader>h"] = { "" },
    ["<leader>n"] = { "" },
    ["<leader>td"] = { "" },
    ["<leader>v"] = { "" },
  },
  t = {
    ["<A-i>"] = { "" },
    ["<A-h>"] = { "" },
    ["<A-v>"] = { "" },
  },
}

return M
