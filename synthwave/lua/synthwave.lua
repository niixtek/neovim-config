local T = {}

function T.setup(opts)
end 

function T.setcolor()
	local palette = {
		fg = '#a9d2d4',
		bg = '#fe428e'

	}

	if vim.g.colors_name then
		vim.cmd('hi clear')
	end
end
return T
