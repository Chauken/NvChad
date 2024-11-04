-- ~/.config/nvim/lua/configs/avante.lua
return {
  provider = "openai",
  auto_suggestions_provider = "openai", -- Using same provider for consistency
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o-mini", -- More cost-effective model
    temperature = 0,
    max_tokens = 1000, -- Reduced token limit for efficiency
  },
  behaviour = {
    auto_suggestions = true,
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
  },
  mappings = {
    diff = {
      ours = "co",
      theirs = "ct",
      all_theirs = "ca",
      both = "cb",
      cursor = "cc",
      next = "]x",
      prev = "[x",
    },
    suggestion = {
      -- accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    sidebar = {
      apply_all = "A",
      apply_cursor = "a",
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
    },
    inline = {
      normal = "<leader>a",     -- Generate in normal mode
      visual = "<leader>a",     -- Generate for selected text
      insert = "<C-a>",        -- Generate in insert mode
  },
  hints = { enabled = true },
  windows = {
    position = "right",
    wrap = true,
    width = 30,
    sidebar_header = {
      enabled = true,
      align = "center",
      rounded = true,
    },
    input = {
      prefix = "> ",
    },
    edit = {
      border = "rounded",
      start_insert = true,
    },
    ask = {
      floating = true,
      start_insert = true,
      border = "rounded",
    },
  },
  highlights = {
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  diff = {
    autojump = true,
    list_opener = "copen",
  },
}
}
