---
title: ベータ関数
kind: documentation
---
ベータ関数は、クエリ用 JSON を直接編集することによって使用できます。

## デフォルトゼロ

| 関数         | 説明                             | 例                          |
| ---------------- | --------------------------------------- | -------------------------------- |
| `default_zero()` | 疎なメトリクスにデフォルト値を追加します。 | `default_zero(system.load.1{*})` |

`default_zero` 関数は、補間 (補間が有効の場合。`GAUGE` タイプのメトリクスの場合はデフォルト) または値 0 を使用して空の間隔を埋めます。大部分の関数と同様に、これは[時間集計と空間集計][1]の**後**に評価されます。

### 使用例

`default_zero` 関数は、次のような使用例に対応します (使用例は他にもあります)。

- 疎なメトリクスに対して算術演算を行う際にゲージを 0 に揃える (注: `as_count()` または `as_rate()` としてクエリされる `COUNT` または `RATE` タイプのメトリクスは、**常に** 0 に揃えられます。したがって、`default_zero` を使用しても揃え方に変更はありません。これは `GAUGE` タイプのメトリクスにのみ影響します)。
- モニターのデータなし状態を解消する。これは、単純なアラートとマルチアラートの両方で機能しますが、値 0 によってモニターがトリガーされてはなりません。たとえば、`avg(last_10m):avg:system.cpu.idle{*} < 10` というクエリを使用したモニターでは正しく機能しません。値が 0 と評価されると、このモニターが (解消ではなく) トリガーされるためです。`as_count()` クエリを使用したエラー率モニターにはこの関数を使用しないでください (詳細については[こちらの記事][2]を参照)。
- (空ではないが) 疎な系列内の空の間隔を埋める。これには、視覚的な理由またはモニター評価で時系列の最小/最大/平均を調整する目的があります。
- クエリ値ウィジェットで、データがない場合に値 0 を表示する。

### 例

`default_zero` 関数の具体的な動作を示すために、以下のような [DogStatsD を使用した][3]カスタムメトリクスに対して単一のポイントが作成されるとします。

≪```
$ echo -n "custom_metric:1|g" | nc -4u -w0 127.0.0.1 8125
```≫

このメトリクスを過去 30 分間クエリすると、タイムスタンプは 1 つです。クエリのロールアップ間隔のうち、1 つにしかポイントがないためです。

≪```
avg:custom_metric{*}

+---------------------+---------------+
| Timestamp           | custom_metric |
+---------------------+---------------+
| ---------           | ---------     |
| 2019-04-17 17:45:00 | 1             |
+---------------------+---------------+
```≫

`default_zero` 関数は、このポイントを前方に 5 分間 (ゲージの補間制限のデフォルト値) 補間してから、残りの空の間隔を 0 で埋めます。

≪```
default_zero(avg:custom_metric{*})

+---------------------+-----------------------------+
| Timestamp           | default_zero(custom_metric) |
+---------------------+-----------------------------+
| ---------           | ---------                   |
| 2019-04-17 17:30:00 | 0                           |
| 2019-04-17 17:31:00 | 0                           |
...
| 2019-04-17 17:44:00 | 0                           |
| 2019-04-17 17:45:00 | 1                           |
| 2019-04-17 17:46:00 | 1                           |
| 2019-04-17 17:47:00 | 1                           |
| 2019-04-17 17:48:00 | 1                           |
| 2019-04-17 17:49:00 | 1                           |
| 2019-04-17 17:50:00 | 1                           |
| 2019-04-17 17:51:00 | 0                           |
| 2019-04-17 17:52:00 | 0                           |
...
+---------------------+-----------------------------+
```≫

## null を除外

| 関数         | 説明                                    | 例                                        |
|------------------|------------------------------------------------|------------------------------------------------|
| `exclude_null()` | グラフまたはトップリストから N/A グループを削除します。 | `exclude_null(avg:system.load.1{*} by {host})` |

## ローリング平均

| 関数          | 説明                                    | 例                           |
|-------------------|------------------------------------------------|-----------------------------------|
| `rollingavg_5()`  | 5 スパンのローリング平均を計算します。  | `rollingavg_5(system.load.1{*})`  |
| `rollingavg_13()` | 13 スパンのローリング平均を計算します。 | `rollingavg_13(system.load.1{*})` |
| `rollingavg_21()` | 21 スパンのローリング平均を計算します。 | `rollingavg_21(system.load.1{*})` |
| `rollingavg_29()` | 29 スパンのローリング平均を計算します。 | `rollingavg_29(system.load.1{*})` |

## その他の関数

{{< whatsnext desc="Consult the other available functions:" >}}
    {{< nextlink href="/graphing/functions/algorithms" >}}アルゴリズム: メトリクスに異常値や外れ値の検出機能を実装します。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/arithmetic" >}}算術: メトリクスに対して算術演算を実行します。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/count" >}}カウント: メトリクスの 0 以外または null 以外の値をカウントします。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/interpolation" >}}補間: メトリクスにデフォルト値を挿入または設定します。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/rank" >}}ランク: メトリクスの一部のみを選択します。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/rate" >}}レート: メトリクスに対してカスタム微分係数を計算します。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/regression" >}}回帰: メトリクスに何らかの機械学習関数を適用します。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/rollup" >}}ロールアップ: メトリクスに使用される元ポイントの数を制御します。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/smoothing" >}}スムーシング: メトリクスの変動を滑らかにします。{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/timeshift" >}}タイムシフト: メトリクスのデータポイントをタイムラインに沿って移動させます。{{< /nextlink >}}
{{< /whatsnext >}}

[1]: /ja/getting_started/from_the_query_to_the_graph/#proceed-to-space-aggregation
[2]: /ja/monitors/guide/as-count-in-monitor-evaluations/
[3]: /ja/developers/dogstatsd/datagram_shell/#sending-metrics