return {
    "ggandor/leap.nvim",
    lazy = false,
    config = function(_, _)
        require("leap").create_default_mappings()
    end
}
