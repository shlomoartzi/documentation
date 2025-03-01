#!/bin/sh
# Make sure you replace the <DD_API_KEY> and <DD_APP_KEY> key below
# with the ones for your account

api_key=<DD_API_KEY>
app_key=<DD_APP_KEY>

curl -X POST -H "Content-type: application/json" \
-d '{
        "account_id": "<AWS_ACCOUNT_ID>",
        "lambda_arn": "arn:aws:lambda:us-east-1:123456789012:function:PushLogs"
    }'\
"https://api.datadoghq.com/api/v1/integration/aws/logs?api_key=${api_key}&application_key=${app_key}"