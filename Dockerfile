# Base docker image to inherit from
FROM python:3.6-alpine

# Build arguments
ARG IS_DEV=FALSE

# Working directory where we will install our app
WORKDIR /usr/src/app/

# Install pipenv
RUN pip install pipenv

# Install our python dependencies only
COPY Pipfile Pipfile.lock /usr/src/app/
RUN pipenv install && \
    # Only install dev dependencies if build arg `IS_DEV` is set to `TRUE`
    if test "${IS_DEV}" == "TRUE"; then pipenv install --dev; fi

# Copy our application
COPY . /usr/src/app/

# Default environment configuration needed for `flask run` command
ENV FLASK_RUN_HOST="0.0.0.0"
ENV FLASK_RUN_PORT="5000"
ENV FLASK_ENV="development"
ENV FLASK_APP="fake_api.app"

# Expose the port our server listens on
EXPOSE 5000

# Run all commands via `pipenv run` to ensure we properly link installed python dependencies
ENTRYPOINT ["pipenv", "run"]

# Command that will be executed if none is provided
CMD ["flask", "run"]
