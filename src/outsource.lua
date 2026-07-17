#!/usr/bin/env lua

local log = require("log")
local config = require("config")
local ffmpeg = require("ffmpeg")

local function main(args)
  log.start(config)
  ffmpeg.cmd(config, args)
  log.stop()
end

main(arg)

