local ts = require('telescope')

ts.setup {
	extensions = {
		undo = {
			use_delta = true,
			use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
			side_by_side = true,
			diff_context_lines = vim.o.scrolloff,
			entry_format = "state #$ID, $STAT, $TIME",
			time_format = "",
			saved_only = false,
		},
		file_browser = {

		}
	},
}

function load(name)
	ts.load_extension(name)
end

load('undo')
load('file_browser')
