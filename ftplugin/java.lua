local jdtls_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls/"
local jar_path = jdtls_path .. "plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar"
local config_path = jdtls_path .. "config_linux"

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    jar_path,
    "-configuration",
    config_path,
    "-data",
    "/home/joker/workspace",
  },

  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },

  settings = { java = {} },

  init_options = { bundles = {} },
}

require("jdtls").start_or_attach(config)
