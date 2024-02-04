-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
    -- first key is the mode
    n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        -- L = {
        --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        --   desc = "Next buffer",
        -- },
        -- H = {
        --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        --   desc = "Previous buffer",
        -- },

        -- mappings seen under group name "Buffer"
        ["<leader>bD"] = {
            function()
                require("astronvim.utils.status").heirline.buffer_picker(
                    function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
                )
            end,
            desc = "Pick to close",
        },
        -- tables with the `name` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<leader>b"] = { name = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        ["<leader>bk"] = {
            function()
                require("astronvim.utils.buffer").prev()
                require("astronvim.utils.buffer").close()
            end,
            desc = "Close Previous Buffer",
        },
        -- copy to system clipboard
        ["<leader>y"] = '"+y',
        ["<leader>Y"] = '"+Y',
    },
    t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
    },
    v = {
        -- move lines (by ThePrimeagen)
        ["J"] = ":m '>+1<CR>gv=gv",
        ["K"] = ":m '<-2<CR>gv=gv",
        -- copy to system clipboard
        ["<leader>y"] = '"+y',
    },
    x = {
        -- paste in selection without loosing your stuff in clipboard (by ThePrimeagen)
        ["<leader>p"] = '"_dP',
    },
}
