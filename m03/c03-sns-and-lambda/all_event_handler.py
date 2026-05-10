import json


def lambda_handler(event, context):
    for record in event["Records"]:
        message = json.loads(record["Sns"]["Message"])
        event_type = message["eventType"]
        customer_email = message["customer"]["email"]
        product_name = message["product"]["name"]

        print(f"Processing {event_type}")
        print(f"For: {customer_email}")
        print(f"Product purchased: {product_name}")

    return {
        "statusCode": 200
    }
