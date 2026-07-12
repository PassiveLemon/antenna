local ssh = require("ssh")

local ffmpeg = { }

-- Rewrite paths and return all ffmpeg args
function ffmpeg.rewrite_paths(cfg, args)
  -- Remove cmd and rewrite all paths that match a mapping
  args[0] = nil
  for i, _ in ipairs(args) do
    for path_map in cfg.map_dirs:gmatch("[^;]+") do
      local from = path_map:match('^(.-)//')
      local to = path_map:match('/(/.-)$')
      args[i] = args[i]:gsub(from, to)
    end
  end
  return args
end

-- The ffmpeg command to run
function ffmpeg.cmd(cfg, args)
  local cmd = cfg.ffmpeg_path
  local flags = ffmpeg.rewrite_paths(cfg, args)
  ssh.cmd(cfg, cmd, flags)
end

return ffmpeg

