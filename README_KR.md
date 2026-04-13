<p align="center">
  <h1 align="center">Vault Search</h1>
  <p align="center">Obsidian을 위한 로컬 우선 시맨틱 검색 및 재발견. 단순하고, 프라이빗하며, 중국어 검색에도 강합니다.</p>
</p>

<p align="center">
  <a href="https://github.com/notoriouslab/vault-search/releases"><img src="https://img.shields.io/github/v/release/notoriouslab/vault-search?style=flat-square" alt="Release"></a>
  <a href="https://github.com/notoriouslab/vault-search/releases"><img src="https://img.shields.io/github/downloads/notoriouslab/vault-search/total?style=flat-square&color=573E7A" alt="Downloads"></a>
  <a href="https://github.com/notoriouslab/vault-search/blob/main/LICENSE"><img src="https://img.shields.io/github/license/notoriouslab/vault-search?style=flat-square" alt="License"></a>
  <img src="https://img.shields.io/badge/Obsidian-Desktop-7C3AED?style=flat-square&logo=obsidian" alt="Obsidian Desktop">
  <img src="https://img.shields.io/badge/Ollama-Local_AI-000?style=flat-square" alt="Ollama">
  <a href="https://github.com/TfTHacker/obsidian42-brat"><img src="https://img.shields.io/badge/BRAT-Available-blue?style=flat-square" alt="BRAT"></a>
</p>

<p align="center">
  <a href="./README.md">English</a> | <a href="./README_CN.md">简体中文</a> | <a href="./README_TW.md">繁體中文</a> | <a href="./README_JP.md">日本語</a> | 한국어
</p>

---

> *Vault Search는 **의미 기반 검색**으로 **잊힌 노트를 다시 발견**할 수 있게 도와줍니다.*

클라우드 서비스가 필요하지 않습니다. API 키도 필요하지 않습니다. 구독 비용도 없습니다. 노트는 사용자 기기를 벗어나지 않습니다.

![Search Panel](./docs/search-panel.png)

## 왜 Vault Search인가요?

