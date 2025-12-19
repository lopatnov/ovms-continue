# OpenVINO Model Server for Continue VSCode Extension

Local AI models for code completion and chat in VS Code via [Continue Extension][continue]. This project can run various models, but the Qwen2.5-Coder model has shown good results experimentally. Server is precompiled for Windows.

## The hardware and software on which the system was run

- Laptop: Acer Swift Go 14 (iGPU Intel Arc, 18Gb GPU, 32Gb RAM)
- Software: Windows 11, [Intel® oneAPI Base Toolkit 2025.3.0][one-api], [Intel® Deep Learning Essentials 2025.3.0][deep-learning] (not sure that it's required)
- Folder: `C:\ai-projects\ovms-continue` (should work from any folder)

## Current models

| Model  | Size   | Speed    | Goal       |
|--------|--------|----------|------------|
| Qwen2.5-Coder-14B | ~8GB | ⚡ | Best quality |
| Qwen2.5-Coder-7B | ~4GB | ⚡⚡ | Balance |
| Qwen2.5-Coder-3B | ~2GB | ⚡⚡⚡ | Quick |
| Qwen2.5-Coder-1.5B | ~1GB | ⚡⚡⚡⚡ | Autocomplete |
| Qwen2.5-Coder-0.5B | ~300MB | ⚡⚡⚡⚡⚡ | Minimal resources |

## Quick start

### 1. Configure models

Edit `config_all.json` in `models` folder to configure models that should be loaded.

For example:

```json
{
    "model_config_list": [
        {
            "config": {
                "name": "Qwen2.5-Coder-0.5B-Instruct-int4-ov",
                "base_path": "Qwen2.5-Coder-0.5B-Instruct-int4-ov"
            }
        },
        {
            "config": {
                "name": "Qwen2.5-Coder-1.5B-Instruct-int4-ov",
                "base_path": "Qwen2.5-Coder-1.5B-Instruct-int4-ov"
            }
        },
        {
            "config": {
                "name": "Qwen2.5-Coder-3B-Instruct-int4-ov",
                "base_path": "Qwen2.5-Coder-3B-Instruct-int4-ov"
            }
        },
        {
            "config": {
                "name": "Qwen2.5-Coder-7B-Instruct-int4-ov",
                "base_path": "Qwen2.5-Coder-7B-Instruct-int4-ov"
            }
        }
        {
            "config": {
                "name": "Qwen2.5-Coder-14B-Instruct-int4-ov",
                "base_path": "Qwen2.5-Coder-14B-Instruct-int4-ov"
            }
        }
    ]
}
```

I not recommend to use many models. More models requires more memory.

### 2. Start OVMS

```cmd
cd C:\ai-projects\ovms-continue
start-ovms.bat
```

### 3. Check

Open in browser: http://localhost:8000/v3/models

### 4. Configure VS Code

[Continue][continue] will automatically connect to OVMS (port 8000).

Edit configuration file `C:\Users\<Username>\.continue\config.yaml` like so:

```yaml
models:
  - name: Qwen2.5-Coder-7B (GPU)
    provider: openai
    model: Qwen2.5-Coder-7B-Instruct-int4-ov
    apiKey: unused
    apiBase: http://localhost:8000/v3
    roles:
      - chat
      - edit
      - apply

  - name: Qwen2.5-Coder-1.5B (GPU)
    provider: openai
    model: Qwen2.5-Coder-1.5B-Instruct-int4-ov
    apiKey: unused
    apiBase: http://localhost:8000/v3
    roles:
      - autocomplete
```

Set your local models in Continue extension:

![Continue Models](./continue-config.jpg)

## Check that it's working

![Continue works](./continue-work.jpg)

## Links

- [OpenVINO Model Server](https://docs.openvino.ai/2025/model-server/ovms_what_is_openvino_model_server.html)
- [Continue Documentation](https://docs.continue.dev/)
- [OpenVINO models](https://huggingface.co/OpenVINO)

## Authors

This project was created for fun by [Oleksandr Lopatnov](https://www.linkedin.com/in/lopatnov/). 

[continue]: https://marketplace.visualstudio.com/items?itemName=Continue.continue
[one-api]: https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html
[deep-learning]: https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html?packages=dl-essentials&dl-essentials-os=linux&dl-lin=offline