return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    local logo = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠠⣄⠖⡚
⠀⠀⠀⠀⠀⠀⠀⠠⣶⠤⢀⡩⠛⠛⠻⡛⠉⠷⠒⠉⠁⡠⠊⠀⡞⠀
⠀⠀⠀⠀⢀⠤⠒⠉⠀⢀⡞⠁⠀⠀⡰⠀⠀⢠⠂⠀⠰⢔⡀⠰⠀⠀  z
⠀⠀⣠⠞⠁⠀⡐⠀⠀⡜⠀⠀⠀⠀⡇⠀⠀⡌⠀⠀⢆⠀⣠⠁⠀⠀z
⠠⠊⣥⣐⣒⣸⡁⠐⠀⠃⠀⢀⠀⣰⣇⠀⠀⠀⢸⠀⠀⢃⢡⠀Z⠀⠀
⠀⠀⠀⠀⠀⣿⠀⠀⢠⡄⠀⢈⠀⣷⠘⣆⣀⣄⡘⡇⠀⠘⠸⡇⠀⠀
⠀⠀⠀⠀⠀⣯⠀⡀⣇⢱⡀⠘⠀⡇⠈⣩⣄⣀⡈⢻⠀⡗⡄⣿⠀⠀
⠀⠀⠀⠀⠀⣿⠀⣏⣷⣴⣷⡀⢃⣇⠉⠁⡾⣿⢯⢻⠀⡷⠀⣿⠀⠀
⠀⠀⠀⠀⠀⣧⢧⢨⣷⠜⠿⠏⠈⠾⠄⠀⠈⠉⠀⢸⢸⢳⠀⣽⠀⠀
⠀⠀⠀⠀⠀⡿⠀⢎⢛⣃⠀⠀⠀⠀⠀⠀⠀⠀⢠⢾⢸⢀⣧⢹⠇⠀
⠀⠀⠀⠀⣸⠃⠀⢸⠞⣦⢣⣀⠀⠀⠀⠐⢀⣴⡿⡀⡇⢘⠟⡈⡸⡄
⠀⠀⠀⠀⠁⠀⠀⠈⢸⠈⡆⢦⠉⢐⡦⠴⠛⠁⢠⣥⠅⠞⣣⠉⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠹⠀⢰⠸⡸⠔⠁⠀⠀⠀⠀⠘⠀⠀⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⡁⡤⠐⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⡐⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ]]
    opts.config = opts.config or {}
    opts.config.header = vim.split(logo, "\n")
    return opts
  end,
}
