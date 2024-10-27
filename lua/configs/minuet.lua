return {
    provider_options = {
        openai = {
            model = 'gpt-4o-mini',
            system = {
                prompt = function()
                    return [[You are a programming expert. When given a comment or request, provide appropriate code implementation. Keep responses concise and focused. Use common libraries and best practices where appropriate. Don't explain the code unless asked.]]
                end,
            },
            few_shots = function()
                return require('minuet.config').default_few_shots
            end,
            stream = true,
            optional = {
                max_tokens = 256,
            },
        },
    },
}
