## 必要なもの

- [ImageMagick](https://imagemagick.org/index.php): 画像ファイルを PDF に変換する
- [Ghostscript](https://www.ghostscript.com/): PDF の画質を下げる

```shell
brew install imagemagick ghostscript
```

## 使い方

PDF にまとめたい画像が入ったディレクトリ、が入ったディレクトリを指定する。

```shell
$ tree parent_dir
parent_dir
├── images1
│   ├── 01.jpeg
│   ├── 02.jpeg
│   ├── 03.jpeg
│   ├── 04.jpeg
│   └── 05.jpeg
├── images2
│   ├── 01.jpeg
│   ├── 02.jpeg
│   └── 03.jpeg
└── images3
    ├── 01.jpeg
    ├── 02.jpeg
    ├── 03.jpeg
    └── 04.jpeg
```

実行すると、各ディレクトリ名の PDF が生成される。

```
$ bash convert.sh parent_dir

$ tree parent_dir
parent_dir
├── images1
│   ├── 01.jpeg
│   ├── 02.jpeg
│   ├── 03.jpeg
│   ├── 04.jpeg
│   └── 05.jpeg
├── images1.pdf <-- new
├── images2
│   ├── 01.jpeg
│   ├── 02.jpeg
│   └── 03.jpeg
├── images2.pdf <-- new
├── images3
│   ├── 01.jpeg
│   ├── 02.jpeg
│   ├── 03.jpeg
│   └── 04.jpeg
└── images3.pdf <-- new
```

