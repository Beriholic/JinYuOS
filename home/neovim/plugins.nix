{
  programs.lazyvim.plugins = {
    diffview = ''
      return {
        "sindrets/diffview.nvim",
        cmd = "DiffviewOpen",
      }
    '';

    snacks-explorer = ''
      return {
        "folke/snacks.nvim",
        opts = {
          picker = {
            sources = {
              explorer = {
                win = {
                  list = {
                    keys = {
                      ["o"] = "confirm",
                      ["O"] = "explorer_open",
                    },
                  },
                },
              },
            },
          },
        },
      }
    '';
  };
}
