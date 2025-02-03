import os
import logging


LOGGING_LEVEL = os.environ.get("LOGGING_LEVEL", "INFO")
logger = logging.getLogger()
logger.setLevel(LOGGING_LEVEL)


def handler(event, context):
    # extract location
    logger.info(event)
    return "Hello world from AWS Lambda!!"
