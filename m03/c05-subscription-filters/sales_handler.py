import json


def lambda_handler(event, context):
    for record in event["Records"]:

        message = json.loads(record["Sns"]["Message"])

        product_name = message["product"]["name"]

        print(f"Processing SALE for product: {product_name}")

    return {
        "statusCode": 200
    }
