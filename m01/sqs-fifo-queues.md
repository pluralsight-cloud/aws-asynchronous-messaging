# Commands for Creating and Interacting with a SQS FIFO Queue

Create the queue:

```bash
aws sqs create-queue \
  --region us-west-2 \
  --queue-name my-fifo-queue.fifo \
  --attributes FifoQueue=true
```

You can also optionally use:
`--attributes FifoQueue=true,ContentBasedDeduplication=true` 

But only if you want content based deduplication.

Get the queue URL:

```bash
aws sqs get-queue-url \
  --region us-west-2 \
  --queue-name my-fifo-queue.fifo
```

Send a message to the queue:

```bash
aws sqs send-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/my-fifo-queue.fifo \
  --message-body "hello fifo" \
  --message-group-id "group-1" \
  --message-deduplication-id "msg-1"
```

Get messages from SQS:

```bash
aws sqs receive-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/my-fifo-queue.fifo \
  --max-number-of-messages 1
```

Delete messages:

```bash
aws sqs delete-message \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/my-fifo-queue.fifo \
  --receipt-handle "RECEIPT_HANDLE"
```

```bash
aws sqs delete-queue \
  --region us-west-2 \
  --queue-url https://sqs.us-west-2.amazonaws.com/123456789012/my-fifo-queue.fifo
```

