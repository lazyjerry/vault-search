<p align="center">
  <h1 align="center">Vault Search</h1>
  <p align="center">Obsidian 本地语义搜索与发掘：简单、隐私、中文友好</p>
</p>

<p align="center">
  <a href="https://github.com/notoriouslab/vault-search/releases"><img src="https://img.shields.io/github/v/release/notoriouslab/vault-search?style=flat-square" alt="Release"></a>
  <a href="https://github.com/notoriouslab/vault-search/releases"><img src="https://img.shields.io/github/downloads/notoriouslab/vault-search/total?style=flat-square&color=573E7A" alt="Downloads"></a>
  <a href="https://github.com/notoriouslab/vault-search/blob/main/LICENSE"><img src="https://img.shields.io/github/license/notoriouslab/vault-search?style=flat-square" alt="License"></a>
  <img src="https://img.shields.io/badge/Obsidian-Desktop-7C3AED?style=flat-square&logo=obsidian" alt="Obsidian Desktop">
  <img src="https://img.shields.io/badge/Ollama-本地AI-000?style=flat-square" alt="Ollama">
  <a href="https://github.com/TfTHacker/obsidian42-brat"><img src="https://img.shields.io/badge/BRAT-可用-blue?style=flat-square" alt="BRAT"></a>
</p>

<p align="center">
  <a href="./README.md">English</a> | 简体中文 | <a href="./README_TW.md">繁體中文</a> | <a href="./README_JP.md">日本語</a> | <a href="./README_KR.md">한국어</a>
</p>

---

> *Vault Search 帮你**按语义搜索**，并且**重新发现被遗忘的笔记**。*

无需云服务，无需 API Key，无需订阅费用。你的笔记不会离开你的电脑。

![搜索面板](./docs/search-panel.png)

## 为什么选择 Vault Search？

