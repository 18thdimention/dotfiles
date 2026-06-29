return {
  "christoomey/vim-tmux-navigator",
	lazy = false,
  cmd = {
    "tmuxnavigateleft",
    "tmuxnavigatedown",
    "tmuxnavigateup",
    "tmuxnavigateright",
    "tmuxnavigateprevious",
    "tmuxnavigatorprocesslist",
  },
  keys = {
    { "<c-h>", "<cmd><c-u>tmuxnavigateleft<cr>" },
    { "<c-j>", "<cmd><c-u>tmuxnavigatedown<cr>" },
    { "<c-k>", "<cmd><c-u>tmuxnavigateup<cr>" },
    { "<c-l>", "<cmd><c-u>tmuxnavigateright<cr>" },
    { "<c-\\>", "<cmd><c-u>tmuxnavigateprevious<cr>" },
  },
}
