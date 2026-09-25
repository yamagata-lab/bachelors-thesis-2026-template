# 卒業研究中間発表テンプレート 利用ガイド

## 中間発表予稿

山形研究室の卒業研究中間発表予稿用LuaLaTeXテンプレートです。
予稿はA4縦・2段組・2ページ固定です。

### ファイル構成とリポジトリ設定

```text
bachelors-thesis-2026-firstname-familyname/
├── README.md
├── GUIDE.md
├── .latexmkrc
├── .gitignore
└── midterm/
    ├── main.tex          # 予稿の本文（ここを編集していきます）
    ├── main.pdf          # 生成した予稿PDF
    ├── .latexmkrc
    └── figures/
        └── .gitkeep
```

- `README.md`：氏名・学籍番号を記入します。
- `midterm/main.tex`：タイトル・氏名・学籍番号・本文を編集します。
- `midterm/main.pdf`：本文を変更するたびに再生成し、TeXと一緒にコミットします。
- `midterm/figures/`：使用する図を保存します。図のPDFもGit管理します。
- `.latexmkrc`、`.gitignore`、`.gitkeep`：先頭がドットのファイルも含めて取り込んでください。

学生用リポジトリは、各学生のGitHubアカウントに作成します。

| 項目 | 設定内容 |
| --- | --- |
| Owner | 学生本人のGitHubアカウント |
| Repository name | `bachelors-thesis-2026-firstname-familyname` |
| Visibility | **Private** |
| Collaborator | `yoriyuki-fukui` |

`firstname`を名、`familyname`を姓のローマ字表記に置き換え、リポジトリ名はすべて小文字にします。
作成後、リポジトリのSettingsから先生（`yoriyuki-fukui`）をcollaboratorに招待します。

リポジトリ直下の`README.md`には、次の2行を記入します。

```md
- **Author:** 氏名
- **Student ID:** 学籍番号
```

<details>
<summary>レイアウト仕様</summary>

- 用紙：A4縦（210 mm × 297 mm）
- 本文：2段組、10.5 bp、行送り12.3 bp
- 余白：上27 mm、下26 mm、左右17 mm
- 段間：7.4 mm
- タイトル：全幅、14 bp
- 学籍番号・氏名：12 bp
- 節・小節：番号付き
- ページ番号：なし

`bp`はPDF上の1/72 inchです。

</details>

### 取り込む方法

1. GitHubで、自分のアカウントに上記の名前で**空のPrivateリポジトリ**を作成します。作成時にはREADME、ライセンス、`.gitignore`を追加しません。

2. ターミナルでテンプレートをcloneします。以下の`firstname-familyname`は自分の名前に置き換えてください。

   ```sh
   git clone https://github.com/yamagata-lab/bachelors-thesis-2026-template.git bachelors-thesis-2026-firstname-familyname
   cd bachelors-thesis-2026-firstname-familyname
   ```

3. push先を自分のリポジトリへ変更し、ファイルをアップロードします。`学生用PrivateリポジトリのURL`は、手順1で作成したリポジトリのURLに置き換えます。

   ```sh
   git remote remove origin
   git remote add origin 学生用PrivateリポジトリのURL
   git push -u origin HEAD:main
   ```

4. 自分のリポジトリのSettingsから、`yoriyuki-fukui`をcollaboratorに招待します。

この手順では、テンプレートから独立した学生本人のリポジトリを作成します。

### 必要な環境

- **GitHubアカウント**：学生用Privateリポジトリの作成と先生の招待に使用します。
- **Git**：テンプレートのclone、変更のコミット・pushに使用します。
- **TeX環境**：TeX Live / MacTeXなど、LuaLaTeXを利用できる環境を用意します。
- **LuaLaTeX（`lualatex`）**：日本語を含むTeXファイルをPDFへ変換します。
- **latexmk**：`latexmk -pdf`で必要な回数のコンパイルを実行します。
- **エディター・PDFビューアー**：`main.tex`の編集と`main.pdf`の確認に使用します。

<details>
<summary>必要なパッケージ・フォントと動作確認環境</summary>

