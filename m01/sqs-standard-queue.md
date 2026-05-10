# Commands for Interacting with a Standard SQS Queue

Get the Queue URL from the CLI: 

```bash
aws sqs get-queue-url \
  --region us-west-2 \
  --queue-name myfirstqueue
```

Send a simple message:

```bash
aws sqs send-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/myfirstqueue \
  --message-body "hello world"
```

Send a JSON message:

```bash
aws sqs send-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/myfirstqueue \
  --message-body '{"event":"user_signup","userId":123}'
```

Receive a message:

```bash
aws sqs receive-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/myfirstqueue \
  --max-number-of-messages 1
```

Delete a message:

```bash
aws sqs delete-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/myfirstqueue \
  --receipt-handle "RECEIPT_HANDLE"
```
