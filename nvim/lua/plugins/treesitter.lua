local M = {
    "nvim-treesitter/nvim-treesitter",
		build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end
}

function M.config()
	require('nvim-treesitter.configs').setup {}
end

return { M }
