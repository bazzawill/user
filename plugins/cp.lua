return {
  {
    "dfendr/clipboard-image.nvim",
    --lazy = false,
    cmd = "PasteImg",
    name = "clipboard-image",
    config = function()
      require("clipboard-image").setup {}
    end,
  },
}
