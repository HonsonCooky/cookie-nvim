return {
    dir = "cookie-nvim/cookie-lsp",
    name = "cookie-lsp",
    config = function()
        local cookie_lsp = require("cookie-nvim.cookie-lsp")
        cookie_lsp.setup({
            windows = {

                lsps = {
                    omnisharp = {
                        dir = "C:/Users/Honso/scoop/apps/omnisharp/current"
                    }
                }
            }
        })
    end
}
