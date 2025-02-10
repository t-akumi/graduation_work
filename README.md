■サービス概要
「トレンドと管理する日用品」は日用品のストックを管理するだけでなく、
世間の流行や品薄情報を把握することができるサービスです。
トレンドや商品評価の投稿機能を兼ね備え、ユーザーの安定したストック確保や、新たな商品との出会いに貢献します。

⭐️補足
本アプリの「トレンド」とは世間で流行っている商品や品薄商品の傾向を意味し、それらを投稿したり、投稿を閲覧することができる機能がトレンド機能です。
ユーザーが情報を投稿できるトレンドページを設けることにより、他のユーザーが新しい商品の情報を入手したり、品薄状態を把握できれば
余裕をもって在庫を購入したりすることができます。
よって、トレンド機能とはユーザーにより内容を充実させていくものになります。
ストックの管理とトレンドは、データ上では直接関係ないですが、ユーザーが買い物をする際のヒントになります。


■ このサービスへの思い・作りたい理由

私自身が日用品の在庫を管理するのが苦手で手軽に管理できるサービスを使用したいと思っていました。
しかし、在庫管理機能だけのサービスは店舗に行った時に確認する程度で、定期的に開きたいという気持ちにならず、
気づいたらストックがない状態になってしまうことが多々あります。
そこで「X」や「インスタグラム」のように習慣的に利用したくなるサービスの要素を取り入れることで在庫管理が「ついでに」といった感覚で行えるため、
利用に対するハードルを低くできるのではないかと考えました。
在庫管理を無意識にできるようなサービスにしたいです。


■ ユーザー層について

ユーザー層：主婦、独身者
住居への関わりが特に多いと思われる上記のユーザーを対象としました。


■サービスの利用イメージ

利用したい機能（在庫管理機能やトレンド投稿機能）を入り口にして他の機能へも動線を設けることで、
ストック管理に対するユーザーの手間の削減や、新しい商品への発見につながる。
ストック管理については、ストックが１になったものを「そろそろ買い時かも」という項目のページで確認できる。
（ストックは購入頻度に基づき自動で減少するが、手動で減少させることもできる。）
（ストック数が変動した場合、変動した日時と購入頻度から次の購入タイミングを再計算する。）
ストックが複数ある場合は、購入頻度に基づきストックを自動で減少させ、ストック購入した場合はユーザーにより登録してもらう。
また、「そろそろ買い時かも」にリストアップされたものがある場合、メールでメッセージを送信する。（余裕があればLINEを送信先にできるようにする）
ストックが少なくなったタイミングで通知することにより、アプリを開くきっかけができ、アプリの利用を促す。


■ ユーザーの獲得について

管理機能、トレンド機能の２つの軸を活かして双方から利用者を獲得する。
ストック管理サービスを探しているユーザーには使いやすさをアピールする。
トレンド機能では、利用しているユーザーを介して新規ユーザーの獲得を狙う。


■ サービスの差別化ポイント・推しポイント

登録されたストックに普段の購入頻度を登録できるようにし、買うべきタイミングが近づくとリストアップされることで、管理するものの種類が多いユーザーに
とっては利便性が高い。

トレンド機能（投稿機能）で類似サービスとの差別化を図る。



■ 機能候補

MVPリリース時の機能
⭐️ユーザー登録、編集
⭐️ログイン、ログアウト
⭐️在庫管理
　・在庫の登録（名称、カテゴリ、購入スパン、メモ（保管している場所等を記録できる））
　・在庫状況を表示
　・在庫数の処理（非同期）
　・少ない在庫があればメッセージを送信
　・購入頻度に基づく、そろそろ買うべきもののリストアップ
⭐️トレンド
　・投稿の表示
　・投稿の絞り込み、検索（カテゴリや商品名）

本リリース
⭐️ユーザープロフィールの充実
⭐️投稿に対するいいね機能
⭐️ユーザーアカウントをLINEやXと連携


■ 機能の実装方針予定
一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。
gem: sorcery, kaminari, ajax, ransack　を導入
本リリース時に余裕があればLINEとXのAPIを使用。