
# Qwen3-4B-Thinking-2507 with Mozilla llamafile

Run a local AI model on macOS, Windows, or Linux using Mozilla llamafile and a GGUF model stored on your computer or external USB drive.

## Features

- Runs locally without sending prompts to a cloud AI service.
- Supports macOS, Windows, and Linux.
- Includes one-click launch scripts.
- Provides a local web interface at `http://127.0.0.1:8080`.
- Uses a quantized Qwen3-4B-Thinking-2507 model.

## 1. Requirements

- A Mac, Windows PC, or Linux computer.
- An external USB drive or sufficient internal storage.
- Internet access for the initial downloads.
- Approximately 3–5 GB or more of free storage for the model and runtime.
- Additional RAM for inference and the context cache.

The Q4_K_M model is approximately 2.5 GB. Actual memory requirements depend on context size and runtime settings.

## 2. Download llamafile

Open the official releases page:

https://github.com/mozilla-ai/llamafile/releases

Download a binary appropriate for your operating system.

### macOS

1. Download the macOS-compatible `llamafile-0.10.6-thin` asset.
2. Rename it to `llamafile`.
3. Place it in your project folder.

### Linux

1. Download the compatible Linux llamafile binary from the releases page.
2. Rename it to `llamafile`.
3. Place it in your project folder.

### Windows

1. Download the Windows executable, such as `llamafile-0.10.6.exe`.
2. Rename it to `llamafile.exe`.
3. Place it in your project folder.

Always check the release notes and available assets if the version or filenames have changed.

## 3. Download the Qwen model

Open the model repository:

https://huggingface.co/QuantFactory/Qwen3-4B-Thinking-2507-GGUF

1. Open the Files and versions section.
2. Download the Q4_K_M GGUF model file.
3. Rename the downloaded file to:

   `qwen3-4b-thinking-2507.Q4_K_M.gguf`

4. Put the model in the same folder as the llamafile executable.

The final folder should contain both the executable for your operating system and the GGUF model.

## 4. Start on macOS or Linux

Save the following script as `start-mac-linux.sh` in the same folder:

```bash
#!/usr/bin/env bash
set -e

cd -- "$(dirname -- "$0")"

MODEL="qwen3-4b-thinking-2507.Q4_K_M.gguf"

if [ ! -f "./llamafile" ]; then
  echo "ERROR: llamafile executable not found."
  exit 1
fi

if [ ! -f "$MODEL" ]; then
  echo "ERROR: Model file not found: $MODEL"
  exit 1
fi

chmod +x ./llamafile

exec ./llamafile \
  -m "$MODEL" \
  --server \
  --host 127.0.0.1 \
  --port 8080 \
  -c 8192 \
  -n 2048
```

### Run on macOS

Open Terminal and navigate to the folder. For example:

```bash
cd "/Volumes/KPG"
chmod +x start-mac-linux.sh
./start-mac-linux.sh
```

The `/Volumes/KPG` path is an example for a Mac external drive. Replace it with your actual folder path.

### Run on Linux

Open a terminal in the project folder and run:

```bash
chmod +x start-mac-linux.sh
./start-mac-linux.sh
```

Keep the terminal open while the server is running.

## 5. Start on Windows

Save this script as `start-windows.bat` in the same folder:

```bat
@echo off
setlocal

cd /d "%~dp0"

set "MODEL=qwen3-4b-thinking-2507.Q4_K_M.gguf"

if not exist "llamafile.exe" (
    echo ERROR: llamafile.exe was not found.
    pause
    exit /b 1
)

if not exist "%MODEL%" (
    echo ERROR: Model file was not found: %MODEL%
    pause
    exit /b 1
)

llamafile.exe ^
  -m "%MODEL%" ^
  --server ^
  --host 127.0.0.1 ^
  --port 8080 ^
  -c 8192 ^
  -n 2048

pause
```

Double-click `start-windows.bat` to launch the model.

Keep the terminal window open while using the server.

## 6. Open the local AI interface

After starting the model, wait until the terminal reports that the model is loaded and the server is listening.

Open your browser and visit:

http://127.0.0.1:8080

If the browser interface does not appear, check the terminal for errors.

## 7. Context and output settings

The launch scripts use these conservative initial settings:

| Setting | Value | Purpose |
| --- | ---: | --- |
| Context size | 8192 | Working context for the conversation |
| Output limit | 2048 | Maximum generated tokens per request |
| Host | 127.0.0.1 | Local computer only |
| Port | 8080 | Local server port |

The context includes the prompt and conversation history, not just the answer. Output tokens are a separate per-response limit.

If your computer has sufficient RAM, you can try a larger context, such as 16384. Increase it gradually and monitor memory usage.

## 8. Stop the server

- macOS/Linux: press `Ctrl+C` in the terminal.
- Windows: press `Ctrl+C` in the command window and confirm if prompted.

## 9. Troubleshooting

### Model file not found

Check that the GGUF filename matches the script exactly. Ensure the file extension is `.gguf`.

### Executable not found

Make sure the executable is in the same folder as the launch script. Windows needs `llamafile.exe`; macOS and Linux use `llamafile`.

### Permission denied on macOS/Linux

Run:

```bash
chmod +x llamafile start-mac-linux.sh
```

### Port 8080 is already in use

Stop the other server or change `8080` to another available port in both the script and the browser URL.

### Out of memory or very slow performance

Close other applications and lower the context size, for example from `8192` to `4096`.

### macOS security warning

Only run a binary downloaded from the official project release page. Review macOS security warnings rather than bypassing them blindly.

## 10. Security and privacy

The default configuration binds to `127.0.0.1`, which keeps the server accessible only from the same computer.

Do not expose the server directly to your local network or the public internet without configuring appropriate access controls.

## 11. GitHub repository hygiene

Do not commit large model files or platform executables. Add a `.gitignore` file:

```gitignore
*.gguf
llamafile
llamafile.exe
.DS_Store
Thumbs.db
```

## References

- Mozilla llamafile releases:
  https://github.com/mozilla-ai/llamafile/releases
- Qwen3-4B-Thinking-2507 GGUF model:
  https://huggingface.co/QuantFactory/Qwen3-4B-Thinking-2507-GGUF
- Mozilla llamafile documentation:
  https://github.com/mozilla-ai/llamafile

---
