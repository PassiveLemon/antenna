# antenna

WIP

Inspired by rffmpeg, Antenna also aims to allow running ffmpeg commands on other hosts, but with tighter integration and more configuration.
Currently, rffmpeg will redirect ffmpeg calls verbatim, meaning that input/output paths need to be the same on both systems. This gets more complicated when used in a Docker container because bind mounts are often at locations like `/data` or `/config`, not default root directories.
Additionally, rffmpeg relies on something like an NFS share to return the outputed files. Because of these, configuration can be complicated and insecure because NFS doesn't encrypt transfered data by default.
The goal of Antenna is to address these issues with two primary additions:
- Rewriting source and destination paths. This by itself would mostly solve the biggest issue of host/client path differences.
- Returning output files over SFTP. We already create an SSH session to run commands, so we could easily use SFTP to return output files. This would eliminate the need for NFS shares and also protect all transfered data by means of SSH.

Todo:
- [ ] General
  - [ ] Env var configuration to avoid using flags
- [ ] SSH
  - [ ] SSH session
  - [ ] Run commands
  - [ ] Return output files over SFTP
- [ ] FFmpeg
  - [ ] Path rewriting
  - [ ] Wait for SFTP return before exiting

