import logging
import sys

EVENT_ID = ""
LOGGER: logging.Logger

# We recommend using a python uuid to track events with logging
def init_logger(event_id: str):
    global EVENT_ID
    global LOGGER
    EVENT_ID = event_id
    Log_Format = "%(levelname)s %(asctime)s - %(message)s"
    logging.basicConfig(
        stream=sys.stdout, format=Log_Format, level=logging.INFO, force=True
    )
    LOGGER = logging.getLogger()


def log_info(msg, obj=None):
    info_message = f"strataEventID - {EVENT_ID} - {msg}"
    obj_message = f"strataEventID - {EVENT_ID} - {obj}"
    LOGGER.info(info_message)
    if obj:
        LOGGER.info(obj_message)