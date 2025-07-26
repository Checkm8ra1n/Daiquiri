# Checkra1n.py
# Daiquiri
# Created by Checkm8Croft on 26/07/25

import os
import subprocess
import shutil
import time

dmg_url = "https://assets.checkra.in/downloads/macos/754bb6ec4747b2e700f01307315da8c9c32c8b5816d0fe1e91d1bdfc298fe07b/checkra1n%20beta%200.12.4.dmg"
dmg_path = "/tmp/Checkra1n.dmg"
mount_point = "/Volumes/checkra1n 0.12.4"

def download_dmg():
    print("Downloading Checkra1n.dmg...")
    subprocess.run(["curl", "-L", "-o", dmg_path, dmg_url], check=True)

def mount_dmg():
    print("Mounting DMG...")
    subprocess.run(["hdiutil", "attach", dmg_path], check=True)

def copy_app():
    print("Copying Checkra1n.app to /Applications...")
    app_source = os.path.join(mount_point, "checkra1n.app")
    app_dest = "/Applications/checkra1n.app"
    if os.path.exists(app_dest):
        print("Old Checkra1n.app found, removing...")
        shutil.rmtree(app_dest)
    shutil.copytree(app_source, app_dest)

def unmount_dmg():
    print("Unmounting DMG...")
    subprocess.run(["hdiutil", "detach", mount_point], check=True)

def cleanup():
    print("Deleting downloaded DMG...")
    os.remove(dmg_path)

def main():
    try:
        download_dmg()
        mount_dmg()
        # Sleep a second to make sure the disk is fully mounted
        time.sleep(2)
        copy_app()
        unmount_dmg()
        cleanup()
        print("✅ Checkra1n installed successfully!")
    except subprocess.CalledProcessError as e:
        print("❌ Error during installation:", e)
    except Exception as e:
        print("❌ General error:", e)

if __name__ == "__main__":
    main()
