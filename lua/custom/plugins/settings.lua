vim.opt.conceallevel = 2

local spell_words = {}
for word in io.open(vim.fn.stdpath("config") .. "/spell/en.utf-8.add", "r"):lines() do
    table.insert(spell_words, word)
end

return {}
