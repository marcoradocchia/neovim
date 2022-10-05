local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    -- aspect
    prompt_prefix = " ",
    selection_caret = " ",
    dynamic_preview_title = true,
    -- border = false,

    -- results path
    path_display = { "smart" },

    -- preview
    preview = {
      msg_bg_fillchar = "#",
    },

    -- mappings
    mappings = {
      -- insert mode
      i = {
        -- close telescope
        ["<C-e>"] = actions.close,

        -- history
        ["<C-j>"] = actions.cycle_history_next,
        ["<C-k>"] = actions.cycle_history_prev,

        -- move selection
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        -- scroll selection
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        -- open selection
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        -- multiple selection
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<A-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-7>
      },

      -- normal mode
      n = {
        -- close telescope
        ["<esc>"] = actions.close,

        -- move selection
        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["zz"] = actions.move_to_middle,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,
        -- scroll selection
        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        -- open selection
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        -- multiple selection
        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["?"] = actions.which_key,
      },
    },
  },

  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },

  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure

    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
      pecific_opts = {
        -- [kind] = {
        --   make_indexed = function(items) -> indexed_items, width,
        --   make_displayer = function(widths) -> displayer
        --   make_display = function(displayer) -> function(e)
        --   make_ordinal = function(e) -> string
        -- },
        -- for example to disable the custom builtin "codeactions" display
        -- do the following
        codeactions = false,
      },
    },
  },
})

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("ui-select")
