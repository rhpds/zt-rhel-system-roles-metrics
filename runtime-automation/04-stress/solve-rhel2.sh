#!/bin/sh
stress --cpu 16 --io 3 --vm 5 --vm-bytes 128M --timeout 60s
