# 卒業研究中間発表テンプレート 利用ガイド（2026年度）

山形研究室の卒業研究中間発表予稿用LuaLaTeXテンプレートです。
本文・図表・参考文献は差し替え用の案内であり、実際の研究内容や研究結果ではありません。

## 最初に変更するところ

リポジトリ直下の`README.md`に、自分の氏名と学籍番号を記入してください。
次に、`midterm/main.tex` の先頭にある次の4項目を変更します。

```tex
\newcommand{\presentationnumber}{00} % 発表番号。不要なら {} にする。
\newcommand{\researchtitle}{研究タイトルを入力してください}
\newcommand{\studentid}{00000000}
\newcommand{\studentname}{氏名を記入}
```

`presentationnumber` はタイトル先頭の発表番号です。未確定のため仮に `00` としています。
番号を表示しない場合は `\newcommand{\presentationnumber}{}` にします。
`README.md`とTeXの氏名・学籍番号は自動同期しないため、両方を更新してください。
タイトルなどに `&`、`%`、`_`、`#` を含める場合は、LaTeXの予約文字なので
それぞれ `\&`、`\%`、`\_`、`\#` と書いてください。

## 必要な環境

`lualatex` と `latexmk`、および本テンプレートが読み込むパッケージ・フォントが必要です。
TeX Live / MacTeX などの環境で利用できます。OSに固有のフォントは指定していません。
主な依存関係は、LuaTeX-ja、原ノ味フォント、newtx、geometry、amsmath、graphicx、
array、tabularx、caption、titlesec、indentfirst、etoolbox、url、hyperrefです。
最小構成のTeX環境では、依存パッケージの追加が必要になる場合があります。
初回実行時はLuaLaTeXのフォントキャッシュ作成に時間がかかることがあります。

## PDFの作成

### リポジトリ直下から

```sh
latexmk -pdf
```

### midtermディレクトリから

```sh
cd midterm
latexmk -pdf
```

どちらも `midterm/main.tex` をLuaLaTeXで処理し、`midterm/main.pdf` を生成します。
リポジトリ直下から `latexmk -pdf midterm/main.tex` と指定することもできます。

**`.latexmkrc` は必須です。** リポジトリ直下と `midterm/` の両方に置いてあります。
`-pdf` が選ぶ `$pdflatex` のコマンドを `lualatex` に設定しているため、
コマンドは先生の指定どおり `latexmk -pdf` のままでLuaLaTeXが使われます。
`$pdf_mode = 4` だけに置き換えると、`-pdf` で意図が上書きされるため変更しないでください。
ログにはルール名として `pdflatex` と表示されますが、実行コマンドの行は `lualatex` です。

PDFを残して補助ファイルを削除する場合は、同じディレクトリで次を実行します。

```sh
latexmk -c
```

大文字の `-C` はPDFも削除するため、使い分けに注意してください。

## ファイル構成

```text
bachelors-thesis-2026-firstname-familyname/
├── README.md
├── GUIDE.md
├── .latexmkrc
├── .gitignore
└── midterm/
    ├── main.tex
    ├── main.pdf          # 組版確認用PDF。本文を変更したら再生成する。
    ├── .latexmkrc
    └── figures/
        └── .gitkeep      # 空の画像ディレクトリをGitで保持するためのファイル
```

`.latexmkrc`、`.gitignore`、`.gitkeep` は先頭がドットのファイルです。
ファイルをコピーするときは、これらも含めてください。
`main.pdf` と図のPDFもGit管理します。`main.tex`を変更したら`main.pdf`を再生成し、両方をコミットしてください。

## 本文の構成

標準構成は次のとおりです。見出しの内容は研究に合わせて変更してください。

1. はじめに
2. 研究背景
3. 関連研究
4. 提案手法
   - 4.1 システム構成
   - 4.2 実装状況
5. 評価
6. まとめ
7. 参考文献（見出しには番号を付けない）

本文の段落は空行で区切ります。段落の末尾ごとに `\\` を付ける必要はありません。
節・図・表・参考文献の番号は自動で付くため、本文からは `\ref` や `\cite` で参照します。

## 図・表・参考文献の差し替え

### 図

