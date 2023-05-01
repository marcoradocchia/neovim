require("neorg").setup({
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.keybinds"] = { -- Custom keybindings
      config = {
        default_keybinds = true,
        hook = function(keybinds)
          keybinds.remap_key("norg", "n", "<C-Space>", "<leader>t")
          keybinds.remap_event("norg", "i", "<C-j>", "core.itero.next-iteration")
        end,
      },
    },
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.completion"] = { -- Autocompletions
      config = {
        engine = "nvim-cmp",
        name = "[neorg]",
      },
    },
    ["core.dirman"] = { -- Manage Neorg workspaces
      config = {
        workspaces = {
          cs = "~/docs/notes/cs",
          private = "~/docs/notes/private",
          linux = "~/docs/notes/linux",
          uni = "~/docs/notes/uni",
        },
      },
    },
    ["core.journal"] = {
      config = {
        journal_folder = "~/docs/journal",
      },
    },
    ["core.esupports.metagen"] = { -- Metadata autogeneration
      config = {
        template = {
          {
            "title",
            function()
              return vim.fn.input("Insert document Title: ")
            end
          },
          {
            "description",
            function()
              return vim.fn.input("Insert document Description: ")
            end
          },
          { "authors",    "Marco Radocchia" },
          { "categories", "" },
          {
            "created",
            function()
              return os.date("%Y-%m-%d")
            end
          },
          {
            "updated",
            function()
              return os.date("%Y-%m-%d")
            end
          }
        },
      }
    },
    ["core.export"] = {
      config = {
        export_dir = "~/docs/notes/<export-dir>/<language>-export",
      },
    },
    ["core.presenter"] = {
      config = {
        zen_mode = "zen-mode",
      },
    },
  },
})