- 日本語：LuaTeX-ja、原ノ味フォント
- 欧文・数式：newtx、amsmath
- 組版・図表：geometry、graphicx、array、tabularx、caption、titlesec、indentfirst
- その他：etoolbox、url、hyperref
- 動作確認：LuaHBTeX 1.24.0（TeX Live 2026/macOS）、latexmk 4.88

最小構成のTeX環境では、パッケージの追加が必要になる場合があります。
初回コンパイル時はフォントキャッシュの作成に時間がかかることがあります。

</details>

## 操作方法

### PDFの作成

リポジトリ直下で次を実行します。

```sh
latexmk -pdf
```

`midterm/main.tex`から`midterm/main.pdf`が生成されます。
`midterm`ディレクトリから実行する場合は、次のようにします。

```sh
cd midterm
latexmk -pdf
```

付属の`.latexmkrc`によってLuaLaTeXを使用します。
コンパイル後はPDFを開き、文字・図表・参照番号と、2ページであることを確認してください。
本文を変更したら再実行し、`main.tex`と`main.pdf`を一緒にコミット・pushします。

補助ファイルを削除する場合は、同じディレクトリで`latexmk -c`を実行します。
小文字の`-c`はPDFを残し、大文字の`-C`はPDFも削除します。

### 最初に変更するところ

`README.md`に氏名・学籍番号を記入します。
記入後、README内のGUIDEへのリンクと、その下の「（ここを消してください）」を削除し、氏名・学籍番号の2行だけにしてください。

次に、`midterm/main.tex`の先頭にある次の4項目を変更します。

```tex
\newcommand{\presentationnumber}{00}
\newcommand{\researchtitle}{研究タイトルを入力してください}
\newcommand{\studentid}{00000000}
\newcommand{\studentname}{氏名を記入}
```

- `presentationnumber`：タイトル先頭の発表番号
- `researchtitle`：研究タイトル
- `studentid`：学籍番号
- `studentname`：氏名

発表番号を表示しない場合は`\newcommand{\presentationnumber}{}`とします。
`README.md`とTeXの氏名・学籍番号は自動同期しないため、両方を更新してください。

タイトルなどに`&`、`%`、`_`、`#`を含める場合は、
それぞれ`\&`、`\%`、`\_`、`\#`と書きます。
続いて、本文の案内文と図表・参考文献を自分の研究内容へ差し替えます。

### 本文の構成

標準構成は次のとおりです。見出しは研究に合わせて変更してください。

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

本文の段落は空行で区切ります。段落末尾の`\\`は不要です。
節・図・表・参考文献には自動で番号が付き、本文から`\ref`や`\cite`で参照できます。
参考文献の見出しには節番号を付けません。

### 図・表・参考文献の差し替え

#### 図

画像ファイルを`midterm/figures/`に保存します。
`main.tex`の図の差し替え欄にある`\fbox{...}`全体を、次のように置き換えます。

```tex
\includegraphics[width=\linewidth]{overview.pdf}
```

この例では`midterm/figures/overview.pdf`を配置します。
PNGなどを使う場合はファイル名と拡張子を合わせてください。
2段組の片側に入れる図の幅は`\linewidth`で指定します。

図のキャプションは図の下に置き、`\label`は`\caption`の後に書きます。

#### 表

表のキャプションは表の上に置き、`\label`は`\caption`の後に書きます。
評価項目、単位、比較対象、条件と数値を自分の研究に合わせて変更してください。
サンプルの数値欄の横線は未記入を表します。

図と表は段の上部へ自動配置されます。空き状況や図表の大きさによっては、
後の段・ページや図表専用ページへ移動します。同じページへの配置は保証されません。

#### 参考文献

`main.tex`末尾の`thebibliography`内の各項目を、実際の出典へ差し替えます。
サンプルの2件は書式例です。

- 本文から引用する：`\cite{reference-example}`
- URLを記載する：`\url{実際のURL}`

### 提出前の確認

- `README.md`とTeXに正しい氏名・学籍番号を記入した。
- 発表番号、タイトル、本文、図表、参考文献を差し替えた。
- `latexmk -pdf`で再生成し、PDFの表示と2ページであることを確認した。
- `main.tex`、`main.pdf`、使用した図などをコミット・pushした。
- 自分のリポジトリがPrivateであり、`yoriyuki-fukui`の招待が承認されていることを確認した。
