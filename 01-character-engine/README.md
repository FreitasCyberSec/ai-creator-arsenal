# Character Engine

Goal: keep one authorized adult creator/persona visually consistent across photos and videos.

## Included now

- `workflows/img-sdxl-face.json`
  - Generates frontal face candidates that can become the identity reference for downstream workflows.

## Best upstreams pulled by bootstrap

### `external/comfyui-workflow-generator/`
Key files:
- `workflows/img-sdxl-face.json`
- `workflows/img-flux.json`
- `workflows/img-sdxl-illustrious.json`
- `workflows/longvideo.json`

Use this as the primary workflow generator/reference because it is MIT licensed.

### `external/comfyui-workflows-library/`
Large reference library for ComfyUI patterns including identity-preservation and image/video workflows. Treat it as a research library; review individual dependencies and licenses before production use.

### `external/ComfyUI-vidflows/`
Use for multi-scene video pipeline ideas and image-to-video production.

### `external/facefusion/`
Run as a dedicated identity/face-processing tool when you are authorized to transform the source identity.

## Character bible

Before generating at scale, define a stable record containing:

```yaml
name: CREATOR_01
adult_age: 25
face_reference_version: v1
hair:
eyes:
height_style:
body_style:
wardrobe_rules:
makeup_rules:
voice_style:
personality:
forbidden_changes:
```

The goal is to change scenes, poses and wardrobe without unintentionally changing the person's identity.

## Recommended workflow order

```text
face-reference generation
   -> choose approved reference
   -> identity-lock image workflow
   -> create 20-50 test images
   -> consistency review
   -> lock prompt/model settings
   -> create content batch
   -> image-to-video only after still-image consistency is stable
```

Never use another person's face or voice without authorization.
