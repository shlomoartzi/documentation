---
title: Processors
kind: documentation
description: "Parse your logs using the Grok Processor"
further_reading:
- link: "logs/processing/pipelines"
  tag: "Documentation"
  text: "Discover Datadog Pipelines"
- link: "logs/logging_without_limits"
  tag: "Documentation"
  text: "Logging without limit"
- link: "logs/explorer"
  tag: "Documentation"
  text: "Learn how to explore your logs"
---

{{< img src="logs/processing/processors/processors_overview.png" alt="original log" responsive="true">}}

A Processor executes within a [pipeline][1] a data-structuring action ([Remapping an attribute](#remapper), [Grok parsing](#grok-parser)...) on a log.

The different kinds of Processors are explained below.

## Grok Parser

Create custom grok rules to parse the full message or a specific attribute of your raw event. For more information, see the [parsing section][2].

{{< tabs >}}
{{% tab "UI" %}}

Define the Grok processor in the [Datadog Log configuration page][1]:

{{< img src="logs/processing/processors/parser.png" alt="Parser" responsive="true" style="width:80%;" >}}


[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Grok parser JSON payload:

```json
{
"type": "grok-parser",
"name": "Parsing Log message",
"enabled": true,
"source": "message",
"grok": {
    "supportRules": "<SUPPORT_RULES>",
    "matchRules":"<MATCH_RULES>"
    }
}
```

| Parameter           | Type             | Required | Description                                             |
| ------              | -----            | -------- | -----                                                   |
| `type`              | String           | yes      | Type of the processor.                                  |
| `name`              | String           | no       | Name of the processor.                                  |
| `enabled`           | Boolean          | no       | If the processors is enabled or not, default: `false`.  |
| `sources`           | Array of Strings | yes      | Name of the log attribute to parse, default: `message`. |
| `grok.supportRules` | String           | yes      | List of Support rules for your grok parser.             |
| `grok.matchRules`   | String           | yes      | List of Match rules for your grok parser.               |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Log Date Remapper

As Datadog receives logs, it timestamps them using the value(s) from any of these default attributes:

* `timestamp`
* `date`
* `_timestamp`
* `Timestamp`
* `eventTime`
* `published_date`

If your logs put their dates in an attribute not in this list, use the log date Remapper Processor to define their date attribute as the official log timestamp:

<div class="alert alert-info">
The recognized date formats are: <a href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO8601</a>, <a href="https://en.wikipedia.org/wiki/Unix_time">UNIX (the milliseconds EPOCH format)</a>, and <a href="https://www.ietf.org/rfc/rfc3164.txt">RFC3164</a>.
</div>

**Note**:

* If your logs don't contain any of the default attributes and you haven't defined your own date attribute, Datadog timestamps the logs with the date it received them.
* If multiple log date remapper processors can be applied to a given log, only the first one (according to the pipelines order) is taken into account.

{{< tabs >}}
{{% tab "UI" %}}

Define the Log Date remapper processor in the [Datadog Log configuration page][1]:

{{< img src="logs/processing/processors/log_date_remapper.png" alt="Log date Remapper" responsive="true" style="width:80%;" >}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Log Date Remapper JSON payload:

```json
{
    "type": "date-remapper",
    "name": "Define <SOURCE_ATTRIBUTE> as the official Date of the log",
    "enabled": false,
    "sources": ["<SOURCE_ATTRIBUTE_1>"]
}
```

| Parameter | Type             | Required | Description                                           |
| ------    | -----            | -------- | -----                                                 |
| `type`    | String           | yes      | Type of the processor.                                |
| `name`    | String           | no       | Name of the processor.                                |
| `enabled` | Boolean          | no       | If the processors is enabled or not, default: `false` |
| `sources` | Array of Strings | yes      | Array of source attributes.                           |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Log Status Remapper

Use this Processor if you want to assign some attributes as the official status. For example, it can transform this log:

{{< img src="logs/processing/processors/log_pre_severity.png" alt=" Log pre severity " responsive="true" style="width:40%;">}}

Into this log:

{{< img src="logs/processing/processors/log_post_severity_bis.png" alt=" Log post severity bis" responsive="true" style="width:40%;" >}}

Each incoming status value is mapped as follows:

* Integers from 0 to 7 map to the [Syslog severity standards][3]
* Strings beginning with **emerg** or **f** (case-insensitive) map to **emerg (0)**
* Strings beginning with **a** (case-insensitive) map to **alert (1)**
* Strings beginning with **c** (case-insensitive) map to **critical (2)**
* Strings beginning with **err** (case-insensitive) map to **error (3)**
* Strings beginning with **w** (case-insensitive) map to **warning (4)**
* Strings beginning with **n** (case-insensitive) map to **notice (5)**
* Strings beginning with **i** (case-insensitive) map to **info (6)**
* Strings beginning with **d**, **trace** or **verbose** (case-insensitive) map to **debug (7)**
* Strings beginning with **o** or matching **OK** or **Success** (case-insensitive) map to **OK**
* All others map to **info (6)**

**Note**: If multiple log status remapper processors can be applied to a given log, only the first one (according to the pipelines order) is taken into account.

{{< tabs >}}
{{% tab "UI" %}}

Define the Log status remapper processor in the [Datadog Log configuration page][1]:

{{< img src="logs/processing/processors/severity_remapper_processor_tile.png" alt="Severity Remapper Processor tile" responsive="true" style="width:80%;" >}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Log Status Remapper JSON payload:

```json
{
   "type": "status-remapper",
   "name": "Define <SOURCE_ATTRIBUTE> as the official status of the log",
   "enabled": true,
   "sources": ["<SOURCE_ATTRIBUTE>"]
}
```

| Parameter | Type             | Required | Description                                           |
| ------    | -----            | -------- | -----                                                 |
| `type`    | String           | yes      | Type of the processor.                                |
| `name`    | String           | no       | Name of the processor.                                |
| `enabled` | Boolean          | no       | If the processors is enabled or not, default: `false` |
| `sources` | Array of Strings | yes      | Array of source attributes.                           |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Service Remapper

Use this processor if you want to assign one or more attributes as the official service.

**Note**: If multiple service remapper processors can be applied to a given log, only the first one (according to the pipeline order) is taken into account.

{{< tabs >}}
{{% tab "UI" %}}

Define the Log Service remapper processor in the [Datadog Log configuration page][1]:

{{< img src="logs/processing/processors/service_remapper_processor_tile.png" alt="Service Remapper Processor tile" responsive="true" style="width:80%;" >}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Log Service Remapper JSON payload:

```json
{
   "type": "service-remapper",
   "name": "Define <SOURCE_ATTRIBUTE> as the official log service",
   "enabled": true,
   "sources": ["<SOURCE_ATTRIBUTE>"]
}
```

| Parameter | Type             | Required | Description                                           |
| ------    | -----            | -------- | -----                                                 |
| `type`    | String           | yes      | Type of the processor.                                |
| `name`    | String           | no       | Name of the processor.                                |
| `enabled` | Boolean          | no       | If the processors is enabled or not, default: `false` |
| `sources` | Array of Strings | yes      | Array of source attributes.                           |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Log Message Remapper

The message is a key attribute in Datadog. It is displayed in the message column of the Log Explorer and you can do full string search on it. Use this Processor to define one or more attributes as the official log message.

**Note**: If multiple log message remapper processors can be applied to a given log, only the first one (according to the pipeline order) is taken into account.

{{< tabs >}}
{{% tab "UI" %}}

Define the Log Message remapper processor in the [Datadog Log configuration page][1]:

{{< img src="logs/processing/processors/message_processor.png" alt="Message Processor" responsive="true" style="width:80%;">}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Log service remapper JSON payload:

```json
{
   "type": "message-remapper",
   "name": "Define <SOURCE_ATTRIBUTE> as the official message of the log",
   "enabled": true,
   "sources": ["msg"]
}
```

| Parameter | Type             | Required | Description                                           |
| ------    | -----            | -------- | -----                                                 |
| `type`    | String           | yes      | Type of the processor.                                |
| `name`    | String           | no       | Name of the processor.                                |
| `enabled` | Boolean          | no       | If the processors is enabled or not, default: `false` |
| `sources` | Array of Strings | yes      | Array of source attributes, default: `msg`            |


[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Remapper

The remapper processor remaps any source attribute(s) or tag to another target attribute or tag. It can transforms this log:

{{< img src="logs/processing/processors/attribute_pre_remapping.png" alt="attribute pre remapping " responsive="true" style="width:40%;">}}

Into this log:

{{< img src="logs/processing/processors/attribute_post_remapping.png" alt="attribute post remapping " responsive="true" style="width:40%;">}}

Constraints on the tag/attribute name are explained in the [Tag Best Practice documentation][4]. Some additional constraints are applied as `:` or `,` are not allowed in the target tag/attribute name.

{{< tabs >}}
{{% tab "UI" %}}

Define the Log message remapper processor in the [Datadog Log configuration page][1]. For example, here, it remaps `user` to `user.firstname`

{{< img src="logs/processing/processors/attribute_remapper_processor_tile.png" alt="Attribute Remapper Processor tile" responsive="true" style="width:80%;" >}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Log Service Remapper JSON payload:

```json
{
    "type": "attribute-remapper",
    "name": "Define <SOURCE_ATTRIBUTE> as the official message of the log",
    "enabled": true,
    "sourceType": "attribute",
    "sources": ["<SOURCE_ATTRIBUTE>"],
    "target": "<TARGET_ATTRIBUTE",
    "targetType": "tag",
    "preserveSource": false,
    "overrideOnConflict": false
}
```

| Parameter            | Type             | Required | Description                                                                    |
| ------               | -----            | -------- | -----                                                                          |
| `type`               | String           | yes      | Type of the processor.                                                         |
| `name`               | String           | no       | Name of the processor.                                                         |
| `enabled`            | Boolean          | no       | If the processors is enabled or not, default: `false`                          |
| `sourceType`         | String           | no       | Defines if the sources are from log `attribute` or `tag`, default: `attribute` |
| `sources`            | Array of Strings | yes      | Array of source attributes or tags                                             |
| `target`             | String           | yes      | Final attribute or tag name to remap the sources to.                           |
| `targetType`         | String           | no       | Defines if the target is a log `attribute` or a `tag`, default: `attribute`    |
| `preserveSource`     | Boolean          | no       | Remove or preserve the remapped source element, default: `false`               |
| `overrideOnConflict` | Boolean          | no       | Override or not the target element if already set, default: `false`            |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## URL Parser

This Processor extracts query parameters and other important parameters from a URL. When setup, the following attributes are produced:

{{< img src="logs/processing/processors/url_processor.png" alt="Url Processor" responsive="true" style="width:80%;" >}}

{{< tabs >}}
{{% tab "UI" %}}

Define the URL parser processor in the [Datadog Log configuration page][1]:

{{< img src="logs/processing/processors/url_processor_tile.png" alt="Url Processor Tile" responsive="true" style="width:80%;" >}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

```json
{
    "type": "url-parser",
    "name": "Parse the URL from http.url attribute.",
    "enabled": true,
    "sources": ["http.url"],
    "target": "http.url_details"
}
```

| Parameter | Type             | Required | Description                                                                                                          |
| ------    | -----            | -------- | -----                                                                                                                |
| `type`    | String           | yes      | Type of the processor.                                                                                               |
| `name`    | String           | no       | Name of the processor.                                                                                               |
| `enabled` | Boolean          | no       | If the processors is enabled or not, default: `false`                                                                |
| `sources` | Array of Strings | no       | Array of source attributes, default: `http.url`                                                                      |
| `target`  | String           | yes      | Name of the parent attribute that contains all the extracted details from the `sources`, default: `http.url_details` |

{{% /tab %}}
{{< /tabs >}}

## User-Agent parser

The User-Agent parser takes a User-Agent attribute and extracts the OS, browser, device, and other user data. It recognizes major bots like the Google Bot, Yahoo Slurp, and Bing. When set up, the following attributes are produced:

{{< img src="logs/processing/processors/useragent_processor.png" alt="Useragent Processor" responsive="true" style="width:80%;">}}

**Note**: If your logs contain encoded User-Agents (for example, IIS logs), configure this Processor to **decode the URL** before parsing it.

{{< tabs >}}
{{% tab "UI" %}}

Define the User-Agent processor in the [Datadog Log configuration page][1]:

{{< img src="logs/processing/processors/useragent_processor_tile.png" alt="Useragent Processor tile" responsive="true" style="width:80%;" >}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following User-Agent parser JSON payload:

```json
{
    "type": "user-agent-parser",
    "name": "Parses <SOURCE_ATTRIBUTE> to extract all its User-Agent information",
    "enabled": true,
    "sources": ["http.useragent"],
    "target": "http.useragent_details",
    "encoded": false
}
```

| Parameter | Type             | Required | Description                                                                                                                |
| ------    | -----            | -------- | -----                                                                                                                      |
| `type`    | String           | yes      | Type of the processor.                                                                                                     |
| `name`    | String           | no       | Name of the processor.                                                                                                     |
| `enabled` | Boolean          | no       | If the processors is enabled or not, default: `false`.                                                                      |
| `sources` | Array of Strings | no       | Array of source attributes, default: `http.useragent`.                                                                      |
| `target`  | String           | yes      | Name of the parent attribute that contains all the extracted details from the `sources`, default: `http.useragent_details`. |
| `encoded` | Boolean          | no       | Define if the source attribute is url encoded or not, default: `false`.                                                     |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Category Processor

Use the Category Processor to add a new attribute (without spaces or special characters in the new attribute name) to a log matching a provided search query.
Use categories to create groups for an analytical view (for example, URL groups, machine groups, environments, and response time buckets).

**Note**: The query can be done on any log attribute or tag, whether it is a facet or not. Wildcards can also be used inside your query.
Once the log has matched one of the Processor queries, it stops. Make sure they are properly ordered in case a log could match several queries.

{{< tabs >}}
{{% tab "UI" %}}

Define the Category Processor in the [Datadog Log configuration page][1]. For example, to categorize your web access logs based on the status code range value (2xx for a response code between 200 and 299, 3xx for a response code between 300 and 399, ...) add this Processor:

{{< img src="logs/processing/processors/category_processor.png" alt="Category Processor" responsive="true" style="width:80%;" >}}

It produces the following result:

{{< img src="logs/processing/processors/category_processor_result.png" alt="Category Processor result" responsive="true" style="width:80%;" >}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Category processor JSON payload:

```json
{
   "type": "category-processor",
   "name": "Assign a custom value to the <TARGET_ATTRIBUTE> attribute",
   "enabled": true,
   "categories": [
      {
         "filter": {
            "query": "<QUERY_1>"
         },
         "name": "<VALUE_TO_ASSIGN_1>"
      },
      {
         "filter": {
            "query": "<QUERY_2>"
         },
         "name": "<VALUE_TO_ASSIGN_2>"
      }
   ],
   "target": "<TARGET_ATTRIBUTE>"
}
```

| Parameter    | Type            | Required | Description                                                                                                |
| ------       | -----           | -------- | -----                                                                                                      |
| `type`       | String          | yes      | Type of the processor.                                                                                     |
| `name`       | String          | no       | Name of the processor.                                                                                     |
| `enabled`    | Boolean         | no       | If the processors is enabled or not, default: `false`                                                      |
| `categories` | Array of Object | yes      | Array of filters to match or not a log and their corresponding `name` to assign a custom value to the log. |
| `target`     | String          | yes      | Name of the target attribute which value is defined by the matching category.                              |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Arithmetic processor

Use the Arithmetic Processor to add a new attribute (without spaces or special characters in the new attribute name) to a log with the result of the provided formula.
This enables you to remap different time attributes with different units into a single attribute, or to compute operations on attributes within the same log.

The formula can use parentheses and the basic arithmetic operators: `-`, `+`, `*`, `/`.

By default, the calculation is skipped if an attribute is missing. Select "Replace missing attribute by 0" to automatically populate missing attribute values with 0 to ensure that the calculation is done.
An attribute is missing if it is not found in the log attributes, or if it cannot be converted to a number.

**Notes**:

* The operator `-` needs to be space split in the formula as it can also be contained in attribute names.
* If the target attribute already exists, it is overwritten by the result of the formula.
* Results are rounded up to the 9th decimal. For example, if the result of the formula is `0.1234567891`, the actual value stored for the attribute is `0.123456789`.

{{< tabs >}}
{{% tab "UI" %}}

Define the Arithmetic Processor in the [Datadog Log configuration page][1]:

{{< img src="logs/processing/processors/arithmetic_processor.png" alt="Arithmetic Processor" responsive="true" style="width:80%;">}}


[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Trace remapper JSON payload:

```json
{
    "type": "arithmetic-processor",
    "name": "<PROCESSOR_NAME>",
    "enabled": true,
    "expression": "<ARITHMETIC_OPERATION>",
    "target": "<TARGET_ATTRIBUTE>",
    "replaceMissing": false
}
```

| Parameter        | Type    | Required | Description                                                                                                                                 |
| ------           | -----   | -------- | -----                                                                                                                                       |
| `type`           | String  | yes      | Type of the processor.                                                                                                                      |
| `name`           | String  | no       | Name of the processor.                                                                                                                      |
| `enabled`        | Boolean | no       | If the processors is enabled or not, default: `false`.                                                                                       |
| `expression`     | String  | yes      | Arithmetic operation between one or more log attributes.                                                                                    |
| `target`         | String  | yes      | Name of the attribute that contains the result of the arithmetic operation.                                                                 |
| `replaceMissing` | Boolean | no       | If `true`, it replaces all missing attributes of `expression` by 0, `false` skip the operation if an attribute is missing. Default: `false`. |


[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## GeoIP Parser

The GeoIP parser takes an IP address attribute and extracts if available the Continent, Country, Subdivision, and City information in the target attribute path.

{{< tabs >}}
{{% tab "UI" %}}

{{< img src="logs/processing/processors/geoip_processor.png" alt="GeoIP Processor" responsive="true" style="width:80%;">}}

Most elements contains a `name` and `iso_code` (or `code` for continent) attribute. `subdivision` is the first level of subdivision that the country uses such as "States" for the United States or "Departments" for France.

Find below an example of the GeoIP Parser that extracts gelocation from the `network.client.ip` attribute and stores it into the `network.client.geoip` attribute:

{{< img src="logs/processing/processors/geoip_example.png" alt="GeoIP example" responsive="true" style="width:60%;">}}

**Note**: This processor uses GeoLite2 data created by [MaxMind][1].

[1]: https://www.maxmind.com
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Trace remapper JSON payload:

```json
{
    "type": "geo-ip-parser",
    "name": "Parse the geolocation elements from network.client.ip attribute.",
    "enabled": true,
    "sources": ["network.client.ip"],
    "target": "network.client.geoip"
}
```

| Parameter | Type             | Required | Description                                                                                                              |
| ------    | -----            | -------- | -----                                                                                                                    |
| `type`    | String           | yes      | Type of the processor.                                                                                                   |
| `name`    | String           | no       | Name of the processor.                                                                                                   |
| `enabled` | Boolean          | no       | If the processors is enabled or not, default: `false`                                                                    |
| `sources` | Array of Strings | no       | Array of source attributes, default: `network.cient.ip`                                                                  |
| `target`  | String           | yes      | Name of the parent attribute that contains all the extracted details from the `sources`, default: `network.client.geoip` |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Trace Remapper

There are two ways to improve correlation between application traces and logs:

1. Follow the documentation on [how to inject a trace id in the application logs][5] and by default log integrations take care of all the rest of the setup.

2. Use the Trace remapper processor to define a log attribute as its associated trace ID.

{{< tabs >}}
{{% tab "UI" %}}

Define the Trace remapper processor in the [Datadog Log configuration page][1]. Enter the Trace ID attribute path in the Processor tile as follows:

{{< img src="logs/processing/processors/trace_processor.png" alt="Trace Id Processor" responsive="true" style="width:80%;">}}

[1]: https://app.datadoghq.com/logs/pipelines
{{% /tab %}}
{{% tab "API" %}}

Use the [Datadog Log Pipeline API endpoint][1] with the following Trace remapper JSON payload:

```json
{
   "type": "trace-id-remapper",
   "name": "Define dd.trace_id as the official trace id associate to this log",
   "enabled": true,
   "sources": ["dd.trace_id"]
}
```

| Parameter | Type             | Required | Description                                           |
| ------    | -----            | -------- | -----                                                 |
| `type`    | String           | yes      | Type of the processor.                                |
| `name`    | String           | no       | Name of the processor.                                |
| `enabled` | Boolean          | no       | If the processors is enabled or not, default: `false`. |
| `sources` | Array of Strings | no       | Array of source attributes, default: `http.useragent`. |

[1]: /api/?lang=bash#logs-pipelines
{{% /tab %}}
{{< /tabs >}}

## Further Reading

{{< partial name="whats-next/whats-next.html" >}}
[1]: /logs/processing/pipelines
[2]: /logs/processing/parsing
[3]: https://en.wikipedia.org/wiki/Syslog#Severity_level
[4]: /logs/guide/log-parsing-best-practice
[5]: /tracing/advanced/connect_logs_and_traces
