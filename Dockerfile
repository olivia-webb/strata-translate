FROM public.ecr.aws/lambda/python:3.8

ARG PIP_EXTRA_INDEX_URL
# If using event bridge
ARG EVENT_BRIDGE_AWS_ID
ARG EVENT_BRIDGE_AWS_KEY
ARG EVENT_BRIDGE_EVENT_BUS

# If using event bridge
ENV EVENT_BRIDGE_AWS_ID=${EVENT_BRIDGE_AWS_ID}
ENV EVENT_BRIDGE_AWS_KEY=${EVENT_BRIDGE_AWS_KEY}
ENV EVENT_BRIDGE_EVENT_BUS=${EVENT_BRIDGE_EVENT_BUS}

COPY . ./

RUN pip install --extra-index-url ${PIP_EXTRA_INDEX_URL} --no-cache-dir -r requirements.txt

#Command to be run for lambda
CMD [ "" ]