local log = { level = "info" }
local log_levels = {
  ["none"] = 0,
  ["fatal"] = 1,
  ["error"] = 2,
  ["warn"] = 3,
  ["info"] = 4,
  ["debug"] = 5,
}

function log.stop()
  log.file:close()
end

function log.start(cfg)
  log.level = cfg.log_level
  local file, err = io.open(cfg.log_dir, "a")
  -- Create the parent dirs if error
  if err then
    print("WARN: Could not open log file, creating parent directories...")
    os.execute("mkdir -p " .. cfg.log_dir:match("^.+/"))
    file, err = io.open(cfg.log_dir, "a")
  end
  if file then
    log.file = file
  else
    print("ERROR: Could not create log file at " .. cfg.log_dir .. ": " .. err)
  end
end

function log.write(lvl, txt)
  -- Normalize the level names
  local lvl_n = log_levels[string.lower(lvl)]
  local cur_n = log_levels[string.lower(log.level)]
  if (lvl_n <= cur_n) then
    log.file:write(lvl .. ": " .. txt .. "\n")
  end
end

function log.debug(txt)
  log.write("DEBUG", txt)
end

function log.info(txt)
  log.write("INFO", txt)
end

function log.warn(txt)
  log.write("WARN", txt)
end

function log.error(txt)
  log.write("ERROR", txt)
end

function log.fatal(txt)
  log.write("FATAL", txt)
  os.exit(1)
end

return log

