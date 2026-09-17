# Image & Video Arsenal

## Primary production path

```text
approved identity reference
  -> still-image consistency workflow
  -> batch generation
  -> quality review
  -> approved hero frames
  -> image-to-video workflow
  -> temporal consistency review
  -> optional voice/lip-sync
  -> export approved asset
```

## Upstreams pulled by bootstrap

### ComfyUI Workflow Generator
`external/comfyui-workflow-generator/`

Use for repeatable character workflows and parameterized generation. The upstream includes examples for face generation, FLUX/SDXL image generation and long-form/video workflows.

### ComfyUI Vidflows
`external/ComfyUI-vidflows/`

Use as a production reference for image-to-video and multi-scene character video pipelines.

### ComfyUI workflow library
`external/comfyui-workflows-library/`

Large research library. Good for discovering graph patterns; do not assume every workflow has the same dependency/license quality.

### FaceFusion
`external/facefusion/`

Dedicated face-processing application. Keep it isolated from the core orchestrator and use only with identities/assets you are authorized to transform.

## Production notes

- Save workflow JSON with every generated batch.
- Record model/checkpoint versions, seed and prompt version.
- Do not overwrite the canonical identity reference; version it (`v1`, `v2`, ...).
- Maintain separate presets for portrait, full-body, lifestyle and video keyframes.
- Approve still consistency before investing compute in video.
- Store generated media outside Git; only metadata/workflows belong in this repository.
