local crates = require("crates")

crates.setup({
  smart_insert = true,
  insert_closing_quote = true,
  avoid_prerelease = true,
  autoload = true,
  autoupdate = true,
  loading_indicator = true,
  date_format = "%Y-%m-%d",
  disable_invalid_feature_diagnostic = false,
  text = {
    loading = "   Loading",
    version = "   %s",
    prerelease = "   %s",
    yanked = "   %s",
    nomatch = "   No match",
    upgrade = "   %s",
    error = "   Error fetching crate",
  },
  highlight = {
    loading = "CratesNvimLoading",
    version = "CratesNvimVersion",
    prerelease = "CratesNvimPreRelease",
    yanked = "CratesNvimYanked",
    nomatch = "CratesNvimNoMatch",
    upgrade = "CratesNvimUpgrade",
    error = "CratesNvimError",
  },
  popup = {
    autofocus = true,
    copy_register = '"',
    style = "minimal",
    border = "rounded",
    show_version_date = true,
    show_dependency_version = true,
    max_height = 30,
    min_width = 20,
  },
  src = {
    insert_closing_quote = false,
    text = {
      prerelease = "  pre-release ",
      yanked = "  yanked ",
    },
  },
})
