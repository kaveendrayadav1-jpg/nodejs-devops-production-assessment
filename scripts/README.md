# Automation Scripts

## deploy.sh
Deploys latest application container.

Usage:
./deploy.sh <image-tag>

## rollback.sh
Rolls back to previous container image.

Usage:
./rollback.sh <previous-image-tag>

## health-check.sh
Checks application health endpoint.

Usage:
./health-check.sh

## log-rotate.sh
Rotates and archives logs.

Usage:
./log-rotate.sh

## env-setup.sh
Bootstraps new Linux server.

Usage:
./env-setup.sh

## migration.sh
Runs database migrations.

Usage:
./migration.sh
