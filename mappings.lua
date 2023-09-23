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
    ["<leader>f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
    ["<leader>g"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
  },
}

M.toggleterm = {
  n = {
    ["<C-t>"] = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
    ["<leader>tt"] = {
      function()
        local row = table.unpack(vim.api.nvim_win_get_cursor(0))
        require("toggleterm").exec("mix test " .. vim.fn.expand "%" .. ":" .. row)
      end,
      "Run in terminal",
    },
  },
  t = {
    ["<C-t>"] = { "<cmd>ToggleTerm<cr>", "Toggle Terminal" },
  },
}

M.neotree = {
  n = {
    ["<leader>e"] = { "<cmd>Neotree float %:./ %:p<cr>", "Open Explorer" },
    ["<leader>be"] = { "<cmd>Neotree float buffers<cr>", "Buffer Explorer" },
  },
}

M.neotest = {
  n = {
    ["<leader>tr"] = {
      function()
        require("neotest").run.run()
      end,
      "Run Nearest",
    },
    ["<leader>tf"] = {
      function()
        require("neotest").run.run(vim.fn.expand "%")
      end,
      "Run File",
    },
    ["<leader>ts"] = {
      function()
        require("neotest").summary.toggle()
      end,
      "Toggle Summary",
    },
    ["<leader>to"] = {
      function()
        require("neotest").output.open { enter = true }
      end,
      "Show Output",
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
    ["<leader>a"] = { "<cmd>A<cr>", "Alternate File" },
  },
}

M.diabeled = {
  n = {
    ["<A-h>"] = { "" },
    ["<A-i>"] = { "" },
    ["<A-v>"] = { "" },
    ["<leader>fa"] = { "" },
    ["<leader>fb"] = { "" },
    ["<leader>ff"] = { "" },
    ["<leader>fh"] = { "" },
    ["<leader>fm"] = { "" },
    ["<leader>fo"] = { "" },
    ["<leader>fw"] = { "" },
    ["<leader>fz"] = { "" },
    ["<leader>h"] = { "" },
    ["<leader>v"] = { "" },
  },
  t = {
    ["<A-i>"] = { "" },
    ["<A-h>"] = { "" },
    ["<A-v>"] = { "" },
  },
}

return M
