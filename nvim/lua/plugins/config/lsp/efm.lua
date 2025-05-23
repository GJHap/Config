local function getConfig(localPath)
   local basePath = 'efmls-configs.formatters'
   return require(basePath .. '.' .. localPath)
end

local gofmt = getConfig('gofmt')
local prettier = getConfig('prettier')
local stylua = getConfig('stylua')
local nixfmt = getConfig('nixfmt')

return {
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
