local M = {}

M.opts = {
  Dockerfile = { icon = "", color = "#61afef", name = "Dockerfile" },
  html = { icon = "", color = "#DE8C92", name = "html" },
  css = { icon = "", color = "#61afef", name = "css" },
  js = { icon = "", color = "#EBCB8B", name = "js" },
  jsx = { icon = "", color = "#519aba", name = "jsx" },
  ts = { icon = "ﯤ", color = "#519ABA", name = "ts" },
  lock = { icon = "", color = "#DE6B74", name = "lock" },
  png = { icon = "", color = "#BD77DC", name = "png" },
  jpg = { icon = "", color = "#BD77DC", name = "jpg" },
  jpeg = { icon = "", color = "#BD77DC", name = "jpeg" },
  svg = { icon = "", color = "#FFB13B", name = "svg" },
  webp = { icon = "", color = "#a1b7ee", name = "webp" },
  mp3 = { icon = "", color = "#C8CCD4", name = "mp3" },
  mp4 = { icon = "", color = "#C8CCD4", name = "mp4" },
  mkv = { icon = "", color = "#C8CCD4", name = "mkv" },
  out = { icon = "", color = "#C8CCD4", name = "out" },
  py = { icon = "", color = "#61afef", name = "py" },
  sql = { icon = "", color = "#ff75a0", name = "sql" },
  toml = { icon = "", color = "#61afef", name = "toml" },
  ttf = { icon = "", color = "#ff75a0", name = "TrueTypeFont" },
  gz = { icon = "", color = "#EBCB8B", name = "gz" },
  sh = { icon = "", color = "#6d8086", name = "sh" },
  xz = { icon = "", color = "#EBCB8B", name = "xz" },
  zip = { icon = "", color = "#EBCB8B", name = "zip" },
  [".gitignore"] = { icon = "", color = "#6d8086", name = "GitIgnore" },
  ["robots.txt"] = { icon = "ﮧ", color = "#74ba4b", name = "robots" },
  ["package.json"] = { icon = "", color = "#e8274b", name = "PackageJson" },
  ["package-lock.json"] = { icon = "", color = "#7a0d21", name = "PackageLockJson" },
  ["docker-compose.yml"] = { icon = "", color = "#F55385", name = "DockerCompose" }
}

M.start = function()

  local ok, devicons = pcall(require, "nvim-web-devicons")
  if not ok then return end

  devicons.set_icon(M.opts)

end

return M
