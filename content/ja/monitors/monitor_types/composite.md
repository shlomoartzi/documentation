---
title: 複合条件モニター
kind: documentation
aliases:
  - /ja/guides/composite_monitors
description: 複数のモニターを組み合わせた式に対してアラートする
further_reading:
  - link: monitors/notifications
    tag: Documentation
    text: モニター通知の設定
  - link: monitors/downtimes
    tag: Documentation
    text: モニターをミュートするダウンタイムのスケジュール
  - link: monitors/monitor_status
    tag: Documentation
    text: モニターステータスの参照
---
複合条件モニターは、個別モニターを組み合わせて 1 つのモニターにし、さらに詳細なアラート条件を定義します。

複合条件モニターを作成するには、まず、既存のモニターをいくつか選択します。たとえば、モニター A とモニター B とします。次に、ブール演算子を使用してトリガー条件を設定します (例: "A && B")。複合条件モニターは、個別モニターのステータスが、複合条件のトリガー条件を True にするような値を同時に持ったときにトリガーします。

構成に関して、複合条件モニターはそれを構成するモニターに依存しません。複合条件モニターの通知ポリシーは、それを構成するモニターのポリシーに影響することなく変更できます。その逆も同様です。さらに、複合条件モニターを削除しても、それを構成するモニターは削除されません。複合条件モニターは他のモニターを所有せずに、その結果を使用するだけです。複数の複合条件モニターが同じ個別モニターを参照することもあります。

**注**: '個別モニター'、'構成するモニター'、'非複合条件モニター' というさまざまな呼び方をしていますが、これらはどれも同じ意味です。つまり、複合条件モニターがステータスを計算するために使用するモニターのことです。

## 複合条件モニターの作成

Datadog アプリケーションで、[**New Monitor**][1] ページに移動し、モニターの種類のリストで **Composite** をクリックします。

{{< img src="monitors/monitor_types/composite/select-monitor-type.png" alt="select monitor type" responsive="true" >}}

### 個別モニターを選択する

新しい複合条件モニターで使用する個別モニターを最大 10 個まで選択できます。異なるアラートタイプのモニターでもかまいません。シンプルアラートのみ、マルチアラートのみ、または両方の組み合わせも可能です。複合条件モニターを個別モニターとして使用することはできません。

1 つ目のモニターを選択すると、そのアラートタイプと現在のステータスが UI に表示されます。

{{< img src="monitors/monitor_types/composite/create-composite-2.png" alt="create composite 2" responsive="true" style="width:80%;">}}

マルチアラートモニターを選択した場合は、その group-by 節 (例: `host`) と、現在報告している一意のソースの数 (この場合はホストの数) が UI に表示されます。複数のマルチアラートモニターを組み合わせる場合は、この情報があると自然にペアになるモニターの選択に役立ちます。たいていの場合、group-by 節が同じモニターどうしを選択することになるためです。そうでなければ、この複合条件モニターはトリガーすることがないという警告が UI に表示されます。

{{< img src="monitors/monitor_types/composite/create-composite-4.png" alt="create composite 4" responsive="true" style="width:80%;">}}

group-by 節が同じマルチアラートモニターを選択した場合でも、その選択について警告が表示される場合があります。次のスクリーンショットでは、両方のモニターが `host` でグループ化されています。

{{< img src="monitors/monitor_types/composite/create-composite-5.png" alt="create composite 5" responsive="true" style="width:80%;">}}

