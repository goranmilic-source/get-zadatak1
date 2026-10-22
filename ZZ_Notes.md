# Progress
## Where you have left off:
* You have set up a VPC
    * 4 subnets
    * 2 in public
    * 2 in private
* You have set up an EC2 Web Server instance.
    * You have assigned it to the Public network
    * The EC2 instance has an Elastic IP assigned to it.
    * You hav assigned it to the WEB_SERVER_SEC_GR
        * 3 inbount rules
        * 2 outbound rules
            * The outbound rules point to the DB_SEC_GR

* You have set up an EC "Pretend Database" instance to check connectivity.
    * You have assigned it to a private network.
    * The network is not accessible from the outside.
    * The "Pretend Database" is has incoming rules
        * POSTGRESSQL: 5432
        * ICMP
        * Both rules are derived from the WEB_SERVER_SEC_GR
    * You have created a database group to assign to the upcoming database.

* Added 2 security groups

DONE
* Finalize the EC2 module and test it.
* Tag the images as per the assignment.
* Set up postgresql and test it

## What's next
* Finish setting up and testing the database.
* Change the name of the POSTGRESSQL variables to POSTGRESQL
* HIDE THE DB PASSWORD!

## Failover test
* Ensure the POSTGRESSQL database fails over to the second AZ.
* Test if the database is WRITABLE while in a failover state.
* Ensure that when the database is in a failover state that it is accessible from the WEB SERVER.
* Ensure that the database is accessible from the WEB SERVER from different AZ subnets.
    * The "Pretend Database" is currently on a different AZ from the Web server and I can ping them.




## Notes
1.  Check the Region in the networking.tf and main.tf to ensure they are reading from 
the same variable