require("CopilotChat").setup {
  auto_fold = true, -- Automatically folds non-assistant messages
  auto_insert_mode = true, -- Automatically enter insert mode when a suggestion is made
  headers = {
    user = '👤 You',
    assistant = '🤖 Copilot',
    tool = '🔧 Tool',
  },
  separator = '━━',
  trusted_tools = nil, -- List of trusted tools that can be executed without confirmation
  window = {
    layout = 'float',
    width = 100, -- Fixed width in columns
    height = 40, -- Fixed height in rows
    border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
    title = '🤖 AI Assistant',
    zindex = 100, -- Ensure window stays on top
    blend = 20, -- Transparency level (0-100)
  },
}

vim.keymap.set('n', '<leader>cpe', ":Copilot enable<CR>", { desc = 'Enable Copilot' })
vim.keymap.set('n', '<leader>cpd', ":Copilot disable<CR>", { desc = 'Disable Copilot' })
vim.keymap.set('n', '<leader>cpo', ":CopilotChatOpen<CR>", { desc = 'Open Copilot Chat' })
vim.keymap.set('n', '<leader>cpp', ":CopilotChatPrompts<CR>", { desc = 'Open Copilot Chat Prompt selection' })
