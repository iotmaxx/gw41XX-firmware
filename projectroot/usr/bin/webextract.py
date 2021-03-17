import os
import subprocess

def run_subprocess(args=[]):
    if not args or len(args) == 0:
        raise EmptyArgsException()
    try:
        result = subprocess.run(
            args,
            capture_output=True,
            check=True
        )
    except subprocess.CalledProcessError as cpe:
        result = cpe
    except Exception as e:
        result = e
    return result

def extract():
    path = '/root/gw-backend.zip'
    if os.path.isfile(path):
        args = ['mount', '-o', 'remount,rw', '/']
        run_subprocess(args=args)
        args = ['unzip', '/root/gw-backend.zip', '-d', '/usr/lib/python3.7/site-packages/']
        run_subprocess(args=args)
        args = ['rm', '/root/gw-backend.zip',]
        run_subprocess(args=args)
        args = ['systemctl', 'start','webinterface']
        run_subprocess(args=args)
        args = ['systemctl', 'disable','webextract']
        run_subprocess(args=args)
        args = ['mount', '-o', 'remount,ro', '/']
        run_subprocess(args=args)        

if __name__ == "__main__":
    extract()

