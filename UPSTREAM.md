# Upstream

| | |
| --- | --- |
| Project | secDevLabs (Globo.com) |
| Repository | https://github.com/globocom/secDevLabs |
| App | `owasp-top10-2021-apps/a3/streaming` |
| Version | master (secDevLabs has no releases) |
| Commit | 10be438496e928c66567749f0aaf0bb976052bc9 |
| Licence | BSD-3-Clause |

The app folder [`owasp-top10-2021-apps/a3/streaming`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a3/streaming) of that commit is vendored unchanged, without its Git history,
split so that each part sits in the build folder of the machine that uses it:

| Upstream path (in the app folder) | Here |
| --- | --- |
| `app/backend/` | `build/backend/app/` |
| `app/frontend/` | `build/frontend/app/` |
| everything else (README, Makefile, deployments, images) | `app/` |

Each `build/<machine>/Dockerfile` says in its header comment how it differs from upstream:

- `build/backend/`: upstream's `deployments/backend.dockerfile` with the runtime image `eclipse-temurin:8-jre-alpine` (upstream's `openjdk:8-jdk-alpine` is gone from Docker Hub), without the `wait-for` script (the machine starts once the database answers), and with the environment and command of upstream's compose file baked in; the database host is `db`, the compose service name (upstream's URL names the container, `mysql-a7-streaming`).
- `build/frontend/`: upstream's `deployments/frontend.dockerfile` without the `wait-for` script (the machine starts once the backend answers).
- `build/db/`: the `mariadb:10.6.3` service of upstream's compose file with its environment baked in.
- The page calls the backend at `http://localhost:8080`, so the backend keeps upstream's published port.

To update, replace the vendored folders with a newer secDevLabs commit, then change this file.
