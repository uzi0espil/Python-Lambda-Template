# Python Lambda Function

A startup template for creating a python lambda function using container image [link](https://docs.aws.amazon.com/lambda/latest/dg/images-create.html|).

## Prerequisites

- Docker and Docker Compose installed

## Setup

1. Create environment file:
    
   ```bash
   cp .env.example .env
   ```
   
2. Configure GitLab access:
   - Open .env file
   - Add your GitLab private access token
   - This token is required to install the CPL forecast library from GitLab packages

## Local Development

Start the development environment:

```bash
docker-compose -f local.yml up --build
```

The service is hosted at port 9000, you can test the implementation by sending a POST request:

```shell
curl --location 'http://localhost:9000/2015-03-31/functions/function/invocations' \
--header 'Content-Type: application/json' \
--data '{...}"
```

**Development Features**:

- Hot Reload: The service uses watchfiles to monitor code changes
- Auto Refresh: Changes to the code will automatically refresh the service
- No Manual Rebuilds: Eliminates the need to rebuild and restart Docker container after code changes

## Architecture

The `local.yml` configuration:

- Overrides the default Lambda entrypoint
- Installs WatchFiles.
- Implements file watching for development
- Maintains live reload functionality