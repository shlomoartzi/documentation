---
title: Datadog Data Collection, Resolution, and Retention
kind: faq
---

Find below a summary of Datadog data collection, resolution, and retention:

| Source                       | Collection Methods                                                    | Collection interval | Minimum Resolution | Default Retention                       | Product Category |
| ----                         | ----                                                                  | ----                | ----               | ----                                    | ----             |
| System metrics               | Datadog Agent                                                         | 15 secs             | 1 s                | 15 months                               | Infrastructure   |
| Agent integrations           | Datadog Agent + enabled integrations                                  | 15 secs             | 1 s                | 15 months                               | Infrastructure   |
| Live Containers              | Datadog Agent + enabled Docker integration or Datadog container Agent | 2 secs              | 1 s                | 36 hours                                | Infrastructure   |
| Live Processes               | Datadog Agent + Process Agent                                         | 2 secs              | 1 s                | 36 hours                                | Infrastructure   |
| Custom Metrics (Agent check) | Datadog Agent + custom Agent check                                    | 15 secs             | 1 s                | 15 months                               | Infrastructure   |
| Custom Metrics (StatsD)      | Datadog Agent (built-in statsD collector)                             | 15 secs             | 1 s                | 15 months                               | Infrastructure   |
| Custom Metrics (API)         | POST directly to Datadog's API                                        | Real time           | 1 s                | 15 months                               | Infrastructure   |
| Events                       | Datadog Agent, integrations, or API                                   | Real time           | 1 s                | 15 months                               | Infrastructure   |
| Traces (Sampled)             | Datadog Agent + tracing library                                       | Real time           | 1 micro sec        | [See traces retention documentation][1] | APM              |
| Trace Metrics (Unsampled)    | Datadog Agent + tracing library                                       | Real time           | 1 micro sec        | 15 months                               | APM              |
| APM Events (Unsampled)     | Datadog Agent + tracing library + enabled logs                        | Real time           | 1 micro sec        | 2 Weeks                                 | APM + Logs       |
| Logs                         | Datadog Agent + Logs, 3rd party log collectors, or API                | Real time           | 1 micro sec        | Plan                                    | Logs             |
| API Test metrics             | Datadog Synthetics application                                        | User-defined        | 1 min              | 15 months                               | Synthetics       |
| API Test results             | Datadog Synthetics application                                        | User-defined        | 1 min              | Result seen in the UI by user: 15 months <br/> Failed result not seen in the UI by user: 1 month <br/> Successful result not seen in the UI by user: 15 days                 | Synthetics       |
| Browser Test metrics         | Datadog Synthetics application                                        | User-defined        | 5 min              | 15 months                               | Synthetics       |
| Browser Test results         | Datadog Synthetics application                                        | User-defined        | 5 min              | Result seen in the UI by user: 15 months <br/> Failed result not seen in the UI by user: 1 month <br/> Successful result not seen in the UI by user: 15 days                 | Synthetics       |


[1]: /tracing/guide/trace_sampling_and_storage