画像ファイルを `midterm/figures/` に保存します。
`main.tex` の図の差し替え欄にある `\fbox{...}` 全体を、例えば次に置き換えます。

```tex
\includegraphics[width=\linewidth]{overview.pdf}
```

この例では実際に `midterm/figures/overview.pdf` を配置してください。
PNGなどを使う場合はファイル名と拡張子を合わせます。
2段組の片側に入れる図では `\textwidth` ではなく `\linewidth` を使います。
図のキャプションは図の下に置き、`\label` は `\caption` の後に書きます。

### 表

表のキャプションは表の上に置きます。
テンプレートの横線は未記入の値を表しており、実測値ではありません。
項目名、単位、条件とともに実際の値へ差し替えてください。

### 参考文献

`main.tex` の末尾にある `thebibliography` の各項目を、実際の出典へ差し替えます。
本文からの参照例は `\cite{reference-example}` です。
URLを入れる場合は `\url{実際のURL}` を用い、追跡用パラメータは付けません。
テンプレートに入っている文献2件は、実在する文献情報ではありません。

## レイアウトについて

A4縦（210 mm × 297 mm）、本文2段組、全幅のタイトルと学籍番号・氏名、
番号付きの節・小節、ページ番号なしを標準とします。

山形研究室の中間予稿テンプレート仕様は、左右余白17 mm、上余白27 mm、
下余白26 mm、段間7.4 mm、本文10.5 bp、行送り12.3 bp、タイトル14 bp、
学籍番号・氏名12 bpです。`bp` はPDF上の1/72 inchです。

図と表は原則として、TeXが配置可能と判断した現在または次の段・ページの上部へ移動します。
ソースに書いた位置がすでにページ途中の場合、同じページの上部へ遡って配置することはできないため、
次の段または次のページの上部に配置されます。図のキャプションは下、表のキャプションは上です。

予稿は2ページ固定です。本文量や図表の大きさを調整し、コンパイル後にページ数を確認してください。

## 学生用リポジトリの作成

テンプレートリポジトリをcloneし、自分のGitHubアカウントに空のPrivateリポジトリを作成してpushします。
Privateリポジトリの作成時にはREADME、ライセンス、`.gitignore`を追加しないでください。
学生用リポジトリはテンプレートのForkではなく、各学生が所有する独立したリポジトリとします。

```sh
git clone https://github.com/yamagata-lab/bachelors-thesis-2026-template.git bachelors-thesis-2026-firstname-familyname
cd bachelors-thesis-2026-firstname-familyname
git remote remove origin
git remote add origin 学生用PrivateリポジトリのURL
git push -u origin HEAD:main
```

`firstname`を名、`familyname`を姓のローマ字表記に置き換え、リポジトリ名はすべて小文字にします。

## GitHub上で必要な設定

| 項目 | 指定内容 |
| --- | --- |
| Owner | 学生本人のGitHubアカウント |
| Repository name | `bachelors-thesis-2026-firstname-familyname` |
| Visibility | **Private** |
| Collaborator | `yoriyuki-fukui` |

Private設定とcollaboratorの追加は、学生用リポジトリのSettingsから行います。

## スケジュール

先生の案内に記載された予定です。変更の可能性があるため、最終案内を確認してください。

| 項目 | 予定日 |
| --- | --- |
| 発表タイトル確定 | 2026年10月13日 |
| 予稿提出 | 2026年10月20日 |
| 発表当日 | 2026年10月23日 |

## 提出前の確認

- `README.md`とTeXに、正しい氏名・学籍番号を記入した。
- 仮の発表番号、タイトル、案内文、仮図、仮表、仮の参考文献を差し替えた。
- `latexmk -pdf` で再生成し、PDFの日本語・図表・参照番号、および2ページであることを確認した。
- `.latexmkrc` を含む必要なファイルをコミットしてpushした。
- 自分のリポジトリが **Private** であり、`yoriyuki-fukui` に必要なアクセスがあることを確認した。

## 動作確認環境

LuaHBTeX 1.24.0（TeX Live 2026/macOS）、latexmk 4.88 で、
リポジトリ直下から `latexmk -pdf` を実行して確認しています。
TeXの構成やパッケージのバージョンが異なる環境では、字形や改行位置が変わる場合があります。
