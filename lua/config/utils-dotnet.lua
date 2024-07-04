local M = {}

M.generate_launch_json = function(has_src, net_version, project_name)
  local json = [[
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": ".NET Core Launch (web)",
      "type": "coreclr",
      "request": "launch",
      "preLaunchTask": "build",
      "program": "${workspaceFolder}/]] .. (has_src and "src/" or "") .. project_name .. [[/bin/Debug/]] .. net_version .. [[/]] .. project_name .. [[.dll",
      "args": [],
      "cwd": "${workspaceFolder}/]] .. (has_src and "src/" or "") .. project_name .. [[",
      "stopAtEntry": false,
      "serverReadyAction": {
        "action": "openExternally",
        "pattern": "\\bNew listening on:\\s+(https?://\\S+)"
      },
      "env": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      },
      "sourceFileMap": {
        "/Views": "${workspaceFolder}/Views"
      }
    },
    {
      "name": ".NET Core Attach",
      "type": "coreclr",
      "request": "attach"
    }
  ]
}
  ]]

  local vscode_path = vim.fn.getcwd() .. "/.vscode"
  local launch_json_path = vscode_path .. "/launch.json"

  -- Create .vscode directory if it doesn't exist
  if vim.fn.isdirectory(vscode_path) == 0 then
    vim.fn.mkdir(vscode_path, "p")
  end

  local file = io.open(launch_json_path, "w")
  file:write(json)
  file:close()
  print("launch.json created at " .. launch_json_path)
  vim.notify("launch.json created at " .. launch_json_path, "success")
end

M.is_dotnet_project = function()
  local files = vim.fn.glob("*.csproj", false, true)
  local sln = vim.fn.glob("*.sln", false, true)
  return #files > 0 or #sln > 0
end

M.pre_build_command = function ()
  if M.is_dotnet_project() then
    vim.cmd("!dotnet build")
    vim.notify("build ok", "info")
  end
end

return M
