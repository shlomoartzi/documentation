---
title: Algorithms
kind: documentation
disable_toc: true
---

## Anomalies

| Function      | Description                                                                                | Example                                                    |
| :----         | :-------                                                                                   | :---------                                                 |
| `anomalies()` | Overlay a gray band on the metric showing the expected behavior of a series based on past. | `anomalies(METRIC_NAME>{*}, '<ALGORITHM>', <BOUNDS>)` |

The `anomalies()` function has two parameters:

* `ALGORITHM`:  Methodology used to detect anomalies.
* `BOUNDS`:  Width of the gray band. `bounds` can be interpreted as the standard deviations for your algorithm; a value of 2 or 3 should be large enough to include most "normal" points.

**Note**: If you are using the agile or robust anomaly detection algorithms with weekly or daily seasonality, you can update your anomaly detection monitor to account for a local timezone using both the API and the UI.

Here's a two-minute video walkthrough:

{{< vimeo 188833506 >}}

See the [Anomaly Monitor][1] page for more info.

## Outliers

| Function     | Description                | Example                                                                    |
| :----        | :-------                   | :---------                                                                 |
| `outliers()` | Highlight outliers series. | `outliers(<METRIC_NAME>{*}, '<ALGORITHM>', <TOLERANCE>, <PERCENTAGE>)` |

The `outliers()` function has three parameters:

* `ALGORITHM`: The outliers algorithm to use.
* `TOLERANCE`: The tolerance of the outliers algorithm.
* `PERCENTAGE`: The percentage of outlying points required to mark a series as an outlier (available only for MAD and scaledMAD algorithms)

{{< img src="graphing/functions/algorithms/outlier.mp4" alt="outlier detection" video="true" responsive="true" width="70%" >}}

See the [Outlier Monitor][2] page for more info.

## Forecast

| Function     | Description                | Example                                                                    |
| :----        | :-------                   | :---------                                                                 |
| `forecast()`  | Predicts where a metric is heading in the future. | `forecast(<METRIC_NAME>{*}, '<ALGORITHM>', <DEVIATIONS>)` |

The `forecast()` function has two parameters:

* `ALGORITHM`: The forecasting algorithm to use - select `linear` or `seasonal`. For more information about these algorithms, see the [Forecast Algorithms][3] section.
* `DEVIATIONS`: The width of the range of forecasted values. A value of 1 or 2 should be large enough to forecast most "normal" points accurately.

A number of the graphing options disappear, as forecasts have a unique visualization. After successfully adding **Forecast**, your editor should show something like this:

{{< img src="monitors/monitor_types/forecasts/query_editor.png" alt="query editor" responsive="true" style="width:80%;">}}

## Other functions

{{< whatsnext desc="Consult the other available functions:" >}}
    {{< nextlink href="/graphing/functions/arithmetic" >}}Arithmetic: Perform Arithmetic operation on your metric.  {{< /nextlink >}}
    {{< nextlink href="/graphing/functions/count" >}}Count: Count non zero or non null value of your metric. {{< /nextlink >}}
    {{< nextlink href="/graphing/functions/interpolation" >}}Interpolation: Fill or set default values for your metric.{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/rank" >}}Rank: Select only a subset of metrics. {{< /nextlink >}}
    {{< nextlink href="/graphing/functions/rate" >}}Rate: Calculate custom derivative over your metric.{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/regression" >}}Regression: Apply some machine learning function to your metric.{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/rollup" >}}Rollup: Control the number of raw points used in your metric. {{< /nextlink >}}
    {{< nextlink href="/graphing/functions/smoothing" >}}Smoothing: Smooth your metric variations.{{< /nextlink >}}
    {{< nextlink href="/graphing/functions/timeshift" >}}Timeshift: Shift your metric data point along the timeline. {{< /nextlink >}}
{{< /whatsnext >}}

[1]: /monitors/monitor_types/anomaly
[2]: /monitors/monitor_types/outlier
[3]: /monitors/monitor_types/forecasts/#forecast-algorithms
