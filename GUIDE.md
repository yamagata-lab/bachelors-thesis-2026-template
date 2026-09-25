# 卒業研究中間発表テンプレート 利用ガイド

## 概要

A4縦・2段組・2ページ固定。

### ファイル構成

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

### リポジトリの設定

| 項目 | 設定 |
| --- | --- |
| Owner | 自分のGitHubアカウント |
| リポジトリ名 | `bachelors-thesis-yyyy-firstname-familyname` |
| 公開範囲 | Private |
| Collaborator | `yoriyuki-fukui` |

- `yyyy`：対象年度（西暦4桁）
- `firstname-familyname`：名・姓のローマ字（小文字）

## 作成手順

**必要な環境** （以下を用意，インストールしてください）

- [GitHubアカウント](https://github.com/signup)
- [Git](https://git-scm.com/install/)：ファイルの変更履歴を管理
- GitHub CLI（`gh`）：ターミナルからGitHubを操作
  - インストール：[Windows](https://github.com/cli/cli/blob/trunk/docs/install_windows.md) / [macOS](https://github.com/cli/cli/blob/trunk/docs/install_macos.md) / [Linux](https://github.com/cli/cli/blob/trunk/docs/install_linux.md)
- LaTeX：TeXファイルからPDFを作成
  - Windows：[TeX Live](https://tug.org/texlive/acquire-netinstall.html)の`install-tl-windows.exe`を実行し、フルインストール
  - macOS：[MacTeX](https://tug.org/mactex/mactex-download.html)の`MacTeX.pkg`をインストール
  - Linux：[TeX Live](https://tug.org/texlive/quickinstall.html)をフルインストールし、案内に従ってPATHを設定
  - LuaLaTeX・latexmk・日本語パッケージを含む構成を使用
- エディター：[Visual Studio Code](https://code.visualstudio.com/download)など
- PDFビューアー：ブラウザーやOS標準のもので可

### 1. インストールの確認とGitHubへのログイン

インストール後、ターミナルを開き直します。WindowsはPowerShell、macOS・Linuxは「ターミナル」を使います。
以降のコマンドは1行ずつ実行してください。

```sh
git --version
gh --version
lualatex --version
latexmk -v
```

すべてバージョンが表示されたら、GitHubへログインします。開いたブラウザーで自分のアカウントを認証してください。

```sh
gh auth login --hostname github.com --git-protocol https --web
gh auth setup-git --hostname github.com
```

### 2. 自分のリポジトリを作成（initial commit）

`保存先フォルダーのパス`を、自分のPCにある保存先のパスに置き換えます。

```sh
cd "保存先フォルダーのパス"
```

次の2行の`yyyy-firstname-familyname`を自分の年度・名前に置き換えて実行します。

```sh
gh repo create bachelors-thesis-yyyy-firstname-familyname --private --template yamagata-lab/bachelors-thesis-midterm-template --clone
cd bachelors-thesis-yyyy-firstname-familyname
```

自分のアカウントにPrivateリポジトリが作られ、同名のフォルダーがPCにできます。
テンプレート一式は初回コミット（initial commit）として自動保存されます。

続いて先生を共同編集者に招待します。`{owner}`と`{repo}`はそのままで実行してください。

```sh
gh api --method PUT "repos/{owner}/{repo}/collaborators/yoriyuki-fukui" -f permission=push --silent
```

先生が招待を承認すると、共同編集できるようになります。

### 3. 氏名・発表情報の設定

エディターで、作成したフォルダーを開きます。

**`README.md`**

氏名・学籍番号を記入し、GUIDEへのリンクと削除案内の行を消します。

```md
- **Author:** 氏名
- **Student ID:** 学籍番号
```

**`midterm/main.tex`の先頭**

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

### 4. PDFの作成

編集したファイルを保存し、先ほどのターミナルで実行します。

```sh
latexmk -pdf
```

`midterm/main.pdf`を開き、氏名・タイトルと、2ページであることを確認します。
エラーが出た場合は修正して再実行してください。

### 5. 変更を保存・送信（first commit）

まず、コミットに記録する氏名・メールアドレスを設定します。引用符の中を自分のものに置き換えてください。

```sh
git config user.name "氏名"
git config user.email "GitHubに登録したメールアドレス"
```

変更した3ファイルをコミット（履歴に保存）し、push（GitHubへ送信）します。

```sh
git add README.md midterm/main.tex midterm/main.pdf
git commit -m "first commit"
git push
gh repo view --web
```

開いたGitHubページで、READMEとPDFが更新されていれば完了です。

## 本文の構成

`midterm/main.tex`の本文を、自分の研究内容に差し替えます。

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

見出しは`\section{見出し}`、小見出しは`\subsection{小見出し}`。段落は空行で区切ります。
構成は研究に合わせて変更してください。

## 図・表・参考文献の差し替え

### 図

画像を`midterm/figures/`に保存し、`\fbox{...}`全体を置き換えます。`overview.pdf`は画像のファイル名です（PDF・PNG・JPEG）。

```tex
\includegraphics[width=\linewidth]{overview.pdf}
```

キャプションは図の下。`\label`は`\caption`の後。本文からの参照は`\ref{fig:overview}`。

### 表

評価項目・単位・比較対象・数値を変更します。
キャプションは表の上。`\label`は`\caption`の後。本文からの参照は`\ref{tab:evaluation}`。

図表は段の上部を優先して自動配置されます。収まらない場合は後の段・ページへ移動します。

### 参考文献

`midterm/main.tex`末尾の`thebibliography`内を実際の出典に変更します。

- 文献の登録：`\bibitem{reference-example}`に続けて著者・題名・出版年などを記入
- 本文からの引用：`\cite{reference-example}`
- URL：`\url{実際のURL}`

本文や図表を更新した後も、PDFを作り直し、TeX・PDF・図を一緒にコミット・pushしてください。
