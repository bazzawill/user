-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    ["<leader>ti"] = { '<cmd>w<bar>TermExec cmd="bpython -i %:p"<cr>', desc = "run python interactive" },
    ["<leader>tP"] = { '<cmd>w<bar>TermExec cmd="python %:p"<cr>', desc = "run python" },
    ["<leader>tr"] = { '<cmd>w<bar>TermExec cmd="%:p"<cr>', desc = "run file" },
    ["<leader>tb"] = { '<cmd>TermExec cmd=bpython<cr>', desc = "bpython" },
    -- Obsidian
    ["<leader>,"] = { name = "Notes" },
    ["<leader>,o"] = { '<cmd>ObsidianOpen<cr>', desc = "Open in Obsidian" },
    ["<leader>,n"] = {
      function()
        vim.ui.input({ prompt = "Note Name"}, function(noteName)
          vim.cmd{cmd='ObsidianNew', args={noteName}}
        end)
      end,
      desc = "New Note"},
    ["<leader>,r"] = {
        function()
        vim.ui.input({ prompt = "Expression: " }, function(input)
          -- require("obsidian").Rename (input)
          vim.cmd{cmd='ObsidianRename ', args=input}
        end)
      end,
      desc = "Rename Note"},
    ["<leader>,S"] = {'<cmd>ObsidianSearch<cr>', desc = "Search Notes"},
    ["<leader>,s"] = {'<cmd>ObsidianQuickSwitch<cr>', desc = "Quick Search Notes"},
    ["<leader>,p"] = {'<cmd>ObsidianPaste<cr>', desc = "Paste Image"},
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
