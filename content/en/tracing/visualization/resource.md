---
title: Resource Page
kind: documentation
further_reading:
- link: "tracing/setup/"
  tag: "Documentation"
  text: "Learn how to setup APM tracing with your application"
- link: "tracing/visualization/services_list/"
  tag: "Documentation"
  text: "Discover the list of services reporting to Datadog"
- link: "tracing/visualization/service"
  tag: "Documentation"
  text: "Learn more about services in Datadog"
- link: "tracing/visualization/trace"
  tag: "Documentation"
  text: "Understand how to read a Datadog Trace"
---

{{< img src="tracing/visualization/resource/ressource.png" alt="Ressource" responsive="true" >}}

A resource is a particular action for a given service (typically an individual endpoint or query). Read more about resources in [Getting Started with APM][1]. For each resource, APM automatically generates a dashboard page covering:

* Key health metrics
* Monitor status for all monitors associated with this service
* List and metrics for all resources associated with this service

## Out of the box graphs

Datadog provides out of the box graphs for any given resource:

* Requests - Choose to display:
    *  The **Total amount of requests**
    *  The amount of **Requests per second**
* Latency -  Choose to display:
    *  The Avg/p75/p90/p95/p99/Max latency of your traced requests
* Error - Choose to display:
    * The **Total amount of errors**
    * The amount of **Errors per second**
    * The **% Error Rate**
* Sub-Services: When there are multiple services involved, a fourth graph is available that breaks down your **Total time spent**/**%of time spent**/**Avg time per request** of your service by *services* or *type*.

    This represents the total/relative/average time spent by traces from the current service to the other *services* or *type*.

    **Note**: For services like *Postgres* or *Redis*, which are "final" operations that do not call other services, there is no sub-services graph.

{{< img src="tracing/visualization/resource/resource_otb_graphs.png" alt="Out of the bow resource graphs" responsive="true" style="width:90%;">}}

### Export to Timeboard

On the upper-right corner of each graph click on the arrow in order to export your graph into a pre-existing [Timeboard][2]:

{{< img src="tracing/visualization/resource/save_to_timeboard.png" alt="Save to timeboard" responsive="true" style="width:40%;">}}

### Latency distribution

In addition to all those graph there is a resource latency distribution graph:

{{< img src="tracing/visualization/resource/resource_latency_distribution.png" alt="Latency distribution" responsive="true" style="width:90%;">}}

Use the top right selector of this graph to zoom on a given percentile of latency distribution:

{{< img src="tracing/visualization/service/latency_distribution_selector.png" alt="latency distribution selector" responsive="true" style="width:20%;">}}

Zoom on this graph to filter corresponding traces.

## Span Summary

For a given resource, Datadog provides you a span analysis breakdown of all matching traces:

{{< img src="tracing/visualization/resource/span_stats.png" alt="Span statistics" responsive="true" style="width:80%;">}}

The displayed metrics represent, per span:

| Metric            | Description                                                                                             |
| ------            | --------                                                                                                |
| `Avg Span/trace`  | Average number of occurrences of the span, for traces including the current resource, where the span is present at least once. |
| `% of traces`     | Percentage of traces including the current resource where the span is present at least once. |
| `Avg duration`    | Average duration of the span, for traces including the current resource, where the span is present at least once.                |
| `Avg % Exec Time` | Average ratio of execution time for which the span was active, for traces including the current resource, where the span is present at least once. |

**Note**: A span is considered active when it's not waiting for a child span to complete. The active spans at a given time, for a given trace, are all the leaf spans (i.e.: spans without children).


## Traces

Consult the list of traces associated with this resource. Filter/sort this list to see fast/slow and error/non-error traces:

[Refer to the dedicated trace documentation to learn more][3].

{{< img src="tracing/visualization/resource/traces_list.png" alt="Traces list" responsive="true" style="width:90%;">}}

## Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: /tracing/visualization
[2]: /graphing/dashboards/timeboard
[3]: /tracing/visualization/trace
