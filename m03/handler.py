import json


def lambda_handler(event, context):
    for record in event["Records"]:
        message = json.loads(record["Sns"]["Message"])

        sale = message["Sale"]
        product_name = sale["product"]["name"]

        print(f"Product purchased: {product_name}")

    return {
        "statusCode": 200
    }
