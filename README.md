# PortWatch

A simple, pure-Python TCP port scanner you run from the command line.

## What it does

- Scans a target IP for open TCP ports — a single port, a range, or all 65535.
- Reports each open port as it finds it, and flags ports that time out (no response — filtered or host down).
- Uses a configurable per-port timeout so a dead host fails fast instead of hanging.
- Optionally saves the list of open ports to a file with `-s`.
- Written in pure Python with only the standard library — no external packages to install.

## How it works

PortWatch tries to open a TCP connection to each port in turn. If the connection succeeds, the port is open. If the host actively refuses it, the port is closed (hidden from output). If nothing answers before the timeout, the port is reported as timed out. Bad input (invalid IP, malformed port range) is caught up front and the program exits with a clear message.

## Install

Quick install (one command):

    curl -sSL https://raw.githubusercontent.com/offby1n/PortWatch/main/install.sh | bash

This downloads PortWatch and installs it to `~/.local/bin` so you can run it from anywhere.

Or install from a clone:

    git clone https://github.com/offby1n/PortWatch.git
    cd PortWatch
    bash install.sh

If the `portwatch` command isn't found after installing, add `~/.local/bin` to your PATH.

## Updating

To update, just run the install again — it downloads the latest version and overwrites the old one:

    curl -sSL https://raw.githubusercontent.com/offby1n/PortWatch/main/install.sh | bash

## How to run

    portwatch 192.168.1.1                 # scan all ports (1-65535)
    portwatch 192.168.1.1 -p 22           # scan a single port
    portwatch 192.168.1.1 -p 20-25        # scan a range
    portwatch 192.168.1.1 -p 20-25 -t 1   # range with a 1-second timeout
    portwatch 192.168.1.1 -p 20-25 -s     # scan and save open ports to a file

Run `portwatch -h` for the full help.
