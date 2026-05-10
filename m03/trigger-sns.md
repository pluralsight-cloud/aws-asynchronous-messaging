# Send a Message to Lambda from SNS

```bash
TOPIC_ARN=arn:aws:sns:us-east-1:123456789012:sales-topic
aws sns publish \
  --topic-arn $TOPIC_ARN \
  --message '{
    "Sale": {
      "user": {
        "email": "alice@example.com"
      },
      "product": {
        "id": "sku-123",
        "name": "Wireless Mouse"
      }
    }
  }'
```