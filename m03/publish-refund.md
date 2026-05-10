To publish an event indicating a refund:

```bash
aws sns publish \
  --topic-arn arn:aws:sns:us-east-1:123456789012:sales-topic \
  --message '{
    "eventType": "REFUND",
    "transaction": {
      "id": "txn-1002",
      "timestamp": "2026-05-10T18:45:00Z"
    },
    "customer": {
      "email": "alice@example.com"
    },
    "product": {
      "id": "sku-123",
      "name": "Wireless Mouse",
      "price": 29.99
    }
  }' \
  --message-attributes '{
    "eventType": {
      "DataType": "String",
      "StringValue": "REFUND"
    }
  }'
```
