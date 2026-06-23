return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          win = {
            list = {
              keys = {
                ["o"] = "confirm", -- open directory
                ["O"] = "explorer_open", -- open with system application
              },
            },
          },
        },
      },
    },
  },
}
