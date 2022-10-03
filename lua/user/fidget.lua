local status_ok, fidget = pcall(require, "fidget")
if not status_ok then
  return
end

vim.cmd("highlight! link FidgetTask Comment")
vim.cmd("highlight! link FidgetTitle OrangeBold")

fidget.setup({
  text = {
    spinner = "dots",
    done = ""
  },
  window = {
    blend = 0,
  }
})
