ARG PYTHON_VERSION=3.12
ARG INSTALL_WATCHFILES=false

FROM public.ecr.aws/lambda/python:$PYTHON_VERSION

WORKDIR ${LAMBDA_TASK_ROOT}

COPY requirements.txt ./

RUN pip install -r requirements.txt

RUN if [ "$INSTALL_WATCHFILES" = "true" ]; then \
      pip install watchfiles; \
    fi

COPY src .

CMD ["lambda_function.handler"]