#!/usr/bin/python

import subprocess
import sys
import os

link_external = 'sudo ln -s /etc/X11/xorg.conf.d/nvidia.device /etc/X11/xorg.conf'
link_internal = 'sudo ln -s /etc/X11/xorg.conf.d/intel.device /etc/X11/xorg.conf'
unlink = 'sudo rm /etc/X11/xorg.conf'
output = str(subprocess.check_output("lspci"))
nvidia = output.find("NVIDIA")

def switch_to_external():
    if nvidia != -1:
        if os.path.exists('/etc/X11/xorg.conf'):
            os.system(unlink)
        if not os.path.exists('/etc/X11/xorg.conf'):
            os.system(link_external)
            return True
    return False

def switch_to_internal():
    if os.path.exists('/etc/X11/xorg.conf'):
        os.system(unlink)
    if not os.path.exists('/etc/X11/xorg.conf'):
        os.system(link_internal)
        return True
    return False
if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Error: check your arguments!")
        print("python3 switch (external|internal)")
    else:
        if sys.argv[-1] == 'internal':
            reset = switch_to_internal()
        elif sys.argv[-1] == 'external':
            reset = switch_to_external()

        if reset:
            subprocess.call(['sudo', 'systemctl', 'restart', 'display-manager.service'])


