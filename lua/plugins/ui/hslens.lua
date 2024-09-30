return {
    "kevinhwang91/nvim-hlslens",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      {
        "n",
        function()
          vim.cmd([[execute('normal! ' . v:count1 . 'n')]])
          require("hlslens").start()
        end,
        desc = "Next search result with hlslens"
      },
      {
        "N",
        function()
          vim.cmd([[execute('normal! ' . v:count1 . 'N')]])
          require("hlslens").start()
        end,
        desc = "Previous search result with hlslens"
      },
      {
        "F",
        function()
          vim.cmd("normal! *")
          require("hlslens").start()
        end,
        desc = "Search current word with hlslens"
      },
      
    },
    config = function()
      require("hlslens").setup {
        calm_down = {
            default = true,
        },
        override_lens = function(render, posList, nearest, idx, relIdx)
          local sfw = vim.v.searchforward == 1
          local indicator, text, chunks
          local absRelIdx = math.abs(relIdx)
          if absRelIdx > 1 then
            indicator = ('%d%s'):format(absRelIdx, sfw ~= (relIdx > 1) and 'N' or 'n')
          elseif absRelIdx == 1 then
            -- If one line
            indicator = sfw ~= (relIdx == 1) and 'N' or 'n'
          else
            indicator = ''
          end
  
          local lnum, col = unpack(posList[idx])
          if nearest then
            local cnt = #posList
            if indicator ~= '' then
              text = ('  %s'):format(indicator, idx, cnt)
            else
                -- current symbol
              text = ('[You are here]'):format(idx, cnt)
            end
            chunks = {{' ', 'HlSearchLens'}, {text, 'HlSearchLensNear'}}
          else
            text = ('  %s'):format(indicator, idx)
            chunks = {{' ', 'HlSearchLens'}, {text, 'HlSearchLens'}}
          end
          render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
        end
      }
    end
  }
  