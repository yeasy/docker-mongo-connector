#!/bin/bash
set -euo pipefail

mongo_host="${MONGO:-mongo}"
mongo_port="${MONGOPORT:-27017}"
elastic_host="${ELASTICSEARCH:-elasticsearch}"
elastic_port="${ELASTICPORT:-9200}"
doc_manager="${DOC_MANAGER:-mongo_connector.doc_managers.elastic2_doc_manager}"

python3 - <<PY
import time
from pymongo import MongoClient

client = MongoClient("mongodb://${mongo_host}:${mongo_port}", serverSelectionTimeoutMS=2000)
while True:
    try:
        hello = client.admin.command("hello")
        if hello.get("isWritablePrimary") or hello.get("ismaster"):
            break
    except Exception:
        pass
    print("Waiting for Mongod node to become primary...")
    time.sleep(3)
PY

exec mongo-connector \
  --auto-commit-interval=0 \
  --oplog-ts=/data/oplog.ts \
  -m "${mongo_host}:${mongo_port}" \
  -t "${elastic_host}:${elastic_port}" \
  -d "${doc_manager}"