[Andrej Karpathy 分享过](https://venturebeat.com/data/karpathy-shares-llm-knowledge-base-architecture-that-bypasses-rag-with-an/)他对 LLM 维护知识库的愿景：让 AI 把你的笔记“编译”为结构化 wiki。这个方向很吸引人，但前提是你愿意把完整编辑权交给 LLM。

**Vault Search 的立场不同。** AI 应该帮助你“看见”，而不是替你思考。好的工具不是替代写作，而是帮助你**重新发现**自己已经掌握的内容，并浮现你错过的关联。

### 核心优势

**发掘，而非整理**：其他工具偏向自动生成 AI wiki 或摘要。Vault Search 更关注你*应该看的*笔记。Discover 标签页会展示你尚未连接的相关笔记，尤其是藏在库中的 Cold（孤立）笔记。

**Hot/Cold 智能分层**：有链接或近期活跃的笔记为 Hot。孤立笔记为 Cold。Discover 会优先显示与当前思路语义相关的 Cold 笔记，让盲区可见。

**MOC 生成**：一键把搜索或发掘结果导出为 Map of Content 笔记，包含 wikilink 与预览。结构由你决定，AI 只负责收集素材。

**完全本地，真正隐私**：embedding、索引、搜索、发掘全部在本机完成。零数据离开你的设备。这不是可选开关，而是架构本身。

**简单且高效**：侧边栏提供 Search 与 Discover 两个标签。Cmd/Ctrl+P 可快速打开搜索弹窗。右键结果可使用 Obsidian 原生文件菜单。结果可拖拽到 Canvas 做可视化整理。

**针对中文优化**：推荐 `qwen3-embedding:0.6b`，对简体中文、繁体中文和英文语义理解表现都很稳定。配合同义词扩展，即使表达方式不同也能命中。

**LLM 生成描述**：本地 LLM 为笔记生成 frontmatter 描述，让 embedding 模型使用更高质量摘要。对长笔记的搜索与 Discover 相关性提升明显。

**8GB 笔记本可运行**：内存和 CPU 占用低。推荐模型可在 8GB RAM 的 MacBook M2 上运行。增量索引 + debounce 机制在日常使用中几乎无感。

**灵活兼容**：支持 Ollama、LM Studio、llama.cpp、vLLM 以及任意 OpenAI-compatible 服务。你可以按语言和硬件自由选择模型。

> *“AI 帮你看见，你来决定意义。”*

## 功能

### Search
- **语义搜索**：按含义找笔记，而不是只靠关键词
- **侧边栏面板**：Search 与 Discover 结果常驻
- **快速弹窗**：Cmd/Ctrl+P 快速跳转
- **查找相似**：即时发现相关笔记（零 API 调用）
- **智能索引**：增量更新，文件变更自动重建索引
- **Hot/Cold 分层**：Hot = 有链接/近期活跃，Cold = 孤立/遗忘
- **Chunking**：可选长文重叠分块

### Discover（v0.3.0）
- **主动发掘**：打开笔记后，侧边栏自动显示相关笔记并高亮 Cold
- **全局发掘**：找出与你 Hot（活跃）笔记群最相关的 Cold 笔记
- **MOC 生成**：将搜索或发掘结果导出为 Map of Content
- **Cold 搜索范围**：专用“仅 Cold”搜索模式，便于主动探索
- **分层徽章**：一眼区分 Hot 与 Cold 结果
- **Canvas 集成**：结果可直接拖拽到 Canvas
- **右键菜单**：支持 Obsidian 原生文件菜单（书签等）

### Description Generator
- **LLM 描述**：本地 LLM 生成 frontmatter 描述
- **同义词扩展**：自定义同义词以提升召回率
- **双语 UI**：英文与繁体中文（自动识别）

## 依赖要求

- 已安装并运行 [Ollama](https://ollama.com/)
- 一个 embedding 模型（例如 `ollama pull qwen3-embedding:0.6b`）
- 一个用于描述生成的 LLM 模型（例如 `ollama pull qwen3:1.7b`）（可选）
- Obsidian 桌面版

## 安装

### 一键安装

```bash
# 交互模式：脚本会提示输入 vault 路径
bash -c "$(curl -fsSL https://raw.githubusercontent.com/notoriouslab/vault-search/main/install.sh)"

# 或直接传入 vault 路径
bash -c "$(curl -fsSL https://raw.githubusercontent.com/notoriouslab/vault-search/main/install.sh)" -- "/path/to/your/vault"
```

### BRAT（社区审核期间推荐）

1. 安装 [BRAT](https://github.com/TfTHacker/obsidian42-brat) 插件
2. 添加仓库：`notoriouslab/vault-search`
3. 在 Community plugins 中启用 “Vault Search”

### 手动安装

1. 从 [最新发布](https://github.com/notoriouslab/vault-search/releases) 下载 `main.js`、`manifest.json`、`styles.css`
2. 复制到你的 `.obsidian/plugins/vault-search/`
3. 在 Settings → Community plugins 中启用

> **注意：** 如果你的库由 Git 跟踪，建议在 `.gitignore` 添加 `.obsidian/plugins/*/data.json`，避免意外提交 API key 或个人设置。

## 快速开始

1. 在 **Settings → Vault Search** 选择 embedding 模型
2. 点击 **Rebuild** 建立索引
3. 用 **Cmd/Ctrl+P → "Semantic search"** 或点击罗盘图标打开搜索
4. 切换到 **Discover** 标签查看当前文件的相关笔记

### 推荐工作流

```text
1. 生成描述  →  2. 重建索引  →  3. 搜索与发掘
   （LLM 总结笔记）    （使用 description 向量化）  （查找并重新发现）
```

**为什么按这个顺序？** 索引器会优先使用 frontmatter 的 `description` 进行 embedding。先生成描述，再重建索引，可明显提升搜索和 Discover 质量。

- **最小配置**：跳过步骤 1，直接重建索引并搜索。
- **最佳质量**：先 **Generate descriptions (preview)** → 人工检查 → **Apply** → **Rebuild index**。

### Discover 工作流

Discover 标签页有两个模式：

- **Current note**：显示与你正在阅读笔记相关的内容，并高亮 Cold 笔记（潜在盲区）。
- **Global**：显示与你整个 Hot 笔记池最相关的 Cold 笔记，适合批量导入后挖掘遗漏内容。

点击 **Generate MOC** 可把结果导出为带链接的笔记。

## 设置

<details>
<summary><strong>Search & Index</strong></summary>

| 设置 | 默认值 | 说明 |
|---|---|---|
| Server URL | `http://localhost:11434` | Ollama 或 OpenAI-compatible 服务 |
| API format | Ollama | Ollama 或 OpenAI-compatible |
| API Key | — | 可选，用于需要认证的服务 |
| Embedding model | `qwen3-embedding:0.6b` | 向量 embedding 模型 |
| Top results | 10 | 搜索与 Discover 最大结果数 |
| Min score | 0.5 | 相似度阈值（0-1），越低结果越多 |
| Max embed chars | 2000 | 内容截断长度。有 description 时优先用 description |
| Hot days | 90 | N 天内创建的笔记归类为 Hot |
| Search scope | Hot only | Hot / All / Cold |
| Chunking mode | Off | Off / Smart / All |
| Chunk size | 1000 | 每个分块字符数 |
| Chunk overlap | 200 | 分块重叠字符数 |
| Exclude patterns | `_templates/` `.trash/` `3_wiki/` | 跳过的目录 |
| Synonyms | — | 每行格式：`keyword = syn1, syn2` |
| Auto-index | On | 文件变化后自动重建 embedding，保持 Discover 新鲜度 |

</details>

<details>
<summary><strong>Description Generator</strong></summary>

| 设置 | 默认值 | 说明 |
|---|---|---|
| LLM model | `qwen3:1.7b` | 推荐：速度快、质量稳定 |
| Min description length | 30 | 低于该长度会重写。高质量描述可提升搜索与 Discover |

</details>

## 命令

命令面板（Cmd/Ctrl+P）中所有命令均以 **Vault Search:** 开头。

| 命令 | 说明 |
|---|---|
| Semantic search (modal) | 快速搜索，支持键盘导航 |
| Open search panel | 打开侧边栏 Search 与 Discover |
| Find similar notes | 为当前文件查找相关笔记 |
| Discover related Cold notes | 全局发掘，找隐藏内容 |
| Rebuild index | 全量重建索引 |
| Update index | 增量更新索引 |
| Generate descriptions (preview) | LLM 生成描述并输出预览报告 |
| Apply descriptions | 将预览描述写入 frontmatter |

## 工作原理

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

1. **索引**：笔记内容（或 description）→ embedding 模型 → 向量写入 `index.json`
2. **搜索**：查询（+ 同义词扩展）→ 同一模型 → 余弦相似度 → 结果排序
3. **发掘**：不调用 API。直接比对现有向量以找出相关 Cold 笔记
4. **Hot/Cold**：有链接或近期活跃 = Hot，孤立 = Cold。Discover 会突出你的盲区
5. **MOC**：将结果导出为 Map of Content，附 wikilink 与预览
6. **描述**：本地 LLM 汇总笔记，写入 frontmatter，提升 embedding 质量

## 推荐模型

| 模型 | 大小 | 用途 | 说明 |
|---|---|---|---|
| `qwen3-embedding:0.6b` | 639MB | Embedding | 中英文表现均衡 |
| `nomic-embed-text` | 274MB | Embedding | 更轻量，偏英文 |
| `qwen3:1.7b` | 1.4GB | LLM | 质量稳定，可处理 2000+ 字符 |
| `gemma3:1b` | 815MB | LLM | 更轻，但输入超过 500 字符时可能不稳定 |

> 对于 8GB RAM 机器，建议 `qwen3-embedding:0.6b` + `qwen3:1.7b`。

## 开发

```bash
git clone https://github.com/notoriouslab/vault-search.git
cd vault-search
npm install
npm run dev    # watch mode
npm run build  # production build
```

## 许可证

[MIT](./LICENSE)
