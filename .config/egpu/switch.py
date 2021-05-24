#!/usr/bin/python3


import sys
from pathlib import Path
sys.path.append(str(Path('/home/offendo/.config/egpu').resolve()))
import service
import subprocess

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Error: check your arguments!")
        print("python3 switch (external|internal)")
    else:
        if sys.argv[-1] == 'internal':
            reset = service.switch_to_internal()
        elif sys.argv[-1] == 'external':
            reset = service.switch_to_external()

        if reset:
            subprocess.call(['sudo', 'systemctl', 'restart', 'display-manager.service'])


