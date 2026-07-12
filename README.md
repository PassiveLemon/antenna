# antenna

WIP

Run FFmpeg commands on another host

Inspired by rffmpeg, Antenna also aims to allow running ffmpeg commands on other hosts, but with more configuration.
Currently, rffmpeg will redirect ffmpeg calls verbatim, meaning that input/output paths need to be the same on both systems.
This means that you may need to put NFS shares in a couple places on the clients filesystem to ensure all host internal paths are mapped correctly.
This gets more complicated when used in a Docker container because bind mounts are often at locations like `/data` or `/config`, not default root directories.

The goal of Antenna is to address this issue by rewriting source and destination paths. By controlling the paths and using SSH, we could also mount an SFTP share from the host to the client so that NFS isn't even needed.

Todo:
- General
  - [x] Env var configuration to avoid using flags
- [x] SSH
  - [x] SSH session
  - [x] Run commands
  - [ ] Start an sftp share from the host to client?
- [ ] FFmpeg
  - [x] Determine input path
  - [x] Rewrite input
  - [ ] Determine output paths
    - There's not one single output path so we have to find them by searching the args. eg: -hls_segment_filename
  - [ ] Rewrite outputs

