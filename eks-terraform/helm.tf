provider "helm" {
    kubernetes {
        config_path = "/home/ubuntu/.kube/config"
    }
}

resource "helm_release" "sampleapp" {
    name      = "liberty-with-helm-tf"
    chart     = "/home/ubuntu/sample-openliberty/sample-helmchart"

    # set {
    #     name  = "mariadbUser"
    #     value = "foo"
    # }
    values = [
    "${file("/home/ubuntu/sample-openliberty/sample-helmchart/values.yaml")}"
    ]

}