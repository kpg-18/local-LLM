# Qwen3-4B-Thinking-2507 — Local LLM Setup

Run **Qwen3-4B-Thinking-2507** locally using Mozilla llamafile on macOS, Windows, or Linux.

**GitHub repository:** https://github.com/kpg-18/local-LLM

## Features

- Run an AI language model locally on your computer.
- Use a local browser-based interface.
- Store model files on an external USB drive.
- Support for macOS, Windows, and Linux with the appropriate llamafile binary.
- No cloud API key is required for local inference.

## 1. What is included in this repository?

The repository contains the following files:

| File | Purpose |
|---|---|
| `llamafile` | llamafile executable included in the repository |
| `llamafile-0.10.6-thin` | Additional llamafile executable |
| `start.command` | Startup script for macOS |
| `start.txt` | Text instructions or script reference |

**Important:** The repository does not include the Qwen GGUF model. Windows and Linux users must also obtain the appropriate executable for their operating system.

## 2. What must you download separately?

### A. Download the Qwen model

Model repository:

https://huggingface.co/QuantFactory/Qwen3-4B-Thinking-2507-GGUF

Steps:

1. Open the link.
2. Select the file named `Qwen3-4B-Thinking-2507.Q4_K_M.gguf`.
3. Download the complete file.
4. Keep the filename consistent with the startup script.

The model file is approximately 2.7 GB, so ensure you have sufficient free storage.

### B. Download llamafile if needed

Official releases:

https://github.com/mozilla-ai/llamafile/releases

Download a binary compatible with your operating system and processor.

- **macOS:** Use a compatible macOS llamafile binary.
- **Windows:** Download the compatible Windows executable, usually an `.exe` file.
- **Linux:** Download a compatible Linux binary.

Do not run a Windows executable on macOS or Linux. If you already downloaded the correct executable from this repository, you do not need another copy.

## 3. Recommended folder structure

Keep the executable, model, and startup script together in one folder.

```text
local-LLM/
├── llamafile
├── llamafile-0.10.6-thin
├── start.command
├── start.txt
└── Qwen3-4B-Thinking-2507.Q4_K_M.gguf
```

Windows users should use `llamafile.exe` instead of the macOS/Linux executable.

You can store this folder on an external USB drive, provided the drive has sufficient free space and the filesystem supports files of this size.

## 4. Run on macOS

1. Download the model file from Hugging Face.
2. Place it in the same folder as `llamafile` and `start.command`.
3. Open Terminal.
4. Navigate to the folder. For an external drive named `KPG`, use:

```bash
cd "/Volumes/KPG"
```

5. Make the executable and startup script runnable:

```bash
chmod +x llamafile start.command
```

6. Start the model:

```bash
./start.command
```

If the startup script is not configured correctly, run the command directly:

```bash
./llamafile \
  -m "Qwen3-4B-Thinking-2507.Q4_K_M.gguf" \
  --server \
  --host 127.0.0.1 \
  --port 8080 \
  -c 8192 \
  -n 2048
```

## 5. Run on Windows

1. Download the Windows-compatible llamafile executable.
2. Rename it to `llamafile.exe`.
3. Download the Qwen GGUF model.
4. Place both files in the same folder.
5. Open Command Prompt in that folder.
6. Run:

```bat
llamafile.exe -m "Qwen3-4B-Thinking-2507.Q4_K_M.gguf" --server --host 127.0.0.1 --port 8080 -c 8192 -n 2048
```

You can also save the command in a file named `start-windows.bat` and double-click it to launch the model.

## 6. Run on Linux

1. Download the Linux-compatible llamafile binary.
2. Download the Qwen GGUF model.
3. Place both files in the same folder.
4. Open a terminal in that folder.
5. Make the executable runnable:

```bash
chmod +x llamafile
```

6. Start the model:

```bash
./llamafile \
  -m "Qwen3-4B-Thinking-2507.Q4_K_M.gguf" \
  --server \
  --host 127.0.0.1 \
  --port 8080 \
  -c 8192 \
  -n 2048
```

## 7. Open the AI interface

After the terminal reports that the server is listening, open your browser and visit:

http://127.0.0.1:8080

Keep the terminal open while using the model.

## 8. Context and output settings

The commands use these initial settings:

| Setting | Value | Description |
|---|---:|---|
| Context size | 8192 tokens | Conversation working context |
| Output limit | 2048 tokens | Maximum generated tokens per request |
| Host | `127.0.0.1` | Accessible from the same computer |
| Port | `8080` | Local server port |

If you experience memory problems, reduce the context size to `4096`. Increase it gradually if your computer has enough available RAM.

The context limit and the maximum output length are different settings.

## 9. Troubleshooting

### Model file not found

Verify the filename and ensure the GGUF file is in the same directory as the executable.

### Permission denied

On macOS or Linux, run:

```bash
chmod +x llamafile start.command
```

### Port already in use

Stop the other server or select another available port in the launch command.

### Out of memory

Close unnecessary applications and reduce the context size.

### Windows executable does not run

Ensure you downloaded the Windows-compatible binary from the official llamafile releases page.

## 10. Security and privacy

The default configuration binds to `127.0.0.1`, making the server accessible only from the local computer.

Do not expose the server to a public network without appropriate access controls.

## References

- GitHub repository: https://github.com/kpg-18/local-LLM
- Mozilla llamafile releases: https://github.com/mozilla-ai/llamafile/releases
- Qwen3-4B-Thinking-2507 GGUF model: https://huggingface.co/QuantFactory/Qwen3-4B-Thinking-2507-GGUF

---

**Contributions are welcome!** Feel free to report issues or suggest improvements for running local language models across operating systems.
