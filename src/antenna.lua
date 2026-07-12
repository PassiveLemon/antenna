#!/usr/bin/env lua

local config = require("config")
local ffmpeg = require("ffmpeg")

local function main(args)
  ffmpeg.cmd(config, args)
end

main(arg)

