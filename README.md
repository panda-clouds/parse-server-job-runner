parse-server-job-runner
====

A standalone node.js based command line tool to run scheduled jobs.

# Installing

`npm install -g parse-server-job-runner`

# Running

```
PARSE_APPLICATION_ID=appId PARSE_MASTER_KEY=masterKey PARSE_SERVER_URL=http://my.parse-server.com/1 npm start
```

# Using Docker

```
docker build . 
docker run -e PARSE_APPLICATION_ID=appId PARSE_MASTER_KEY=masterKey PARSE_SERVER_URL=http://my.parse-server.com/1 <image-id>
```

# Using Kubernetes

1. run `vi jobs.yaml`
2. paste code below, replacing all `<insert-X>` with values
3. run `kubectl apply -f jobs.yaml`

```
kind: Pod
apiVersion: v1
metadata:
  name: job-runner
  namespace: <insert-namespace>
spec:
  containers:
    - name: job-runner
      image: pandaclouds/parse-server-job-runner
      env:
      - name: PARSE_APPLICATION_ID
        value: <insert-app-id>
      - name: PARSE_SERVER_URL
        value: <insert-server-url>
      - name: PARSE_MASTER_KEY
        valueFrom:
          secretKeyRef:
            key: <insert-value-in-keychain-that-contains-masterkey>
            name: <insert-keychain-that-contains-masterkey>
  restartPolicy: Always
  ```
