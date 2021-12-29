# Serverless POC

https://zhuanlan.zhihu.com/p/360974617

knative

## Knative poc

安装knative 0.25.0 ok （k8s是1.19 所以只能安装0.25.0）

下一步安装istio


Serverless的使用场景
异步，并发，易于并行化成独立工作单元的工作负载
低频或有零星请求，但具有较大不可预测扩容变化需求的工作负载
无状态，短期运行，对冷启动延迟不敏感的工作负载
业务需求变化迅速，要求快速开发实现的场景

K8S不够吗，为什么需要KnativeK8S对业务开发者来说过多暴露了平台的细节，技术门槛比较高，大部分情况下，开发者并不希望关心容器编排的细节，只想关心应用本身的业务逻辑，服务规模的扩展交给平台来完成。K8S更适合Devops用来构建PaaS平台。Knative 将kubernetes和istio的复杂度进行抽象和隔离，解决了繁琐的构建，部署，服务治理步骤，并且基于开放标准使得服务变得可移植。

作者：jove
链接：https://zhuanlan.zhihu.com/p/172431080
来源：知乎
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

Traffic Splitting Using Knative Serving

```yaml
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: my-service
spec:
  template:
    metadata:
      name: my-service-v2
    spec:
      containers:
        - image: <location_of_container_image_in_a_registry>
          ports:
            - containerPort: 8080
  traffic:
  - latestRevision: true
    percent: 50
  - revisionName: my-service-v1
    percent: 50
```

## Istio 部署

## Knative serving 部署

演示当有请求时扩容的示例

watch kubect get pod 

hey -n 10000 -c 200 http://helloworld-java-spring.default.127.0.0.1.sslip.io/

## Knative eventing 部署

### auto scale、 scale to 0

Summary:
  Total:        14.3574 secs
  Slowest:      3.4949 secs
  Fastest:      0.0052 secs
  Average:      0.2729 secs
  Requests/sec: 696.5060


为此，Knative 将重点放在三个关键组件上：build（构建）你的应用程序，为其提供流量 serving（服务），以及确保应用程序能够轻松地生产和消费 event（事件）。

Build（构建）

通过灵活的插件化的构建系统将用户源代码构建成容器。目前已经支持多个构建系统，比如 Google 的 Kaniko，它无需运行 Docker daemon 就可以在 Kubernetes 集群上构建容器镜像。

Serving（服务）

基于负载自动伸缩，包括在没有负载时缩减到零。允许你为多个修订版本（revision）应用创建流量策略，从而能够通过 URL 轻松路由到目标应用程序。

Event（事件）

使得生产和消费事件变得容易。抽象出事件源，并允许操作人员使用自己选择的消息传递层。

https://www.servicemesher.com/getting-started-with-knative/knative-overview.html

### Revision  

### 函数上下文

Knative 特性
对于常用应用用例的更高级别抽象
安全、无状态、可扩展应用的秒级启动
功能松耦合，可任意组装
组件可拔插，你可以使用自己的日志、监控、网络和服务网格
可移植：在任意 Kubernetes 集群上运行，无需担心供应商锁定
顺应开发者习惯，支持如 GitOps、DockerOps、ManualOps 等通用模式
可以与通用工具及框架一起使用，如 Django、Ruby on Rails、Spring 等
