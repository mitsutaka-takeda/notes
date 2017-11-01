# CPPCON 2017内容まとめ

# まとめのフォーマット

- 発表タイトル by 発表者
- 概要(発表者のポイント)
- 自分が気になったところ
- 関連情報

# Table of Contents

- [Learning and Teaching Modern C++ by Bjarne Stroustrup](#learning-and-teaching-modern-c-by-bjarne-stroustrup)
- [C++ as a "Live at Head" Language by Titus Winters](#c-as-a-live-at-head-language-by-titus-winters)
- [Programming with C++ Constraints: Background, Utility, and Gotchas by Walter E. Brown](#programming-with-c-constraints-background-utility-and-gotchas-by-walter-e-brown)
- [Meta: Thoughts on generative C++ by Herb Sutter](#meta-thoughts-on-generative-c-by-herb-sutter)
- [Modern C++ Interfaces: Complexity, Emergent Simplicy, SFINAE, and Second Order Properties by Stephen Dewhurst](#modern-c-interfaces-complexity-emergent-simplicy-sfinae-and-second-order-properties-by-stephen-dewhurst)
- [A modern formatting library for C++ by Victor Zverovich](#a-modern-formatting-library-for-c-by-victor-zverovich)
- [From security to performance to GPU programming by Sergey Zubkov](#from-security-to-performance-to-gpu-programming-by-sergey-zubkov)
- [Fuzz or lose... by Kostya Serebryany](#fuzz-or-lose-by-kostya-serebryany)
- [Practical Patterns with Networking TS by Michael Caisse](#practical-patterns-with-networking-ts-by-michael-caisse)
- [Make Classes Great Again by Vinnie Falco](#make-classes-great-again-by-vinnie-falco)
- [Postmodern immutable data structures by Juan Pedro Bolivar Puente](#postmodern-immutable-data-structures-by-juan-pedro-bolivar-puente)

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

## C++ as a "Live at Head" Language by Titus Winters
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

## Meta: Thoughts on generative C++ by Herb Sutter
### 概要

- Metaclassの紹介。C++でコード生成をプログラムできるようにする仕組み。

   - C++をよりパワフルかつシンプルにするという長期目標から生れたツール。
   - 現実のコードから何がしたいのか、どのようなツールが使われているか観察。間違ったツールで行なわれている問題を見つける。

- Metaclassの土台となるツール。Reflection/Compile-time code/Injection。

   - Reflectionは、コンパイル時に型情報をクエリできる。
   - Compile-time codeは、コンパイル時のコーディング方法。
   - Injectionは、コンパイル時コードの結果からコードを生成できる。

- Metaclassの長所。

   - 言語仕様を変更せずに、言語に機能追加ができる。
   - 自然言語よりコードの方が簡潔に正確に記述できる。

- Metaclassの応用。

   - interface、value typeなど慣習で守らている規約をコードで表現できる。
   - Serialization/Deserializationの自動化。

### 気になったところ

- 最近のC++関連の話題で最もエキサイティングな話。応用分野は数えきれないし、コードも簡潔になる。
- C++23には間にあうか、どうか位の話しだと思う。C++20にはConcpet/Module/Coroutineなどメジャー機能が入る予定なので委員会もそこにフォーカスしそう。

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=4AfRAVcThyA)
- [発表資料@github](https://github.com/CppCon/CppCon2017/blob/master/Keynotes/Meta%20-%20Thoughts%20on%20Generative%20C%2B%2B/Meta%20-%20Thoughts%20on%20Generative%20C%2B%2B%20-%20Herb%20Sutter%20-%20CppCon%202017.pdf)
- [Compiler Explorer with Metaclass support](https://cppx.godbolt.org/)
- [Practical Applications of Reflection by Jackie Kay@C++ NOW 2017](https://www.youtube.com/watch?v=VFwGCLPTXmk)


## Modern C++ Interfaces: Complexity, Emergent Simplicy, SFINAE, and Second Order Properties by Stephen Dewhurst
### 概要
- Interfaceの変遷。

  - Policy-Based Designではクライアントに実装上の決定をさせるIFが流行。Policyでクライアントが実装を自由にカスタマイズできる。
  - 現在では実装上の決定は実装者側にまかせるIFが主流になってきた。
  - 実装者の経験と決定をIF/コードに反映させる

- 経験をコードに反映させる。

  - 例えば、配列をコピーするテンプレートを書いて、memcpyで実装。TriviallyCopyableな型でしか動かない実装。
    これにTriviallyCopyableでない型を渡してバグったとき(経験)、if constexprなどで、NonTriviallyCopyableな型への
    実装を組込む。

- Semanticsも重要だが、Syntaxも重要

  - templated typedefでSyntaxを簡単に。

- Self-Identification。

  - 型が自分の機能を相手に伝えるための型。SFINAEでSelf-Identificationを利用してオーバーロードを制限できる。
  - 標準の関数オブジェクトの`is_transparent`。Dan Saksの`is_enum_container`。

- Predicate Composition

  - type listとpredicateのcompositionはtemplate variableを使用すると簡単に実装できる。
  - type predicatesのASTでpredicatesを好きに組合せることができる。
### 気になったところ
- C++ Gothaの作者。
- Type predicatesのASTでコンパイル時間はどうなんだろう。
- std::decayを使ったsimilarの定義がナイス。

```c++
template <typename S, typename T>
using similar = std::is_same<std::decay_t<<S>, std::decay_t<T>>;
 ```

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=PFdWqa68LmA)
- [STEVE DEWHURST C++](http://www.stevedewhurst.com/once_weakly.html)
- [C++ Gotchars: Avoiding Common Problems in Coding and Design](https://www.amazon.com/Gotchas-Avoiding-Common-Problems-Coding/dp/0321125185y)
- [Making New Friends Idiom](https://en.wikibooks.org/wiki/More_C%2B%2B_Idioms/Making_New_Friends)

## A modern formatting library for C++ by Victor Zverovich

## 概要

- C++のフォーマット(データを文字列に変換)・ライブラリの歴史
- printfの記法はすばらしいが、型安全ではない(フォーマット定義とデータ型が違うと未定義)。
- fmtライブラリの紹介。

   - 標準に提案中。
   - バイナリ・サイズはprintfと同等。
   - pythonやrustのフォーマットと同様の記法。
   - AllocationなしのAPIを用意。

- fmtライブラリの実装について。

   - type erasureでバイナリ・サイズとコンパイル時間を節約。folly::formatと比較してバイナリ・サイズは10分の1くらい。
   - New Extension API

- clang-tidyでprintfを置き換える？

## 気になったところ

- type erasureはコード・サイズと実行時間のトレード・オフ。
- New Extension APIで、任意の型をフォーマットする方法を学ぶ。

## 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=ptba_AqFYCM&list=PLHTh1InhhwT6bwIpRk0ZbCA0N2p1taxd6&index=26)
- [スライド](https://github.com/CppCon/CppCon2017/blob/master/Demos/A%20Modern%20Formatting%20Library%20for%20C%2B%2B/A%20Modern%20Formatting%20Library%20for%20C%2B%2B%20-%20Victor%20Zverovich%20-%20CppCon%202017.pdf)
- [fmt@github](https://github.com/fmtlib/fmt)

## From security to performance to GPU programming by Sergey Zubkov

### 概要

- allocatorの応用分野と仕組みの概要。

  - secure_allocator:安全なメモリ以外にコンテンツが配置されないように。ページ・アウトでファイルにメモリがキャッシュされたりすると危ない。
  - pool: メモリのフラグメンテーションを防ぐ。
  - tbb::scalable_allocator: スレッド固有のallocator。メモリ確保のコンテンションが少くなりスケールする。
  - boost::interprocess::allocator: 共有メモリにメモリを確保。allocatorを適用する場所に注意が必要。`std::scoped_allocator_adaptor`。
  - boost::compute::pinned_allocator: GPUのメモリ上に確保。

### 気になったところ

- cppcon 2017でアロケータの話が数件あった。C++17でポリモーフィック・アロケータが出て来てまた盛りあがってるのか。
- まともなカスタム・アロケータ書いたことないので書いてみたい。
- allocatorのレポジトリが欲しい。

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=HdQ4aOZyuHw)
- [Windows pagefile security risks and how to avoid them](http://searchenterprisedesktop.techtarget.com/tip/Windows-pagefile-security-risks-and-how-to-avoid-them)
- [Controlling memory consumption with Intel Threading Building Blocks(Intel TBB) scalable allocator](https://software.intel.com/en-us/articles/controlling-memory-consumption-with-intel-threading-building-blocks-intel-tbb-scalable)

## Fuzz or lose... by Kostya Serebryany

### 概要

- Fuzzで見つかったバグ

  - OpenSSLのHeartbleedバグは数秒で見つかる
  - boost regex

- C++はメモリ・バグを作りやすい。

  - バッファ・オーバーフロー
  - 解放後の領域を使う
  - etc

- libFuzzerを使うためには。

  - clangでAddress Sanitizerとfuzzerをオンにしてビルド。
  - Cリンケージで、バイト列を受け取る関数を定義。

- APIに対して使う。

  - APIとはすべてのデータを扱えるべき場所。例えば、外部からの入力とか？
  - APIは落ちたりしたら駄目。

- OSS-Fuzz: Fuzzing as a Service(Googleで使用しているツール)
- Structure-aware fuzzing

  - Custom Mutator
  - Protobufferと連携できる(libprotobuf)

- fuzzerをロジカル・バグの発見に使う。

  - 参照実装と最適実装の違いを発見するのに使える。
  - Fuzz-Driven Development。

### 気になったところ

- fuzzing適用にclangだけで行けるのは素晴らしい。
- Fuzzの対象をどこにするかには注意が必要そう。

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=k-Cv8Q3zWNQ&t=634s)
- [libprotobuf-mutator](https://github.com/google/libprotobuf-mutator)

## 10 Core Guidelines You Need to Start Using Now by Kate Gregory

### 概要

- Core Guidelinesで直ぐに従うべきルールの紹介
- Bikesheding(Parkinson's Law of Triviality)

  - 重要なことではなく、trivialなことに時間を割くこと。無駄な事にフォーカスしてしまいがちなこと。

- Bikeshedingをやめて、ルールに従う。

  - レビューのときなど、Core Guidelinesへの参照を使ってみては？

- 紹介されていたルール。

 - C.45 & C.48: in-class初期化を使う。
 - F.51: オーバーロードよりデフォルト引数。
 - C.47: メンバ変数と初期化リストの順番を併せる。
 - I.23: 関数の引数の数を減らす。
 - ES.50: const castだめ。
 - I.11: 生ポインタで所有権を移さない。
 - F.21: 複数の値を戻すときは、strucかtupleを使う。(Structured bindings)
 - Enum.3: enum classを使う。
 - I.12: not_nullを使う。
 - ES.46: gslのnarrow_castやnarrowを使う。

### 気になったところ

- レビューにCore Guidelinesへのリンクを使うのよさそう。GoogleでやってるTip of Weekへのリンクと同じ。
- not_nullに関して誰か(Titus?)が問題点を指摘してたけど良く理解できなかった。

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=XkDEzfpdcSg)
- [発表資料@gitub](https://github.com/CppCon/CppCon2017/blob/master/Presentations/10%20Core%20Guidelines%20You%20Need%20to%20Start%20Using%20Now/10%20Core%20Guidelines%20You%20Need%20to%20Start%20Using%20Now%20-%20Kate%20Gregory%20-%20CppCon%202017.pptx)

## Practical Patterns with Networking TS by Michael Caisse

### 概要

- Networking TSの導入

  - Boost.Asioベースだが違いもある。
  - 動的にサイズを変更できる`dynamic_buffer`、`io_servie`ではなく`io_context`。
  - Networking TSは基礎的なライブラリなので、HTTPなどのプロトコルは含んでいない。

- 非同期コードは`shared_from_this`でメモリ管理。
- Boost.MSM/SML（ステートマシン）とBoost.Spirit(パーサ)を組み合わせるとキレイな非同期コードが書けるよ。

### 気になったところ

- 適切なツールを選ぶ。ストリーミングAPIが一番手軽に使える。future/promiseはスレッド間通信。通信プロトコルは状態マシン。
- ステートマシンとパーサは強力。設計を直感的に実装できる。

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=2UC6_rfJuAw&index=85&list=PLHTh1InhhwT6bwIpRk0ZbCA0N2p1taxd6)
- [Boost.MSM](http://www.boost.org/doc/libs/1_65_1/libs/msm/doc/HTML/index.html)
- [Boost.SML(Experimental)](https://github.com/boost-experimental/sml)
- [Boost.Spirit](http://www.boost.org/doc/libs/1_65_1/libs/spirit/doc/html/index.html)

## Make Classes Great Again by Vinnie Falco

### 概要

- Boost.Beastの作者(1.66から入る)
- ユーザがライブラリの挙動を変更できるようにtemplateを使用。Unconstraintedなテンプレートではなくコンセプトを定義。
- コンセプトのドキュメンテーションにはExampler(必要な宣言＆契約のみの型)、またはValid Expressionの表を使用する。

  - 例: Valid Expressionの表

   | Expression | Type | Description |
   | ---------- | ---- | ----------- |
   | B::write | void(ostream&, B::value_type const&) | ストリームに値を書き出す。|
- `enable_if`で、テンプレートに制約を掛ける。

### 気になったところ

- Valid Expressionの表はドキュメントとしては読みやすくて良い。。
- 紹介した`enable_if`の例はあまり綺麗じゃなかった。"Modern C++ Interfaces"の例の方が良い。
- Unconstraintedなテンプレートしか書いて来てなかったので反省。

### 関連情報

- [発表動画@Youtube](https://www.google.co.jp/url?sa=t&rct=j&q=&esrc=s&source=web&cd=4&cad=rja&uact=8&ved=0ahUKEwiH7IGs64rXAhXILpQKHc_6B4cQtwIINzAD&url=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DWsUnnYEKPnI&usg=AOvVaw2frRYfbHFeR2gfX7RBwE_W)
- [発表資料@github](https://github.com/CppCon/CppCon2017/blob/master/Tutorials/Make%20Classes%20Great%20Again/Make%20Classes%20Great%20Again%20-%20Vinnie%20Falco%20-%20CppCon%202017.pdf)
- [Boost.Beast@github](https://github.com/boostorg/beast)

## Postmodern immutable data structures by Juan Pedro Bolivar Puente

### 概要

- Immutable/Persistent Data Structureの紹介。
  - 挿入・削除・要素の編集など変更時に古いバージョンは残しつつ新しいバージョンを作成する。
  - immerライブラリのドキュメンテーションからの抜粋。
  ```cpp
  #include <immer/vector.hpp>
  int main()
  {
    const auto v0 = immer::vector<int>{};
    const auto v1 = v0.push_back(13);// 挿入時にv0に影響しない。
    assert(v0.size() == 0 && v1.size() == 1 && v1[0] == 13);

    const auto v2 = v1.set(0, 42);// 既存の要素を変更しても影響しない。
    assert(v1[0] == 13 && v2[0] == 42);
  }
  ```
- Value Semanticsの問題点は、大量のコピーが必要で性能に影響する。Immutable/Persisntent Data Structureでモデリングすると相性が良い。
- C++向けImmutable/Persistent Data Structureライブラリimmer。
  - IFが標準のSTLコンテナに準拠。
  - immerでは`vector`と`flex_vector`を提供。

### 気になったところ

- 過去のバージョンを保持し続けるImmutable/Persistent Data Structureは、Event Sourcingと通じるものが在る。コマンドを永続化して、コマンドとそれを実行したバージョンの紐付けがあれば、Event Sourcingと同じようなことができるのかな？
- 数GBのファイルを簡単に扱えるewigスゴイ。
- Persistent Data Structureって、オブジェクトが全部オンメモリじゃないと動かないのだろうか。

### 関連情報

- [発表動画@Youtube](https://www.youtube.com/watch?v=sPhpelUfu8Q)
- [immer@github](https://github.com/arximboldi/immer)
- [ewig@github](https://github.com/arximboldi/ewig)
- [Purely Functional Data Structure](https://www.amazon.com/Purely-Functional-Structures-Chris-Okasaki/dp/0521663504)
