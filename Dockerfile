FROM ubuntu:22.04 
# Installing dependencies for running a python application 
RUN apt-get update && apt-get install -y python3 python3-pip postgresql-client libpq-dev 
# Install poetry 
RUN pip3 install poetry 
# Setting the working directory 
WORKDIR /app 
# Install poetry dependencies 
COPY pyproject.toml ./ 
RUN poetry install --no-root 
# Copying our application into the container 
COPY todo todo 
# Running our application 
CMD ["bash", "-c", "sleep 10 && poetry run flask --app todo run --host 0.0.0.0 --port 6400"]