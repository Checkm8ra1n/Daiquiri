# palera1n.py
# Daiquiri

import subprocess
import os

# Vai nella cartella temporanea
os.chdir("/tmp")

# URL dello script di installazione Palera1n
script_url = "https://static.palera.in/scripts/install.sh"
local_script = "install.sh"

def download_script():
    print("Downloading Palera1n install script...")
    subprocess.run(["curl", "-L", "-o", local_script, script_url], check=True)

def make_executable():
    print("Making script executable...")
    subprocess.run(["chmod", "+x", local_script], check=True)

def run_script():
    print("Running install script...")
    subprocess.run(["bash", local_script], check=True)

def main():
    try:
        download_script()
        make_executable()
        run_script()
        print("✅ Palera1n install script completed.")
    except subprocess.CalledProcessError as e:
        print("❌ Error during Palera1n install:", e)

if __name__ == "__main__":
    main()
