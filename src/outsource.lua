#!/usr/bin/env lua

local config = require("config")
local ffmpeg = require("ffmpeg")

local function main(args)
  local result = ffmpeg.cmd(config, args)
  return result
end

main(arg)

