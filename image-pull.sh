docker pull gcr.io/knative-releases/knative.dev/serving/cmd/queue@sha256:5af97fa5e19c6fd1e04642e7cf6eb01e6982b4cfee19d8fd16649423277c2eb9
docker pull gcr.io/knative-releases/knative.dev/serving/cmd/activator@sha256:00aeb9267dc6445bbb11cb90636e9cde44404c6303d55b81aa074381b4989eef
docker pull gcr.io/knative-releases/knative.dev/serving/cmd/autoscaler@sha256:ca3bad368a2ac40f33ad9e47c1075cc2b833301b4bc772fb84c51f52cc1c0a35
docker pull gcr.io/knative-releases/knative.dev/serving/cmd/controller@sha256:50fcbbc79b1078991280bf423e590c8904882dc8750c7f7d61bc06d944a052f2
docker pull gcr.io/knative-releases/knative.dev/serving/cmd/domain-mapping@sha256:3b7da888fafca8cc5ba5e2aa62d6f97751d50890ed9d0b01aabce66a7d26351e
docker pull gcr.io/knative-releases/knative.dev/serving/cmd/domain-mapping-webhook@sha256:a6529f0625483c81741c92895e4d54be8a103ecc5801e7c3aa049d3b3ea7cc90
docker pull gcr.io/knative-releases/knative.dev/serving/cmd/webhook@sha256:382a1d64ea0686da2b973c95be96fcae29ac25b256b90f5735b1479a93d19c7a

docker save -o knative-v0.25.0-images.tgz  799485da7d36 81b130e25d1d eb7276972d4c 79d827a8c528 dcf829a683ba 74cd61b62fa7 e5015a3f143d


docker load -i knative-v0.25.0-images.tgz

docker tag 799485da7d36 gcr.io/knative-releases/knative.dev/serving/cmd/queue
docker tag 81b130e25d1d gcr.io/knative-releases/knative.dev/serving/cmd/activator
docker tag eb7276972d4c gcr.io/knative-releases/knative.dev/serving/cmd/autoscaler
docker tag 79d827a8c528 gcr.io/knative-releases/knative.dev/serving/cmd/controller
docker tag dcf829a683ba gcr.io/knative-releases/knative.dev/serving/cmd/domain-mapping
docker tag 74cd61b62fa7 gcr.io/knative-releases/knative.dev/serving/cmd/domain-mapping-webhook
docker tag e5015a3f143d gcr.io/knative-releases/knative.dev/serving/cmd/webhook


docker image rm -f f8014b73da27 
docker image rm -f ff2e1c6e1dca 
docker image rm -f 83c9a037c238 
docker image rm -f ff5ef2de43c1 
docker image rm -f 51ed1dae2bf4 
docker image rm -f 60ba9ae1e900 
docker image rm -f 3cacd09d47b9 


kubectl get namespace "istio-system" -o json \
  | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" \
  | kubectl replace --raw /api/v1/namespaces/istio-system/finalize -f -