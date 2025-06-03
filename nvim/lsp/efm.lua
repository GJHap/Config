local function getConfig(localPath)
   local basePath = 'efmls-configs.formatters'
   return require(basePath .. '.' .. localPath)
end

local gofmt = getConfig('gofmt')
local prettier = getConfig('prettier')
local stylua = getConfig('stylua')
local nixfmt = getConfig('nixfmt')

local languages = {
   css = { prettier },
   go = { gofmt },
   graphql = { prettier },
   html = { prettier },
   javascript = { prettier },
   javascriptreact = { prettier },
   json = { prettier },
   lua = { stylua },
   markdown = { prettier },
   nix = { nixfmt },
   scss = { prettier },
   typescript = { prettier },
   typescriptreact = { prettier },
   yaml = { prettier },
}

vim.lsp.config('efm', {
   init_options = { documentFormatting = true, documentRangeFormatting = true },
   filetypes = vim.tbl_keys(languages),
   settings = {
      rootMarkers = { '.git/' },
      lintDebounce = '500ms',
      languages = languages,
   },
})
