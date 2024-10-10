output "Ip-de-la-instancia" {
  value = aws_instance.ec2_instance.public_ip
}

output "Nombre-del-Proyecto" {
  value = aws_instance.ec2_instance.tags["Name"]
}

output "Eks-Nombre-del-cluster" {
  value = aws_eks_cluster.eks_cluster.name
}

output "Estado-de-la-instancia" {
  value = aws_instance.ec2_instance.instance_state
}

output "Nginx" {
  value = "http://${kubernetes_service.nginx.status.0.load_balancer.0.ingress.0.hostname}"
}

output "Prometheus" {
  value = "http://${kubernetes_service.prometheus.status[0].load_balancer[0].ingress[0].hostname}:${kubernetes_service.prometheus.spec[0].port[0].port}"
}

output "Grafana" {
  value = "http://${kubernetes_service.grafana.status[0].load_balancer[0].ingress[0].hostname}:${kubernetes_service.grafana.spec[0].port[0].port}"
}
