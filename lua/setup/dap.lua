local dap = require("dap")
local dapui = require("dapui")
local widgets = require("dap.ui.widgets")

dapui.setup()

-- DAP-UI opening/closing on DAP events.
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.repl.open)
vim.keymap.set({ "n", "v" }, "<leader>dh", widgets.hover)
vim.keymap.set({ "n", "v" }, "<leader>dp", widgets.preview)
vim.keymap.set("n", "<Leader>df", function() widgets.centered_float(widgets.frames) end)
vim.keymap.set("n", "<Leader>ds", function() widgets.centered_float(widgets.scopes) end)

-- DAP-UI keybinds
vim.keymap.set("n", "<leader>du", dapui.toggle)
