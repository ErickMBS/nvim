return {
	{
    -- útil para marcações e navegação
    -- Modo de uso:
    --
    -- m<letra>         ->  Cria uma marcação letra
    -- dm<letra>        ->  Remove uma marcação letra
    -- m]               ->  Move para a próxima marca
    -- m[               ->  Move para a marca anterior
    --
    -- m[0-9]           -> Cria um grupo de bookmark
    -- dm[0-9]          -> Remove todos os bookmarks do mesmo grupo
    -- m}               -> Move para o próximo bookmark do mesmo tipo
    -- m{               -> Move para o bookmark anterior do mesmo tipo
    -- dm=              -> deleta o bookmark da linha que está o cursor
		'chentoast/marks.nvim',
		event = "VeryLazy",
		config = function()
			require('marks').setup({})
		end
	},
}
