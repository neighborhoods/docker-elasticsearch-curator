FROM python:3.5-slim

WORKDIR /curator
COPY Pipfile Pipfile.lock ./
RUN pip install pipenv && pipenv install --ignore-pipfile --deploy

ENTRYPOINT [ "pipenv", "run", "curator" ]
CMD ["--help"]
