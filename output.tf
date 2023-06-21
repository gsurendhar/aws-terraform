output "VPC_ID" {
  value = aws_vpc.myvpc.id
}

output "PublicSub_ID" {
  value = aws_subnet.PublicSunebt1.id
}

output "PrivateSub_ID" {
  value = aws_subnet.PrivateSunebt1.id
}

output "Public_route_table" {
  value = aws_route_table.public-route.id

}
output "Private_route_table" {
  value = aws_route_table.private-route.id

}

output "VPC_ARN" {
  value = aws_vpc.myvpc.arn
}
