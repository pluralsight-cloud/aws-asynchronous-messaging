To publish an event that indicates a sale:

```bash
aws sns publish \
  --topic-arn arn:aws:sns:us-east-1:123456789012:sales-topic \
  --message '{
    "eventType": "SALE",
    "transaction": {
      "id": "txn-1001",
      "timestamp": "2026-05-10T18:30:00Z"
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
      "StringValue": "SALE"
    }
  }'
```
