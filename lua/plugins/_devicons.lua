return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  opts = {
    css = { icon = "", color = "#61afef", name = "css" },
    html = { icon = "", color = "#DE8C92", name = "html" },
    js = { icon = "", color = "#EBCB8B", name = "js" },
    jsx = { icon = "", color = "#519aba", name = "jsx" },
    py = { icon = "", color = "#61afef", name = "py" },
    sh = { icon = "", color = "#6d9086", name = "sh" },
    sql = { icon = "", color = "#ff75a0", name = "sql" },
    ts = { icon = "", color = "#519ABA", name = "ts" },
    toml = { icon = "", color = "#61afef", name = "toml" },
    jpg = { icon = "", color = "#BD77DC", name = "jpg" },
    jpeg = { icon = "", color = "#BD77DC", name = "jpeg" },
    key = { icon = "", color = "#7a0d21", name = "key" },
    pem = { icon = "", color = "#e8274b", name = "pem" },
    png = { icon = "", color = "#BD77DC", name = "png" },
    svg = { icon = "", color = "#FFB13B", name = "svg" },
    ttf = { icon = "", color = "#ff75a0", name = "TrueTypeFont" },
    webp = { icon = "", color = "#a1b7ee", name = "webp" },
    [".gitignore"] = { icon = "", color = "#6d8086", name = "GitIgnore" },
    ["robots.txt"] = { icon = "ﮧ", color = "#74ba4b", name = "robots" },
    ["package.json"] = { icon = "", color = "#e8274b", name = "PackageJson" },
    ["package-lock.json"] = { icon = "", color = "#7a0d21", name = "PackageLockJson" },
    ["docker-compose.yml"] = { icon = "", color = "#F55385", name = "DockerCompose" },
  },
  config = function(_, opts)
    require("nvim-web-devicons").set_icon(opts)
  end,
}
