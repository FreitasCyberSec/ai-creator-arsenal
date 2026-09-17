# Complementos e referências

Esta pasta reúne ferramentas úteis que eu não colocaria como dependência obrigatória do núcleo. Algumas são bibliotecas grandes, outras são alternativas antigas ou projetos de referência arquitetural.

## `ComfyUI-MultiGPU`
Distribuição/offload de modelos entre GPUs e memória. Pode ser útil em workflows muito pesados ou setups específicos, mas não é obrigatório para todo mundo. Teste compatibilidade antes de depender dele em produção.

## `ComfyUI-Essentials-Legado`
Coleção de nodes úteis do ComfyUI. O upstream entrou em modo de manutenção em 2025. Mantenha como fallback para workflows antigos que dependam desses nodes.

## `ComfyUI-InstantID-Legado`
Implementação nativa de InstantID para ComfyUI. Também está em modo de manutenção. Útil para testar identidade baseada em referência quando um workflow específico exigir InstantID.

## `ComfyUI-Vidflows`
Biblioteca de workflows de vídeo de ponta a ponta, incluindo sequências com personagem, narrativa e pipelines que usam modelos/APIs de vídeo. Use para estudar e reaproveitar arquitetura; confira custos quando o workflow depender de API paga.

## `ComfyUI-LivePortrait`
Animação de retrato/expressão. Útil em testes de talking head e movimento facial, mas é um projeto mais antigo e deve ser tratado como complemento.

## `Biblioteca-ComfyUI-Workflows`
Biblioteca muito grande de workflows ComfyUI. Serve como banco de pesquisa para Flux, ControlNet, img2img, vídeo, identidade e outros padrões. Não significa que todo workflow ali será compatível com a sua instalação atual.

## `Fanvue-AI-Bot-RAG`
Referência técnica forte para:

- webhooks Fanvue;
- OAuth;
- respostas com LLM;
- PostgreSQL + pgvector;
- RAG;
- memória/fatos por usuário;
- bot Telegram de administração.

É especialmente útil para comparar com o nosso banco em `../08-memory-crm/` e com a integração oficial da Fanvue.

## Regra prática

Use primeiro o que está em `../ferramentas/`. Só procure esta pasta quando precisar de uma capacidade específica, estudar outra implementação ou resolver compatibilidade de um workflow.
