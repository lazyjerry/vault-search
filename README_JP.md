<p align="center">
  <h1 align="center">Vault Search</h1>
  <p align="center">Obsidian 向けローカル優先のセマンティック検索と再発見。シンプルで、プライベートで、中国語にも強いです。</p>
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
  <a href="./README.md">English</a> | <a href="./README_CN.md">简体中文</a> | <a href="./README_TW.md">繁體中文</a> | 日本語 | <a href="./README_KR.md">한국어</a>
</p>

---

> *Vault Search は、**意味で検索**して、**埋もれたノートを再発見**できるようにします。*

クラウドサービスは不要です。API キーも不要です。サブスクリプション料金も不要です。ノートはあなたのマシン外へ送信されません。

![Search Panel](./docs/search-panel.png)

## なぜ Vault Search ですか？

[Andrej Karpathy 氏は](https://venturebeat.com/data/karpathy-shares-llm-knowledge-base-architecture-that-bypasses-rag-with-an/)「LLM が知識ベースを保守し、ノートを構造化 wiki に“コンパイル”する」というビジョンを共有しました。非常に魅力的ですが、編集の主導権を LLM に大きく委ねる前提があります。

**Vault Search は別の立場です。** AI は「考える代行」ではなく、「見える化」を助けるべきです。書くことを置き換えるのではなく、すでに知っている情報を**再発見**し、見落としていたつながりを表面化します。

### Vault Search の特長

**整理よりも発見**：AI wiki や自動要約を作るツールとは異なり、Vault Search は「今見るべきノート」を提示します。Discover タブでは、まだ結び付いていない関連ノート、特に Cold（孤立）ノートを見つけられます。

**Hot/Cold インテリジェンス**：リンクがある、または最近更新されたノートは Hot です。孤立ノートは Cold です。Discover は現在の思考と意味的に近い Cold ノートを浮き上がらせ、盲点を可視化します。

**MOC 生成**：検索結果や Discover 結果を 1 クリックで Map of Content ノートとして出力できます。wikilink とプレビュー付きです。構造はあなたが決め、AI は素材整理を支援します。

**完全ローカル、完全プライベート**：埋め込み生成、インデックス作成、検索、Discover のすべてがローカルで実行されます。データは外部へ送信されません。これは設定ではなく、設計思想です。

**シンプルで高速**：サイドバーは Search / Discover の 2 タブ構成です。Cmd/Ctrl+P で即時モーダル検索ができます。結果の右クリックで Obsidian の標準ファイルメニューを利用できます。Canvas へドラッグして視覚整理もできます。

**中国語に最適化**：`qwen3-embedding:0.6b` は繁体字中国語と英語の意味理解に優れています。同義語展開と組み合わせることで、言い回しが違っても一致しやすくなります。

**LLM による説明文生成**：ローカル LLM が frontmatter の説明文を生成します。埋め込みモデルが高品質な要約を参照できるため、長文ノートでも検索と Discover の関連性が向上します。

**8GB ノート PC でも動作**：メモリと CPU 負荷を最小化しています。推奨モデルは MacBook M2（8GB RAM）で動作します。増分インデックス + デバウンスにより、日常利用のオーバーヘッドを抑えます。

**柔軟で互換性が高い**：Ollama、LM Studio、llama.cpp、vLLM、その他 OpenAI 互換サーバーで利用できます。言語とハードウェアに合わせてモデルを選択できます。

> *「AI は見える化を助ける。意味づけはあなたが行う。」*

## 機能

### Search
- **セマンティック検索**：キーワード一致だけでなく意味で検索できます
- **サイドバーパネル**：Search と Discover の結果を常時表示します
- **クイックモーダル**：Cmd/Ctrl+P で高速にノート移動できます
- **Find Similar**：関連ノートを即時表示します（API 呼び出し不要）
- **スマートインデックス**：増分更新。ファイル変更時に自動再インデックスします
- **Hot/Cold 階層**：Hot = リンクあり/最近活動、Cold = 孤立
- **Chunking**：長文向けに重なり付き分割を選択できます

### Discover（v0.3.0）
- **アクティブ Discover**：ノートを開くと、関連ノートを自動表示し Cold を強調します
- **グローバル Discover**：Hot ノート群に最も関連する Cold ノートを抽出します
- **MOC 生成**：検索結果・Discover 結果を Map of Content として出力します
- **Cold 検索スコープ**：「Cold のみ」モードで意図的に探索できます
- **Tier バッジ**：Hot/Cold を視覚的に判別できます
- **Canvas 連携**：結果を Canvas に直接ドラッグできます
- **コンテキストメニュー**：右クリックで Obsidian 標準メニューを利用できます

### Description Generator
- **LLM 説明文生成**：ローカル LLM で frontmatter 説明文を生成します
- **同義語展開**：同義語を定義して再現率を向上します
- **バイリンガル UI**：英語と繁体字中国語に対応（自動判定）

## 必要条件

- [Ollama](https://ollama.com/) のインストールと起動
- 埋め込みモデル（例：`ollama pull qwen3-embedding:0.6b`）
- 説明文生成用 LLM（例：`ollama pull qwen3:1.7b`）（任意）
- Obsidian デスクトップ版

## インストール

### ワンクリックインストール

```bash
# 対話モード: スクリプトが vault パスを確認します
bash -c "$(curl -fsSL https://raw.githubusercontent.com/notoriouslab/vault-search/main/install.sh)"

# vault パスを直接指定する場合
bash -c "$(curl -fsSL https://raw.githubusercontent.com/notoriouslab/vault-search/main/install.sh)" -- "/path/to/your/vault"
```

### BRAT（コミュニティ審査待ち期間の推奨）

1. [BRAT](https://github.com/TfTHacker/obsidian42-brat) プラグインをインストールします
2. このリポジトリを追加します：`notoriouslab/vault-search`
3. Community plugins で「Vault Search」を有効化します

### 手動インストール

1. [latest release](https://github.com/notoriouslab/vault-search/releases) から `main.js`、`manifest.json`、`styles.css` をダウンロードします
2. vault 内の `.obsidian/plugins/vault-search/` にコピーします
3. Settings → Community plugins で有効化します

> **注意：** vault を Git 管理している場合は、`.obsidian/plugins/*/data.json` を `.gitignore` に追加し、API キーや個人設定の誤コミットを防いでください。

## クイックスタート

1. **Settings → Vault Search** で埋め込みモデルを選択します
2. **Rebuild** を実行してインデックスを作成します
3. **Cmd/Ctrl+P → "Semantic search"** またはコンパスアイコンで検索を開きます
4. **Discover** タブに切り替え、現在のノートに関連するノートを確認します

### 推奨ワークフロー

```text
1. 説明文を生成  →  2. インデックス再構築  →  3. Search & Discover
   （LLM が要約）      （説明文で埋め込み）         （再発見）
```

**この順序を推奨する理由**：インデクサーは frontmatter `description` を優先して埋め込みに使用します。説明文を先に作ることで検索品質と Discover 精度が向上します。

- **最小構成**：手順 1 を省略し、Rebuild 後に検索します
- **最高品質**：**Generate descriptions (preview)** → 確認 → **Apply** → **Rebuild index**

### Discover ワークフロー

Discover タブには 2 つのモードがあります。

- **Current note**：現在読んでいるノートに関連するノートを表示します。Cold ノートは盲点として強調表示されます。
- **Global**：Hot ノート全体に関連する Cold ノートを表示します。大量インポート後の見直しに有効です。

**Generate MOC** を押すと、結果をリンク付きノートとして出力できます。

## Settings

<details>
<summary><strong>Search & Index</strong></summary>

| Setting | Default | Description |
|---|---|---|
| Server URL | `http://localhost:11434` | Ollama または OpenAI-compatible server |
| API format | Ollama | Ollama または OpenAI-compatible |
| API Key | — | 認証が必要な server 用（任意） |
| Embedding model | `qwen3-embedding:0.6b` | ベクトル埋め込みモデル |
| Top results | 10 | Search と Discover の最大表示件数 |
| Min score | 0.5 | 類似度しきい値（0-1） |
| Max embed chars | 2000 | 埋め込み対象文字数。説明文があれば優先使用 |
| Hot days | 90 | N 日以内に作成されたノートを Hot と判定 |
| Search scope | Hot only | Hot / All / Cold |
| Chunking mode | Off | Off / Smart / All |
| Chunk size | 1000 | chunk ごとの文字数 |
| Chunk overlap | 200 | chunk 間の重複文字数 |
| Exclude patterns | `_templates/` `.trash/` `3_wiki/` | 除外フォルダ |
| Synonyms | — | `keyword = syn1, syn2` を 1 行ずつ |
| Auto-index | On | ファイル変更時に自動再埋め込み |

</details>

<details>
<summary><strong>Description Generator</strong></summary>

| Setting | Default | Description |
|---|---|---|
| LLM model | `qwen3:1.7b` | 推奨：高速・高品質 |
| Min description length | 30 | これより短い説明文は再生成します |

</details>

## Commands

Command Palette（Cmd/Ctrl+P）では、すべてのコマンドが **Vault Search:** で始まります。

| Command | Description |
|---|---|
| Semantic search (modal) | キーボード操作対応の高速検索 |
| Open search panel | Search / Discover サイドバーを開く |
| Find similar notes | 現在ノートの関連ノートを表示 |
| Discover related Cold notes | グローバル Discover |
| Rebuild index | フル再インデックス |
| Update index | 増分更新 |
| Generate descriptions (preview) | LLM が説明文を生成してレポート化 |
| Apply descriptions | プレビューした説明文を frontmatter に反映 |

## 仕組み

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

1. **Index**：ノート本文（または description）を埋め込み化し、`index.json` に保存します
2. **Search**：クエリ（+ 同義語展開）を同一モデルで埋め込み化し、コサイン類似度で順位付けします
3. **Discover**：API 呼び出しなし。既存埋め込み同士を比較して関連 Cold ノートを抽出します
4. **Hot/Cold**：リンクあり/最近更新 = Hot、孤立 = Cold。Discover は Cold を強調します
5. **MOC**：結果を wikilink とプレビュー付きで出力します
6. **Descriptions**：ローカル LLM が要約し、frontmatter に保存して検索品質を向上します

## 推奨モデル

| Model | Size | Use | Notes |
|---|---|---|---|
| `qwen3-embedding:0.6b` | 639MB | Embedding | 中国語 + 英語に強い |
| `nomic-embed-text` | 274MB | Embedding | 軽量、英語中心 |
| `qwen3:1.7b` | 1.4GB | LLM | 品質が高く、2000+ 文字に対応 |
| `gemma3:1b` | 815MB | LLM | 軽量だが 500 文字超入力で不安定な場合あり |

> 8GB RAM 環境では `qwen3-embedding:0.6b` + `qwen3:1.7b` を推奨します。

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
