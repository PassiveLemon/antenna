local config = { }

config.mode = os.getenv("ANTENNA_MODE") or "ffmpeg"

config.ssh_path = os.getenv("ANTENNA_SSH_PATH") or "/usr/bin/ssh"
config.ssh_host = os.getenv("ANTENNA_SSH_HOST") or ""
config.ssh_id =  os.getenv("ANTENNA_SSH_ID") or (os.getenv("HOME") .. "/.ssh/id_ed25519")
config.ssh_flags = {
  "-i",
  config.ssh_id,
  config.ssh_host,
}

config.ffmpeg_path = os.getenv("ANTENNA_FFMPEG_PATH") or "/usr/bin/ffmpeg"
config.ffprobe_path = os.getenv("ANTENNA_FFPROBE_PATH") or "/usr/bin/ffprobe"
config.ffmpeg_fallback_path = os.getenv("ANTENNA_FFMPEG_ALLBACK_PATH") or "/usr/bin/ffmpeg"
config.ffprobe_fallback_path = os.getenv("ANTENNA_FFPROBE_FALLBACK_PATH") or "/usr/bin/ffprobe"

config.map_dirs = os.getenv("ANTENNA_MAP_DIRS") -- Don't or to "" because we may not need to map

-- Make sure there's is at least a value for each (except ANTENNA_MAP_DIRS)
for k, v in pairs(config) do
  if (v == "") then
    print("Error: " .. k .. " was not defined")
    os.exit(1)
  end
end

return config

