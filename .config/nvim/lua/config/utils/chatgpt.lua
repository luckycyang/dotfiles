require("chatgpt").setup({
  -- from stdout get info
  api_key_cmd = "pass show api/tokens/openai",

  openai_params = {
    -- NOTE: model can be a function returning the model name
    -- this is useful if you want to change the model on the fly
    -- using commands
    -- Example:
    -- model = function()
    --     if some_condition() then
    --         return "gpt-4-1106-preview"
    --     else
    --         return "gpt-3.5-turbo"
    --     end
    -- end,
    model = "gpt-4o",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 4095,
    temperature = 0.2,
    top_p = 0.1,
    n = 1,
  },
})