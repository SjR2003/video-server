#!/bin/sh

# Load YAML parsing tools
apk add --no-cache python3 py3-pip
pip3 install pyyaml

echo "Starting video streamer..."

python3 - << 'EOF'
import yaml, subprocess, time, os

# Read configuration
with open("/app/streams.yaml", "r") as f:
    cfg = yaml.safe_load(f)

streams = cfg.get("streams", [])

if not streams:
    print("No streams defined in streams.yaml")
    exit(1)

print(f"Launching {len(streams)} RTSP streams...")

for s in streams:
    stream_id = s["id"]
    file_path = s["file"]
    loop_flag = s.get("loop", True)

    # loop or not
    loop_param = "-stream_loop -1" if loop_flag else ""

    # RTSP output URL
    rtsp_url = f"rtsp://rtsp-server:8554/{stream_id}"

    cmd = f"ffmpeg -re {loop_param} -i {file_path} -c copy -fflags +genpts -avoid_negative_ts make_zero -use_wallclock_as_timestamps 1 -f rtsp {rtsp_url}"

    print(f"Starting stream: {stream_id} → {rtsp_url}")
    subprocess.Popen(cmd, shell=True)

time.sleep(1e9)
EOF
