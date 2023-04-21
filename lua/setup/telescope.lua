local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>t", builtin.builtin, { desc = "Telescope builtins" })
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "Fuzzy find recently opened files" })
vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find current buffer" })
vim.keymap.set("n", "<leader>d", builtin.diagnostics, { desc = "Fuzzy find diagnostics" })
vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "Fuzzy find Buffer" })
vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>m", builtin.man_pages, { desc = "Fuzzy find man pages" })
vim.keymap.set("n", "<leader>s", builtin.grep_string, { desc = "Grep string" })

telescope.setup({
  defaults = {
    theme = "dropdown",
    prompt_prefix = " ",
    selection_caret = " ",
    sorting_strategy = "ascending",
    dynamic_preview_title = true,
    path_display = { "truncate" },
    winblend = 0,
    border = true,
    color_devicons = true,
    preview = { msg_bg_fillchar = "#" },
    result_title = "",
    layout_config = {
      horizontal = {
        prompt_position = "top"
      }
    },
    mappings = {
      i = {
            ["<C-e>"] = actions.close,
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
            ["<C-n>"] = actions.move_selection_next,
            ["<C-p>"] = actions.move_selection_previous,
            ["<Down>"] = actions.move_selection_next,
            ["<Up>"] = actions.move_selection_previous,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      },
      n = {
            ["<esc>"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["zz"] = actions.move_to_middle,
            ["gg"] = actions.move_to_top,
            ["G"] = actions.move_to_bottom,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<CR>"] = actions.select_default,
            ["<C-x>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
      },
    },
  },
  extensions = {
        ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    heading = {
      treesitter = true,
    },
  },
})

telescope.load_extension("ui-select")
telescope.load_extension("fzf")
telescope.load_extension("heading")
