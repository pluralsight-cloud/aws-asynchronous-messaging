#!/usr/bin/env bash

QUEUE_NAME="sqs-cw-metrics"
QUEUE_URL=$(
  aws sqs create-queue \
    --queue-name "$QUEUE_NAME" \
    --attributes VisibilityTimeout=60 \
    --query 'QueueUrl' \
    --output text
)

echo "Queue URL:"
echo "$QUEUE_URL"
echo

echo "Wait 10 seconds for queue to create"
sleep 10

TOTAL_ITERATIONS=12

for ITERATION in $(seq 1 $TOTAL_ITERATIONS); do
  echo $ITERATION
  echo "Sending 10 messages"
  for i in $(seq 1 10); do
    aws sqs send-message \
      --queue-url "$QUEUE_URL" \
      --message-body "message-$ITERATION-$i-$(date)"
  done

  echo "Sent 10 messages"

  echo "Receive 5 messages"
  RECEIVE_OUTPUT=$(
    aws sqs receive-message \
      --queue-url "$QUEUE_URL" \
      --max-number-of-messages 5 \
      --visibility-timeout 60 \
      --wait-time-seconds 2
  )

  echo "Grabbing receipt handles"
  RECEIPT_HANDLES=$(echo "$RECEIVE_OUTPUT" | grep -o '"ReceiptHandle": *"[^"]*"' | sed 's/"ReceiptHandle": "//' | sed 's/"$//')

  COUNT=0

  for RH in $RECEIPT_HANDLES; do
    COUNT=$((COUNT + 1))
    echo "Deleting several messages"
    if [ "$COUNT" -le 3 ]; then
      aws sqs delete-message \
        --queue-url "$QUEUE_URL" \
        --receipt-handle "$RH"

      echo "Deleted message $COUNT"
    else
      echo "Left message $COUNT in-flight"
    fi
  done

  echo "Queue stats:"
  aws sqs get-queue-attributes \
    --queue-url "$QUEUE_URL" \
    --attribute-names \
      ApproximateNumberOfMessages \
      ApproximateNumberOfMessagesNotVisible

  echo
  echo "Sleeping 30 seconds..."
  echo

  sleep 30
done
