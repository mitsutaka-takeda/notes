# CPPCON 2017内容まとめ

# まとめのフォーマット

- 発表タイトル by 発表者
- 概要(発表者のポイント)
- 自分が気になったところ
- 関連情報

## Learning and Teaching Modern C++ by Bjarne Stroustrup
### 概要

- プログラマは、全員、先生であり生徒である。人に教え教わる。
- 教えるにあたり、教わる側を知ることが重要。

   - 教わる目的。何がしたいのか。
   - 教わる時点での何ができ、どんな経験があるか。

- 何を教えるか、注意深く選択する。そして学習の目的明確にする。何ができるようになるのか。
- 適切なツールを使う。IDE/Debugger/Profiler/Static Analysis Tools、etc。
- GUI/Webなどを組込むと学習が面白くなる。
- 単一文化になるのを避ける。多様なスキルが必要。他の言語もある。形式に拘らず、必要に応じて柔軟に。シンプルさは重要。
- 教えることには教える側の価値観が含まれる。何が重要で何が重要でないか選択。

### 気になったところ
- プログラミングで現実の課題を解決するエンジニアリングを重要しするBjarneらしい発表。
- ライブラリをスキルレベル毎にわけるというアイデアが面白い。入門者レベルには使用しやすりIFを提供。経験者レベルにはカスタマイズ可能な仕組み。上級者には、拡張できる仕組みなどを提供するなど。namespaceやモジュールで分ける。
- 導入を簡単にするために、C++にはやはりビルド．システムやパッケージ．マネージャーが必要。

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=fX2W3nNjJIo)
- [C++ Core Guidelines@gitub](https://github.com/isocpp/CppCoreGuidelines/blob/master/CppCoreGuidelines.md)

## C++ as a "Live at Head" Language
### 概要
- "Live at Head"とは。常に依存しているライブラリの最新(Head)を使用しているエコシステムのこと。
- Semantic Versioning & 既存パッケージ・マネージャの問題点。

   - スケールしない。依存のレイヤーが高くなるほど、依存関係を満すことが難しくなる。例えば、libAが、libB&libCに依存していて、libB&libCが異なるバージョンのlibDに依存していると問題が起きる。

- スケールさせるには、全てのパッケージが最新の状態であれば良い(Live at Head)。
- Live at Headである条件。

   - APIの所有者(Library)側がAPIの変更を行うためのツールを用意する。Clientは、そのツールを使用して依存関係をアップデートする。
   - Abseilの場合は、更新用にclang-tidyを提供する。

- Clientの更新ツールを実装するために、Library側は互換性のための条件を明確にして、クライアント側はそれに従ったコーディングをする。

### 気になったところ。
- パッケージ・マネージャが無いことがC++の弱点の1つと言われているが、Live at Headを実現するためには、バイナリでパッケージを管理するマネージャがないことが有利に働く。
- Software Engineering & Programmingの違い。長い間に渡って使用されるソフトウェアを作るのがエンジニアリング。プログミングは取り敢えず目の前の課題を解決することに注力する。自分がどちらのソフトウェアを作っているのか意識する。
- Googleでは知識共有のため週に1度tipsを配信しているらしい。レビューの時など、そのtipsを参照する。
- クライント側の更新ツールのテストはどうするの？Googleのようにライブラリもクライアントも自分達でコントロールしている場合はツールのバグは、すぐフィードバックできるけど。

### 関連情報
- [発表動画@Youtube](https://www.youtube.com/watch?v=tISy7EJQPzI)
- [Abseil](https://abseil.io/)

## Programming with C++ Constraints: Background, Utility, and Gotchas by Walter E. Brown
### 概要
- Conceptの紹介。Conceptは要件。Precondition/Narrow&Wide contractなどの用語との比較。

   - 実行時(precondition)/コンパイル時(Concept)
 
- constraintはコンパイル時predicate。Conceptはconstraintの集合。
- enable_ifとConceptの違い。

   - swapをenable_ifとrequires-clauseで実装してlibc++のis_swappable.pass.cppテストが失敗した。
   - requires-clauseの導入でconstrainedなほうがオーバーロードで勝つことになったので、enable_ifでambuguityだったケースもそうでなくなることがある。

### 気になったところ
- semantics的な違いがの影響は最悪コンパイル・エラーになるだけ？もしかしたら呼び出される関数が変わるかも。

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=n4ie7tPMXOQ&list=PLHTh1InhhwT6bwIpRk0ZbCA0N2p1taxd6&index=7)
- [Modern Template Metaprogramming: A Compendium, Part I](https://www.youtube.com/watch?v=Am2is2QCvxY)
- [Modern Template Metaprogramming: A Compendium, Part II](https://www.youtube.com/watch?v=a0FliKwcwXE)

