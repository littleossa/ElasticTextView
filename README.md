# ElasticTextView
TextViewがキーボードの下に隠れないようにする為に、キーボードの表示非表示に応じてTextViewの高さを変更するアプリ

## Article
<a href="https://dev.classmethod.jp/etc/elastic-text-view">TextViewがキーボードに隠れてしまう問題を解決する</a>

## Demo
![elasticTextViewDemo](https://user-images.githubusercontent.com/67716751/134301869-61dc8d6e-68e3-4ef2-af11-9d2473fd27ce.gif)

## Feature
- キーボード表示時: キーボードの高さ分だけTextViewのBottomの位置をあげる
- キーボード非表示時: TextViewのBottomConstraint.constantは0
