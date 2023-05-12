return {
    {
        'maxmx03/fluoromachine.nvim',
        config = function ()
         local fm = require 'fluoromachine'

         fm.setup {
            glow = true,
            theme = 'retrowave'
         }

         vim.cmd.colorscheme 'fluoromachine'
        end
    }
}
