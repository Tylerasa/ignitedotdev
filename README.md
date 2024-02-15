# README

## Installation

1. Make sure `kind` is executable:

    ```bash
    chmod +x kind-install.sh
    ```

2. Run the installation script:

    ```bash
    ./kind-install.sh
    ```

    This process may take a few minutes to complete.

## Terraform Deployment

1. Change directory into the Terraform directory:

    ```bash
    cd terraform
    ```

2. Run Terraform plan:

    ```bash
    terraform plan
    ```

    This command may take 3 to 5 minutes to complete.

## Accessing Services

1. To get a list of all services:

    ```bash
    kubectl get svc
    ```

2. Identify the service titled `node-app-service`.

3. Port-forward to the service:

    ```bash
    kubectl port-forward svc/node-app-service 3002:80
    ```

    You can also port-forward other resources, such as Grafana, using similar commands.

## Accessing Grafana Credentials

1. Get the Grafana secret:

    ```bash
    kubectl get secret kube-prometheus-stack-grafana -o yaml
    ```

2. Decode the values for the password and username:

    ```bash
    echo <admin-password> | base64 -d
    ```

    Replace `<admin-password>` with the encoded password obtained from the secret.