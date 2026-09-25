# 卒業研究中間発表テンプレート 利用ガイド

## 中間発表予稿

A4縦・2段組・2ページ固定。

### ファイル構成とリポジトリ設定

```text
bachelors-thesis-yyyy-firstname-familyname/
├── README.md             # 氏名・学籍番号
├── GUIDE.md              # 利用ガイド
├── .latexmkrc
├── .gitignore
└── midterm/
    ├── main.tex          # 予稿の本文
    ├── main.pdf          # 生成した予稿PDF
    ├── .latexmkrc
    └── figures/          # 図
        └── .gitkeep
```

| 項目 | 設定 |
| --- | --- |
| Owner | 自分のGitHubアカウント |
| リポジトリ名 | `bachelors-thesis-yyyy-firstname-familyname` |
| 公開範囲 | Private |
| Collaborator | `yoriyuki-fukui` |

- `yyyy`：対象年度（西暦4桁）
- `firstname-familyname`：名・姓のローマ字（小文字）

`README.md`は氏名・学籍番号を記入し、GUIDEへのリンク行を削除。

```md
- **Author:** 氏名
- **Student ID:** 学籍番号
```

### 取り込む方法

初回ログイン（ブラウザーで認証）：

```sh
gh auth login --hostname github.com --git-protocol https --web
gh auth setup-git --hostname github.com
```

`yyyy-firstname-familyname`を置き換えて実行。Privateリポジトリの作成・clone・先生の招待まで行います。

```sh
gh repo create bachelors-thesis-yyyy-firstname-familyname --private --template yamagata-lab/bachelors-thesis-template --clone
cd bachelors-thesis-yyyy-firstname-familyname
gh api --method PUT "repos/{owner}/{repo}/collaborators/yoriyuki-fukui" -f permission=push --silent
```

`{owner}`と`{repo}`は自動補完されます。招待は先生の承認後に有効になります。

### 必要な環境

- GitHubアカウント
- Git・[GitHub CLI（`gh`）](https://cli.github.com/)
- TeX Live / MacTeX（LuaLaTeX・latexmk・日本語パッケージ）
- エディター・PDFビューアー

## 操作方法

### PDFの作成

リポジトリ直下、または`midterm/`で実行：

```sh
latexmk -pdf
```

出力：`midterm/main.pdf`。2ページであることを確認し、TeX・PDF・図を一緒にコミット・push。

### 最初に変更するところ

`midterm/main.tex`

```tex
\newcommand{\presentationnumber}{00}
\newcommand{\researchtitle}{研究タイトルを入力してください}
\newcommand{\studentid}{00000000}
\newcommand{\studentname}{氏名を記入}
```

- `presentationnumber`：発表番号
- `researchtitle`：研究タイトル
- `studentid`：学籍番号
- `studentname`：氏名

### 本文の構成

```text
1. はじめに
2. 研究背景
3. 関連研究
4. 提案手法
   4.1 システム構成
   4.2 実装状況
5. 評価
6. まとめ
参考文献
```

見出し・本文は研究に合わせて変更。段落は空行で区切ります。

### 図・表・参考文献の差し替え

#### 図

画像を`midterm/figures/`に保存し、`\fbox{...}`全体を置き換え：

```tex
\includegraphics[width=\linewidth]{overview.pdf}
```

キャプションは図の下。`\label`は`\caption`の後。本文からの参照は`\ref{fig:overview}`。

#### 表

評価項目・単位・比較対象・数値を変更。
キャプションは表の上。`\label`は`\caption`の後。本文からの参照は`\ref{tab:evaluation}`。

図表は段の上部へ自動配置。収まらない場合は後の段・ページへ移動します。

#### 参考文献

`main.tex`末尾の`thebibliography`内を実際の出典へ変更。

- 引用：`\cite{reference-example}`
- URL：`\url{実際のURL}`
