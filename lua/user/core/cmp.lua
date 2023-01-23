local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end
local status_ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not status_ok then
  return
end

cmp.setup ({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = {
    ['<A-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.scroll_docs(4)
      end
    end, {"i", "s"}),
    ['<A-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.scroll_docs(-4)
      end
    end, {"i", "s"}),
    ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      end
    end, {"i", "s"}),
    ['<C-k>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, {"i", "s"}),
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  }),
  formatting = {
    format = function(entry, vim_item)
      if vim.tbl_contains({ 'path' }, entry.source.name) then
        local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
        if icon then
          vim_item.kind = icon
          vim_item.kind_hl_group = hl_group
          return vim_item
        end
      end
      return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
    end
  }
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
