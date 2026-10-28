param (
    [Parameter(Mandatory=$false)]
    [string]$TestVar1
)

if ($Testvar1 -eq "db-status") {
    Write-output "Current AWS RDS Database Status:\n"
    aws rds describe-db-instances --db-instance-identifier get-postgres --region eu-west-1 --query "DBInstances[0].[DBInstanceStatus,AvailabilityZone,SecondaryAvailabilityZone]" --output table

} elseif ($TestVar1 -eq "db-reboot") {
    Write-Output "Rebooting AWS RDS Database Instance"
    aws rds reboot-db-instance --db-instance-identifier get-postgres --force-failover --region eu-west-1

} else {
    Write-Output "-------------"
    Write-Output "| Help Menu |" 
    Write-Output "-----------------------------------------------------------------"
    Write-Output "db-status -          Displays the status of the AWS RDS Database"
    Write-Output "db-reboot -          Reboots the AWS RDS Database"
    Write-Output "-----------------------------------------------------------------"
}