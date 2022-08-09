local config = {}

function config.black()
    vim.g.black_fast = 1
    vim.g.black_linelength = 79
end

function config.emmet_vim()
    vim.g.user_emmet_leader_key = '<C-s>'
end

return config
