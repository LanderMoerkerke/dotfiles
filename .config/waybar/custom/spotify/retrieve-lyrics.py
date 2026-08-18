#!/usr/bin/env python
"""Single long-running `sptlrx pipe`; writes the CURRENT lyric line to a regular
state file (truncated each line). Readers (waybar) just read the file — no FIFO,
so nothing blocks, and there is exactly one writer. Run by spotify-lyrics.service
(Restart=always), which relaunches this if sptlrx exits (e.g. on player restart).
"""
import subprocess

OUT = "/tmp/lyrics-current"

proc = subprocess.Popen(["sptlrx", "pipe"], stdout=subprocess.PIPE, text=True, bufsize=1)
assert proc.stdout is not None
for line in proc.stdout:
    with open(OUT, "w") as f:  # truncate + write the latest line only
        f.write(line.rstrip("\n"))
