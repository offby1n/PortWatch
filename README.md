# PortWatch

A simple, Python TCP port scanner you run from the command line.

## What it does

- Scans a target IP for open TCP ports, either a single port, a range, or all 65535.
- Reports each open port as it finds it, and flags ports that time out (no response — filtered or host down).
- Uses a configurable per-port timeout so a dead host fails fast instead of hanging.
- Written in pure Python with only the standard library — no external packages to install.

## How it works

PortWatch tries to open a TCP connection to each port in turn. If the connection succeeds, the port is open. If the host actively refuses it, the port is closed (hidden from output). If nothing answers before the timeout, the port is reported as timed out. Bad input (invalid IP, malformed port range) is caught up front and the program exits with a clear message.

## How to run

Install it so you can run it from anywhere:

    git clone https://github.com/dimitrispapastamatis/PortWatch.git
    cd PortWatch
    bash install.sh

Then run it:

    portwatch 192.168.1.1              # scan all ports (1-65535)
    portwatch 192.168.1.1 -p 22        # scan a single port
    portwatch 192.168.1.1 -p 20-25     # scan a range
    portwatch 192.168.1.1 -p 20-25 -t 1  # range with a 1-second timeout

Run `portwatch -h` for the full help.