[Andrej Karpathy는](https://venturebeat.com/data/karpathy-shares-llm-knowledge-base-architecture-that-bypasses-rag-with-an/) LLM이 지식 베이스를 유지하고 노트를 구조화된 위키로 "컴파일"하는 비전을 제시했습니다. 매우 매력적인 접근이지만, 편집 주도권을 LLM에 크게 맡긴다는 전제가 있습니다.

**Vault Search의 관점은 다릅니다.** AI는 생각을 대신하는 것이 아니라, 더 잘 보이게 도와야 합니다. 글쓰기를 대체하는 도구가 아니라, 이미 알고 있는 내용을 **재발견**하고 놓친 연결을 드러내는 도구입니다.

### Vault Search의 차별점

**정리보다 발견**: 다른 도구가 AI 위키나 자동 요약을 만드는 동안, Vault Search는 지금 봐야 할 노트를 찾습니다. Discover 탭은 아직 연결되지 않은 관련 노트, 특히 Cold(고립) 노트를 보여줍니다.

**Hot/Cold 지능형 분류**: 링크가 있거나 최근 활동한 노트는 Hot입니다. 고립된 노트는 Cold입니다. Discover는 현재 사고 흐름과 의미적으로 가까운 Cold 노트를 노출해 사각지대를 보이게 합니다.

**MOC 생성**: 검색 또는 Discover 결과를 한 번에 Map of Content 노트로 내보낼 수 있습니다. wikilink와 미리보기를 포함합니다. 구조는 사용자가 결정하고, AI는 재료를 모읍니다.

**완전 로컬, 완전 프라이버시**: 임베딩, 인덱싱, 검색, Discover가 모두 로컬에서 실행됩니다. 데이터는 외부로 전송되지 않습니다. 이는 옵션이 아니라 아키텍처입니다.

**단순하고 빠름**: 사이드바는 Search/Discover 두 탭으로 구성됩니다. Cmd/Ctrl+P로 즉시 모달 검색을 열 수 있습니다. 결과 우클릭으로 Obsidian 기본 파일 메뉴를 사용할 수 있습니다. 결과를 Canvas로 드래그해 시각 정리가 가능합니다.

**중국어에 최적화**: `qwen3-embedding:0.6b`는 번체 중국어와 영어 의미 이해에 강합니다. 동의어 확장과 결합하면 표현이 달라도 관련 노트를 잘 찾습니다.

**LLM 설명 생성**: 로컬 LLM이 frontmatter 설명을 생성합니다. 임베딩 모델이 고품질 요약을 참고할 수 있어 긴 노트에서 검색과 Discover 정확도가 향상됩니다.

**8GB 노트북에서도 실행 가능**: 메모리와 CPU 사용량을 최소화했습니다. 권장 모델은 8GB RAM의 MacBook M2에서 동작합니다. 증분 인덱싱 + 디바운스로 일상 사용 오버헤드를 줄였습니다.

**유연한 호환성**: Ollama, LM Studio, llama.cpp, vLLM 및 OpenAI 호환 서버를 지원합니다. 언어와 하드웨어에 맞춰 모델을 선택할 수 있습니다.

> *"AI는 더 잘 보이게 돕고, 의미 해석은 사용자가 결정합니다."*

## 기능

### Search
- **시맨틱 검색**: 키워드 일치가 아닌 의미 기반으로 노트를 검색합니다
- **사이드바 패널**: Search와 Discover 결과를 상시 표시합니다
- **빠른 모달**: Cmd/Ctrl+P로 빠르게 노트를 이동합니다
- **유사 노트 찾기**: 관련 노트를 즉시 확인합니다(API 호출 없음)
- **스마트 인덱싱**: 증분 업데이트 및 파일 변경 시 자동 재인덱싱
- **Hot/Cold 티어**: Hot = 링크/최근 활동, Cold = 고립 노트
- **Chunking**: 긴 문서용 겹침 분할을 선택할 수 있습니다

### Discover (v0.3.0)
- **능동형 Discover**: 노트를 열면 관련 노트를 자동 표시하고 Cold 노트를 강조합니다
- **전역 Discover**: Hot(활성) 노트 풀과 가장 관련된 Cold 노트를 찾습니다
- **MOC 생성**: 검색/Discover 결과를 Map of Content로 내보냅니다
- **Cold 검색 범위**: 의도적 탐색을 위한 "Cold only" 모드
- **티어 배지**: Hot/Cold 결과를 시각적으로 구분합니다
- **Canvas 통합**: 결과를 Canvas에 직접 드래그할 수 있습니다
- **컨텍스트 메뉴**: 우클릭으로 Obsidian 기본 파일 메뉴를 사용합니다

### Description Generator
- **LLM 설명**: 로컬 LLM으로 frontmatter 설명을 생성합니다
- **동의어 확장**: 동의어를 정의해 재현율을 높입니다
- **이중 언어 UI**: 영어와 번체 중국어 지원(자동 감지)

## 요구 사항

- [Ollama](https://ollama.com/) 설치 및 실행
- 임베딩 모델(예: `ollama pull qwen3-embedding:0.6b`)
- 설명 생성용 LLM 모델(예: `ollama pull qwen3:1.7b`) (선택)
- Obsidian 데스크톱 버전

## 설치

### 원클릭 설치

```bash
# 대화형 모드: 스크립트가 vault 경로를 물어봅니다
bash -c "$(curl -fsSL https://raw.githubusercontent.com/lazyjerry/vault-search/main/install.sh)"

# vault 경로를 직접 전달하는 경우
bash -c "$(curl -fsSL https://raw.githubusercontent.com/lazyjerry/vault-search/main/install.sh)" -- "/path/to/your/vault"
```

### BRAT (커뮤니티 검토 대기 중 권장)

1. [BRAT](https://github.com/TfTHacker/obsidian42-brat) 플러그인을 설치합니다
2. 저장소를 추가합니다: `notoriouslab/vault-search`
3. Community plugins에서 "Vault Search"를 활성화합니다

### 수동 설치

1. [latest release](https://github.com/notoriouslab/vault-search/releases)에서 `main.js`, `manifest.json`, `styles.css`를 다운로드합니다
2. vault의 `.obsidian/plugins/vault-search/`에 복사합니다
3. Settings → Community plugins에서 활성화합니다

> **참고:** vault를 Git으로 관리한다면 `.obsidian/plugins/*/data.json`을 `.gitignore`에 추가해 API 키나 개인 설정이 커밋되지 않도록 하세요.

## 빠른 시작

1. **Settings → Vault Search**에서 임베딩 모델을 선택합니다
2. **Rebuild**를 눌러 인덱스를 생성합니다
3. **Cmd/Ctrl+P → "Semantic search"** 또는 나침반 아이콘으로 검색을 엽니다
4. **Discover** 탭으로 전환해 현재 노트의 관련 노트를 확인합니다

### 권장 워크플로

```text
1. 설명 생성  →  2. 인덱스 재구축  →  3. Search & Discover
   (LLM 요약)       (설명 기반 임베딩)      (재발견)
```

**이 순서를 권장하는 이유**: 인덱서는 frontmatter `description`을 우선 사용해 임베딩합니다. 설명을 먼저 생성하면 검색 및 Discover 품질이 향상됩니다.

- **최소 설정**: 1단계를 생략하고 Rebuild 후 검색합니다.
- **최고 품질**: **Generate descriptions (preview)** → 검토 → **Apply** → **Rebuild index**.

### Discover 워크플로

Discover 탭은 두 가지 모드를 제공합니다.

- **Current note**: 현재 읽는 노트와 관련된 노트를 보여주며 Cold 노트를 강조합니다.
- **Global**: 전체 Hot 풀과 관련성이 높은 Cold 노트를 보여줍니다. 대량 가져오기 후 정리에 유용합니다.

**Generate MOC**를 클릭하면 결과를 링크 노트로 내보낼 수 있습니다.

## Settings

<details>
<summary><strong>Search & Index</strong></summary>

| Setting | Default | Description |
|---|---|---|
| Server URL | `http://localhost:11434` | Ollama 또는 OpenAI-compatible server |
| API format | Ollama | Ollama 또는 OpenAI-compatible |
| API Key | — | 인증 서버용 선택 항목 |
| Embedding model | `qwen3-embedding:0.6b` | 벡터 임베딩 모델 |
| Top results | 10 | Search/Discover 최대 결과 수 |
| Min score | 0.5 | 유사도 임계값(0-1) |
| Max embed chars | 2000 | 임베딩 대상 글자 수 제한 |
| Hot days | 90 | N일 내 생성 노트를 Hot으로 분류 |
| Search scope | Hot only | Hot / All / Cold |
| Chunking mode | Off | Off / Smart / All |
| Chunk size | 1000 | chunk당 글자 수 |
| Chunk overlap | 200 | chunk 겹침 글자 수 |
| Exclude patterns | `_templates/` `.trash/` `3_wiki/` | 제외 폴더 |
| Synonyms | — | 줄 단위 `keyword = syn1, syn2` |
| Auto-index | On | 파일 변경 시 자동 재임베딩 |

</details>

<details>
<summary><strong>Description Generator</strong></summary>

| Setting | Default | Description |
|---|---|---|
| LLM model | `qwen3:1.7b` | 권장: 빠르고 품질 안정적 |
| Min description length | 30 | 더 짧으면 다시 생성합니다 |

</details>

## Commands

Command Palette(Cmd/Ctrl+P)에서 모든 명령은 **Vault Search:** 접두사를 사용합니다.

| Command | Description |
|---|---|
| Semantic search (modal) | 키보드 탐색이 가능한 빠른 검색 |
| Open search panel | Search/Discover 사이드바 열기 |
| Find similar notes | 현재 파일의 관련 노트 찾기 |
| Discover related Cold notes | 전역 Discover |
| Rebuild index | 전체 재인덱싱 |
| Update index | 증분 업데이트 |
| Generate descriptions (preview) | LLM 설명 생성 및 리포트 출력 |
| Apply descriptions | 미리보기 설명을 frontmatter에 반영 |

## 동작 방식

```text
┌─────────────┐     ┌──────────┐     ┌──────────────┐
│  Your Notes │────▶│  Ollama  │────▶│ Vector Index │
│  (.md)      │     │ Embed API│     │ (index.json) │
└─────────────┘     └──────────┘     └──────┬───────┘
                                            │
┌─────────────┐     ┌──────────┐            │
│  Your Query │────▶│  Ollama  │──── cosine similarity
│             │     │ Embed API│            │
└─────────────┘     └──────────┘     ┌──────▼───────┐
                                     │   Results    │
                                     │  (ranked)    │
                                     └──────┬───────┘
                                            │
                               ┌────────────▼────────────┐
                               │   Discover (no Ollama)  │
                               │   Pure vector math on   │
                               │   existing embeddings   │
                               └─────────────────────────┘
```

1. **Index**: 노트 본문(또는 description)을 임베딩해 `index.json`에 저장합니다
2. **Search**: 질의(+ 동의어 확장)를 같은 모델로 임베딩하고 코사인 유사도로 순위를 매깁니다
3. **Discover**: API 호출 없이 기존 임베딩을 비교해 관련 Cold 노트를 찾습니다
4. **Hot/Cold**: 링크/최근 활동 = Hot, 고립 = Cold. Discover는 Cold를 강조합니다
5. **MOC**: 결과를 wikilink와 미리보기 포함 노트로 내보냅니다
6. **Descriptions**: 로컬 LLM이 요약을 생성해 frontmatter에 저장하고 검색 품질을 높입니다

## 권장 모델

| Model | Size | Use | Notes |
|---|---|---|---|
| `qwen3-embedding:0.6b` | 639MB | Embedding | 중국어 + 영어 균형 우수 |
| `nomic-embed-text` | 274MB | Embedding | 경량, 영어 중심 |
| `qwen3:1.7b` | 1.4GB | LLM | 품질 우수, 2000+ 문자 처리 |
| `gemma3:1b` | 815MB | LLM | 더 가볍지만 500+ 입력에서 불안정할 수 있음 |

> 8GB RAM 환경에서는 `qwen3-embedding:0.6b` + `qwen3:1.7b` 조합을 권장합니다.

## Development

```bash
git clone https://github.com/notoriouslab/vault-search.git
cd vault-search
npm install
npm run dev    # watch mode
npm run build  # production build
```

## License

[MIT](./LICENSE)
