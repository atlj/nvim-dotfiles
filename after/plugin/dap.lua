local dap = require 'dap'

dap.adapters['pwa-node'] = {
  type = "server",
  host = "127.0.0.1",
  port = "${port}",
  executable = {
    command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/js-debug-adapter",
    args = { "${port}" },
  }
}

local reactNativeAttach = {
  type = "pwa-node",
  request = "attach",
  name = "Attach to React Native App",
  continueOnAttach = true,
  port = 8081,
  cwd = "${workspaceFolder}",
  resolveSourceMapLocations = { "**", "!**/node_modules/!(expo)/**" },
}

local reactNativeAttachMonorepo = {
  type = "pwa-node",
  request = "attach",
  name = "Attach to React Native Monorepo App",
  continueOnAttach = true,
  port = 8081,
  cwd = "${workspaceFolder}/apps/app",
  resolveSourceMapLocations = { "**", "!**/node_modules/!(expo)/**" },
}

local launchFile = {
  type = "pwa-node",
  request = "launch",
  name = "Launch file",
  program = "${file}",
  cwd = "${workspaceFolder}",
}

local languages = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' }

for _, language in ipairs(languages) do
  dap.configurations[language] = {
    reactNativeAttach,
    reactNativeAttachMonorepo,
    launchFile
  }
end
