# Commands for Interacting with a DQL

Send a simple message:

```bash
aws sqs send-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/my-fifo-queue.fifo \
  --message-body "hello fifo" \
  --message-group-id "group-1" \
  --message-deduplication-id "msg-1"
```

Receive the message:

```
aws sqs receive-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/my-fifo-queue.fifo \
  --max-number-of-messages 1
```