group-by 節は合っているのに 'Group Matching Error' が表示されているため、現時点で、これらのモニターは共通の報告元ソース (共通のグルーピングとも呼ばれます) を持っていないと考えられます。共通の報告元ソースがない限り、Datadog は複合条件モニターのステータスを計算できないため、トリガーすることはありません。ただし、警告を無視してとりあえずモニターを作成することは可能です。その理由については、[この記事の後半を参照してください](#how-composite-monitors-select-common-reporting-sources)。

警告が表示されないように 2 つ目のモニターを選択すると、**Trigger when** フィールドにデフォルトのトリガー条件 `a && b` が挿入され、提案された複合条件モニターのステータスが表示されます。

{{< img src="monitors/monitor_types/composite/create-composite-3.png" alt="create composite 3"  responsive="true" style="width:80%;">}}

### トリガー条件を設定する

**Trigger when** フィールドに、ブール演算子を使用して目的のトリガー条件を記述します。個別モニターは、フォーム内のラベル (a、b、c、など) で識別されます。括弧を使用して演算子の優先度を制御すると、複雑な条件を作成できます。

以下はどれも有効なトリガー条件です。

```
!(a && b)
a || b && !c
(a || b) && (c || d)
```

複合条件モニターの New Monitor フォームと Edit フォームの外では、個別モニターはそれぞれの数値 ID によって示されます。

{{< img src="monitors/monitor_types/composite/composite-status.png" alt="composite status" responsive="true" style="width:80%;">}}

API では、複合条件モニターのトリガー条件はクエリと呼ばれます。非複合条件モニターのクエリはさまざまな要素 (メトリクス、タグ、`avg` などの集計関数、group-by 節など) をカプセル化できますが、複合条件モニターのクエリは、それを構成するモニターによって定義されるトリガー条件です。

たとえば、次のようなクエリからなる 2 つの非複合条件モニターがあるとします。

```
"avg(last_1m):avg:system.mem.free{role:database} < 2147483648" # monitor ID: 1234
"avg(last_1m):avg:system.cpu.system{role:database} > 50" # monitor ID: 5678
```

複合条件モニターのクエリは、`"1234 && 5678"`、`"!1234 || 5678"` などになります。

### `No Data` に対する動作を構成する

非複合条件モニターと同様に、複合条件モニターが `No Data` ステータスの場合にトリガーするかどうかを構成することができます。ここでの選択は、構成するモニターの `notify_no_data` 設定に影響しません。

### 通知メッセージを記述する

他のモニターの場合と同様に、`@ 構文` (例: `@you@example.com`) を使用して、個人またはチームに送る通知メッセージを記述します。

{{< img src="monitors/monitor_types/composite/writing-notification.png" alt="writing notification" responsive="true" style="width:80%;">}}

モニターメッセージに `{{a.value}}`、`{{b.value}}` などのテンプレート変数を追加すると、個別モニターの値を表示できます。


### モニターを保存する

その他のオプションを設定したら、**Save** をクリックします。選択したオプションは複合条件モニターにのみ影響し、それを構成するモニターには影響しないことに注意してください。

## 複合条件モニターの仕組み

このセクションでは、いくつかのサンプルを使用してトリガー条件が計算される方法と、さまざまなシナリオでどの程度のアラートを受け取るかについて説明します。

### トリガー条件が計算される方法

Datadog は `A && B && C` をこのとおりに計算しますが、どのモニターステータスを true と見なし、どれを false と見なすのでしょうか。

モニターには次の 6 つのステータスがあります (重大度の低い順から)。

* `Ok`、
* `Warn`、
* `Alert`、
* `Skipped`、
* `No Data`、
* `Unknown`。

複合条件モニターは `Unknown`、`Warn`、`Alert` をアラート対象 (true) と見なします。残りの `Ok`、`Skipped`、`No Data` は非アラート対象です (false)。ただし、`notify_no_data` を true に設定することで、`No Data` をアラート対象にするようにモニターを構成することができます。

複合条件モニターがアラート対象と評価する場合は、個別モニターの中で重大度が最高のステータスを継承し、アラートをトリガーします。複合条件モニターが非アラート対象と評価する場合は、重大度が**最低**のステータスを継承します。
not (!) 演算子は、ステータス (個別または複合条件) を `Ok`、`Alert`、または `No Data` のいずれかに変更します。モニター A がいずれかのアラート対象ステータスである場合、`!A` は `OK` になります。モニター A がいずれかの**非**アラート対象ステータスである場合、`!A` は `Alert` になります。モニター A が `No Data` ステータスである場合は、`!A` も `No Data` になります。

3 つの個別モニター A、B、C とトリガー条件 `A && B && C` を使用する複合条件モニターを考えます。次の表は、個別モニターにさまざまなステータスが与えられた場合の複合条件モニターの結果ステータスです。アラート対象かどうかは、T または F で示されます。

| モニター A   | モニター B  | モニター C  | 複合条件ステータス        | アラートがトリガーされるか? |
|-------------|------------|------------|-------------------------|-------------------------|
| Unknown (T) | Warn (T)   | Unknown (T)| Warn (T)                |<i class="fa fa-check" aria-hidden="true"></i>
| Skipped (F) | Ok (F)     | Unknown (T)| Ok (F)                  |
| Alert (T)   | Warn (T)   | Unknown (T)| Alert (T)               |<i class="fa fa-check" aria-hidden="true"></i>
| Skipped (F) | No Data (F)| Unknown (T)| Skipped (F)             |

この 4 つのシナリオのうち 2 つでは、すべての個別モニターが最高の重大度ステータス `Alert` を持っているわけではありませんが (しかも 1 行目にはまったくなし)、アラートがトリガーします。しかし、この複合条件モニターからいくつのアラートを受け取る可能性があるでしょうか。それは、個別モニターのアラートタイプに依存します。

### コンポーネントモニターのステータスの決定方法

複合条件モニターは、コンポーネントモニターの現在の状態を定期的にサンプリングするのではなく、コンポーネントモニターごとのモニター結果のスライディングウィンドウを使用して評価されます (具体的には、コンポーネントモニターごとに過去 5 分間で最高の重大度のステータスを使用)。たとえば、`A && B` と定義された複合条件モニターがあり、コンポーネントの結果が次のようになっているとします (タイムスタンプは 1 分間隔)。

|   | T0    | T1    | T2    |
|---|-------|-------|-------|
| A | Alert | OK    | OK    |
| B | OK    | Alert | Alert |

T1 において `A` は正確には `OK` 状態ですが、この複合条件モニターは T1 でトリガーします。

この動作の正当性は、アラートシステムにとって同時性を定義することが非常に難しい問題であることにあります。モニターはさまざまなスケジュールに従って評価されますが、メトリクスのレイテンシーにより、おそらく同時に発生した 2 つのイベントであっても、モニターが最終的に評価される際には異なる時間に起こる可能性があります。複合条件モニターのアラートは、単に現在の状態をサンプリングするだけでは見逃されてしまう可能性があります。

この動作の結果、コンポーネントモニターが解決してから複合条件モニターが解決するまでに数分かかることがあります。

### 受け取るアラートの数

すべての個別モニターがシンプルアラートなら、複合条件モニターもシンプルアラートタイプになります。A、B、C のクエリがすべて同時に true の場合に、複合条件モニターは 1 つの通知をトリガーします。

個別モニターが 1 つでもマルチアラートなら、複合条件モニターもマルチアラートです。同時にいくつのアラートが送信されるかは、複合条件モニターが使用しているマルチアラートモニターが 1 つか複数かに依存します。

#### マルチアラートモニターが 1 つの場合

モニター A が `host` でグループ化されたマルチアラートモニターというシナリオを考えます。このモニターに報告元ソースが 4 つある場合は (ホスト web01 ～ web04)、Datadog がこの複合条件モニターを評価するたびに、最大 4 つのアラートを受け取る可能性があります。言い換えると、1 回の評価サイクルで Datadog は 4 つのケースを考慮します。ケースごとに、モニター A のステータスはソースによって変わる可能性がありますが、モニター B と C (シンプルアラート) のステータスは変化しません。

前の表では 4 つの時点での複合条件モニターステータスを示していましたが、次の例の表ではマルチアラートの各ケースのステータスを示しています。

{{% table responsive="true" %}}

|source | モニター A    | モニター B| モニター C | 複合条件ステータス (A && B && C) | アラートがトリガーされるか? |
|-------|--------------|----------|-----------|--------------------------------|-------------------------|
| web01 | Alert        | Warn     | Alert     | Alert                          |<i class="fa fa-check" aria-hidden="true"></i>|
| web02 | Ok           | Warn     | Alert     | Ok                             |
| web03 | Warn         | Warn     | Alert     | Alert                          |<i class="fa fa-check" aria-hidden="true"></i>|
| web04 | Skipped      | Warn     | Alert     | Skipped                        |
{{% /table %}}

このサイクルでは、2 つのアラートを受け取ります。

#### 複数のマルチアラートモニター

今度は、モニター B もマルチアラートで、ホストでグループ化されているというシナリオを考えます。1 サイクルあたりのアラート数は、最大でもモニター A とモニター B に共通する報告元ソースの数になります。web01 ～ web05 がモニター A の報告元で、web04 ～ web09 がモニター B の報告元の場合、複合条件モニターは、共通するソース web04 と web05 のみを考慮します。1 回の評価サイクルで、最大 2 つのアラートを受け取る可能性があります。

サイクルの例を挙げます。

|source | モニター A | モニター B | モニター C  | 複合条件ステータス (A && B && C) |アラートがトリガーされるか?|
|-------|-----------|-----------|------------|--------------------------------|----------------|
| web04 | Unknown   | Warn      | Alert      | Alert                          |<i class="fa fa-check" aria-hidden="true"></i>
| web05 | Ok        | Ok        | Alert      | Ok                             |

このサイクルでは、1 つのアラートを受け取ります。

### 複合条件モニターが共通の報告元ソースを選択する方法

上述のように、複数のマルチアラートモニターを使用する複合条件モニターは、個別モニターに共通する報告元ソースのみを考慮します。
上の例の共通ソースは `host:web04` と `host:web05` でした。複合条件モニターはタグの値 (`web04` など) のみを確認し、名前 (`host` など) は確認しないことに注意してください。
上の例に、`environment` によってグループ化されたマルチアラートモニター `D` が含まれ、このモニターが `environment:web04` という 1 つの報告元ソースを持つ場合、複合条件モニターは `web04` を `A`、`B`、`D` の単一の共通報告元ソースと見なしてトリガー条件を計算します。

共通のタグ値を持たずに同じタグ名でグループ化されているマルチアラートモニターを使用して、複合条件モニターを作成できます。これは、共有タグ名が共通の報告元ソースになり得るからです。これらの値は将来一致する可能性があります。そのため、上の例では、`host:web04` と `host:web05` が共通の報告元ソースと見なさます。

たとえば、モニター `A` の `web04` と `web05`、モニター `D` の `dev` と `prod` のように、異なるタグでグループ化された 2 つのモニターが重複する値を持つことはめったにありません。それらが重複する場合は、これらのモニターで構成される複合条件モニターがアラートをトリガーできるようになります。

2 つ以上のタグで分割されたマルチアラートの場合は (例: `host, instance, url` に基づくアラート)、タグの組み合わせ全体が 1 つのモニターグループになります。

たとえば、Monitor 1 が `device,host` に基づくマルチアラート、Monitor 2 が `host` に基づくマルチアラートだとすると、複合条件モニターによって Monitor 1 と Monitor 2 を組み合わせることができます。
{{< img src="monitors/monitor_types/composite/multi-alert-1.png" alt="writing notification" responsive="true" style="width:80%;">}}

ただし、`host,url` に基づくマルチアラート Monitor 3 を考えると、Monitor 1 と Monitor 3 の組み合わせは、グルーピングが大きく異なるために、複合条件の結果にならない可能性があります。
{{< img src="monitors/monitor_types/composite/multi-alert-2.png" alt="writing notification" responsive="true" style="width:80%;">}}

最善の判断で意味のあるマルチアラートモニターを選択してください。

## その他の参考資料
{{< partial name="whats-next/whats-next.html" >}}

[1]: https://app.datadoghq.com/monitors#create