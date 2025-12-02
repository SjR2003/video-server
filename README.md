# RTSP Video Streaming Server

<video src="https://github.com/user-attachments/assets/9931d552-5196-4dc4-b80c-a0b4cbd54bad" 
       width="640" 
       autoplay 
       loop 
       muted 
       playsinline>
</video>


A lightweight Dockerized solution for generating **live RTSP streams** from local video files using **FFmpeg** + **MediaMTX**



## Features

-  Stream **any video file** (MP4, AVI, MOV, MKV, etc.)
-  Optional infinite loop playback
-  Auto-publish multiple streams from `streams.yaml`
-  Fully Dockerized (FFmpeg + MediaMTX)
-  Easy RTSP access: `rtsp://localhost:8554/<stream_id>`



## Directory Structure

```

video-streamer/ 
├── streams.yaml		# Stream configuration
├── videos/           	# Your video sources
│   ├── video_01.mov
│   ├── video_02.avi
│   ├── ... 
├── docker-compose.yml 
├── Dockerfile 
└── start.sh
```



## Quick Start

1. **Add video files** to the `videos/` directory (named `video_01.mp4`, `video_02.avi`, etc.)

2. **Edit** `streams.yaml` to customize streams:

   ```
   streams:
     - id: your_stream_name
       file: /videos/your_video.mp4
       loop: true
   ```

3. **Start services:**

   ```bash
   docker-compose up -d
   ```

4. **Access streams**

   ```
   rtsp://localhost:8554/your_stream_name
   ```



## Usage Example

1. `videos/` directory

   ```
   videos/
       video_01.mov
       video_02.avi
       video_03.mp4
       video_04.avi
   ```

2. `streams.yaml`

   ```
   streams:
     - id: cam1
       file: /videos/video_01.mov
       loop: true
   
     - id: cam2
       file: /videos/video_02.avi
       loop: true
   
     - id: cam3
       file: /videos/video_03.mp4
       loop: true
   
     - id: cam4
       file: /videos/video_04.avi
       loop: true
   ```

3. run `docker-compose up -d` in CMD.

4. stream it `rtsp://localhost:8554/cam1`, `rtsp://localhost:8554/cam2`, `rtsp://localhost:8554/cam3`, `rtsp://localhost:8554/cam4`

## Done!

You now have a fully functional RTSP generator ideal for testing.

