local jdtls_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls/plugins/"
local jar_path = jdtls_path .. "org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar"
local config_path = jdtls_path .. "config_linux"
local home = vim.fn.expand "$HOME" .. "/.workspace"

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
    home,
  },

  root_dir = require("jdtls.setup").find_root { ".git", "mvnw", "gradlew" },

  settings = { java = {} },

  init_options = { bundles = {} },
}

require("jdtls").start_or_attach(config)
