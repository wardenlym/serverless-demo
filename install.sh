kubectl apply -f serving-crds.yaml
kubectl apply -f serving-core.yaml
kubectl apply -l knative.dev/crd-install=true -f istio.yaml
kubectl apply -f istio.yaml
kubectl apply -f net-istio.yaml
kubectl apply -f serving-default-domain.yaml

kubectl label namespace knative-serving istio-injection=enabled

kubectl get pod -n knative-serving

kubectl get pod -n istio-system



kubectl apply -f service-java.yaml
kubectl get ksvc helloworld-java-spring
