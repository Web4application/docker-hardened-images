git clone https://github.com/testcontainers/testcontainers-showcase.git
cd testcontainers-showcase
./mvnw verify

docker run -d --name kserve-localmodelnode-agent \
  -p 8080:8080 -p 8081:8081 -p 9443:9443 \
  <ingress>/dhi-kserve-localmodelnode-agent:<tag>
docker run -d --name kserve-localmodelnode-agent \
  -p 8080:8080 -p 8081:8081 -p 9443:9443 \
  <your-namespace>/dhi-kserve-localmodelnode-agent:<tag>

git clone https://github.com/AtomicJar/testcontainers-cloud-go-example
cd testcontainers-cloud-go-example
go mod download
go test -v -count=1

docker run --rm -it --pid container:my-php \
  --mount=type=image,source=<your-namespace>/dhi-busybox,destination=/dbg,ro \
  <your-namespace>/dhi-php:<tag> /dbg/bin/sh


git clone https://github.com/AtomicJar/testcontainers-cloud-nodejs-example
cd testcontainers-cloud-nodejs-example
