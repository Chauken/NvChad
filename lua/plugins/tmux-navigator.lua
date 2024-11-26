return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    priority = 1, -- High priority to ensure it loads early
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      -- "TmuxNavigatePrevious",
    },
  },
} 