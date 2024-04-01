#!/bin/python

import os
import subprocess

pipe_path = "/tmp/lyrics"
try:
    os.mkfifo(pipe_path)
except FileExistsError:
    pass

process = subprocess.Popen(["sptlrx", "pipe"], stdout=subprocess.PIPE)

for line in iter(process.stdout.readline, ""):
    with open(pipe_path, "wb") as pipe:
        pipe.write(line)
