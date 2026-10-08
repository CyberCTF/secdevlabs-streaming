# secDevLabs Streaming

[secDevLabs](https://github.com/globocom/secDevLabs)' [`owasp-top10-2021-apps/a3/streaming`](https://github.com/globocom/secDevLabs/tree/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a3/streaming) app, by Globo.com and the
secDevLabs contributors: an Angular live-streaming page with a Spring Boot backend and MariaDB, whose live chat renders messages as HTML (stored cross-site scripting). This repository runs it with
[Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, built from
the vendored app folder (see [UPSTREAM.md](UPSTREAM.md)).

| Machine | Service |
| --- | --- |
| frontend | the Angular page (nginx) on port 80, published on 10007 |
| backend | the Spring Boot API on port 8080 |
| db | MariaDB 10.6.3 on port 3306 (lab network only) |

## Run it

```bash
isoloom generate
isoloom run docker
```

Then open http://localhost:10007/. The page calls the backend at http://localhost:8080/live. The same spec runs as Docker on a local VM (`docker-vm`), on a cloud VM
(`cloud-docker`) or on Kubernetes. Lab guide: the app's
[README](https://github.com/globocom/secDevLabs/blob/10be438496e928c66567749f0aaf0bb976052bc9/owasp-top10-2021-apps/a3/streaming/README.md), with the attack narrative and the secDevLabs walkthrough.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

BSD-3-Clause, as secDevLabs ([LICENSE](LICENSE)). The third-party software inside the images keeps
its own licence. This application is deliberately vulnerable: keep it isolated.
