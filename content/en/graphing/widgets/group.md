---
title: Group Widget
kind: documentation
description: "Group your widgets together in a Timeboard."
further_reading:
- link: "graphing/dashboards/timeboard/"
  tag: "Documentation"
  text: "Timeboards"
- link: "graphing/graphing_json/"
  tag: "Documentation"
  text: "Building Dashboard using JSON"
---

The groups widget allows you to keep similar graphs together on your [timeboard][1]. Each group has a custom header, can hold one to many graphs, and is collapsible:

{{< img src="graphing/widgets/group/group.mp4" alt="Group Widget" video="true" responsive="true" >}}

## Setup

Choose a name for your group by using the cog icon in the upper right corner of your group.

## API
The dedicated [widget JSON schema definition][2] for the change widget is:

```
GROUP_SCHEMA = {
    "type": "object",
    "properties": {
        "type": {"enum": ["group"]},
        "layout_type": {"enum": ["ordered"]},
        "widgets": {
            "type": "array",
            "items": {
                "type": "object",
                "properties": {
                    "definition": {
                        "oneOf": [WIDGET_DEFINITION]
                    },
                    "id": {"type": "integer"}
                },
                "required": ["definition"],
                "additionalProperties": false
            }
        },
        "title": {"type": "string"}
    },
    "required": ["type", "layout_type", "widgets"],
    "additionalProperties": false
}
```

| Parameter     | Type             | Required | Description                                                                                                                                             |
| ------        | -----            | -------- | -----                                                                                                                                                   |
| `type`        | string           | yes      | Type of widget, for the group widget use `group`.                                                                                                   |
| `widgets`     | array of objects | yes      | List of widgets that belong to the group widget. See the dedicated [Widget JSON schema documentation][3] to learn how to build the `WIDGET_DEFINITION`. |
| `layout_type` | string           | yes      | Layout type of the group, value available is `ordered`                                                                                                  |
| `title`       | string           | no       | Title of your widget.                                                                                                                                   |


## Further Reading

{{< partial name="whats-next/whats-next.html" >}}

[1]: /graphing/dashboards/timeboard
[2]: /graphing/graphing_json/widget_json
[3]: /graphing/graphing_json/widget_json
