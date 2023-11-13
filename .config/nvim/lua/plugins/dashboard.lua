local function default_header()
	return {
		"",
		"",
		"",
" /$$   /$$ /$$$$$$$$  /$$$$$$  /$$    /$$ /$$$$$$ /$$      /$$",
"| $$$ | $$| $$_____/ /$$__  $$| $$   | $$|_  $$_/| $$$    /$$$",
"| $$$$| $$| $$      | $$  \\ $$| $$   | $$  | $$  | $$$$  /$$$$",
"| $$ $$ $$| $$$$$   | $$  | $$|  $$ / $$/  | $$  | $$ $$/$$ $$",
"| $$  $$$$| $$__/   | $$  | $$ \\  $$ $$/   | $$  | $$  $$$| $$",
"| $$\\  $$$| $$      | $$  | $$  \\  $$$/    | $$  | $$\\  $ | $$",
"| $$ \\  $$| $$$$$$$$|  $$$$$$/   \\  $/    /$$$$$$| $$ \\/  | $$",
"|__/  \\__/|________/ \\______/     \\_/    |______/|__/     |__/",
		"",
		"",
		"",
	}
end

require("dashboard").setup({
	theme = "doom",
	config = {
		header = default_header(),
		center = {
			{
				icon = "󰉋 ",
				icon_hl = "Title",
				desc = "Open tree",
				desc_hl = "String",
				key = "e",
				key_hl = "Number",
				action = ":Ranger",
			},
			{
				icon = "󰈞 ",
				icon_hl = "Title",
				desc = "Find files",
				desc_hl = "String",
				key = "f",
				key_hl = "Number",
				action = ":Telescope find_files",
			},
			{
				icon = " ",
				icon_hl = "Title",
				desc = "Git Braches",
				desc_hl = "String",
				key = "b",
				key_hl = "Number",
				action = ":Telescope git_branches",
			},
		},
	},
})
