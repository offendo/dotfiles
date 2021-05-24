import subprocess
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

# DO NOT USE -- BREAKS THE LOGIN SEQUENCE FOR SOME REASON
