
resource "kubectl_manifest" "nodejapp" {
  yaml_body = <<YAML
apiVersion: apps/v1
kind: Deployment
metadata:
  labels:
    app: node-app
  name: node-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: node-app
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxUnavailable: 0
      maxSurge: 1
  template:
    metadata:
      labels:
        app: node-app
    spec:
      containers:
      - image: tylerasa/node-app:v0.0.1
        name: node-app
        ports:
        - containerPort: 3000
YAML
}

resource "kubectl_manifest" "nodejapp_service" {
  yaml_body = <<YAML
apiVersion: v1
kind: Service
metadata:
  name: node-app-service
spec:
  selector:
    app: node-app
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
YAML
}


resource "helm_release" "kube-prometheus-stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "56.6.2"

}