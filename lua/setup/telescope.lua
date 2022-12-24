local actions = require("telescope.actions")

vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader>/", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "Fuzzy find current buffer" })
vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "Fuzzy find Buffer" })
vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files, { desc = "Fuzzy find files" })
vim.keymap.set("n", "<leader>g", require("telescope.builtin").live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>m", require("telescope.builtin").man_pages, { desc = "Fuzzy find man pages" })
vim.keymap.set("n", "<leader>s", require("telescope.builtin").grep_string, { desc = "Grep string" })


require("telescope").setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    dynamic_preview_title = true,
    path_display = { "smart" },
    preview = { msg_bg_fillchar = "#" },
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
      pecific_opts = {
        codeactions = false,
      },
    },
  },
})

require("telescope").load_extension("ui-select")
