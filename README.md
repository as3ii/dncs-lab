# DNCS-LAB

This repository contains the Vagrant files required to run the virtual lab environment used in the DNCS course.

# Network Map

```


           +------------------------------------------------------+
           |                                                      |
           |                                                      |enp0s3
        +--+--+                +------------+               +------------+
        |     |                |            |  10.0.4.130/30|            |
        |     |          enp0s3|            |         enp0s9|            |
        |     +----------------+  router-1  +---------------+  router-2  |
        |     |                |            |enp0s9         |            |
        |     |                |            |10.0.4.129/30  |            |
        |  M  |                +------------+               +------------+
        |  A  |           10.0.4.1/25|enp0s8            10.0.0.1/23|enp0s8
        |  N  |           10.0.2.1/23|                             |
        |  A  |                      |                             |
        |  G  |                      |                             |
        |  E  |                      |enp0s8            10.0.0.2/23|enp0s8
        |  M  |            +-------------------+             +-----+----+
        |  E  |      enp0s3|                   |             |          |
        |  N  +------------+      SWITCH       |             |          |
        |  T  |            |                   |             |  host-c  |
        |     |            +-------------------+             |          |
        |  V  |               |enp0s9       |enp0s10         |          |
        |  A  |               |             |                +----------+
        |  G  |    10.0.4.2/25|             |10.0.2.2/23           |enp0s3
        |  R  |         enp0s8|             |enp0s8                |
        |  A  |        +----------+     +----------+               |
        |  N  |        |          |     |          |               |
        |  T  |  enp0s3|          |     |          |               |
        |     +--------+  host-a  |     |  host-b  |               |
        |     |        |          |     |          |               |
        |     |        |          |     |          |               |
        +--+--+        +----------+     +----------+               |
         |   |                              |enp0s3                |
         |   |                              |                      |
         |   +------------------------------+                      |
         |                                                         |
         |                                                         |
         +---------------------------------------------------------+


```
# Requirements
 - Python 3
 - 10GB disk storage
 - 2GB free RAM
 - Virtualbox
 - Vagrant (https://www.vagrantup.com)
 - Internet

# How-to
 - Install Virtualbox and Vagrant
 - Clone this repository
`git clone https://github.com/as3ii/dncs-lab`
 - You should be able to launch the lab from within the cloned repo folder.
```
cd dncs-lab
[~/dncs-lab] vagrant up
```
Once you launch the vagrant script, it may take a while for the entire topology to become available.
 - Verify the status of the 5 VMs
 ```
 [dncs-lab]$ vagrant status
Current machine states:

router-1                  running (virtualbox)
router-2                  running (virtualbox)
switch                    running (virtualbox)
host-a                    running (virtualbox)
host-b                    running (virtualbox)
host-c                    running (virtualbox)
```
- Once all the VMs are running verify you can log into all of them:
`vagrant ssh router-1`
`vagrant ssh router-2`
`vagrant ssh switch`
`vagrant ssh host-a`
`vagrant ssh host-b`
`vagrant ssh host-c`

# Assignment
This section describes the assignment, its requirements and the tasks the student has to complete.
The assignment consists in a simple piece of design work that students have to carry out to satisfy the requirements described below.
The assignment deliverable consists of a Github repository containing:
- the code necessary for the infrastructure to be replicated and instantiated
- an updated README.md file where design decisions and experimental results are illustrated
- an updated answers.yml file containing the details of

## Design Requirements
- Hosts 1-a and 1-b are in two subnets (*Hosts-A* and *Hosts-B*) that must be able to scale up to respectively 108 and 502 usable addresses
- Host 2-c is in a subnet (*Hub*) that needs to accommodate up to 418 usable addresses
- Host 2-c must run a docker image (dustnic82/nginx-test) which implements a web-server that must be reachable from Host-1-a and Host-1-b
- No dynamic routing can be used
- Routes must be as generic as possible
- The lab setup must be portable and executed just by launching the `vagrant up` command

## Tasks
- Fork the Github repository: https://github.com/dustnic/dncs-lab
- Clone the repository
- Run the initiator script (dncs-init). The script generates a custom `answers.yml` file and updates the Readme.md file with specific details automatically generated by the script itself.
  This can be done just once in case the work is being carried out by a group of (<=2) engineers, using the name of the 'squad lead'. 
- Implement the design by integrating the necessary commands into the VM startup scripts (create more if necessary)
- Modify the Vagrantfile (if necessary)
- Document the design by expanding this readme file
- Fill the `answers.yml` file where required (make sure that is committed and pushed to your repository)
- Commit the changes and push to your own repository
- Notify the examiner that work is complete specifying the Github repository, First Name, Last Name and Matriculation number. This needs to happen at least 7 days prior an exam registration date.

# Notes and References
- https://rogerdudler.github.io/git-guide/
- http://therandomsecurityguy.com/openvswitch-cheat-sheet/
- https://www.cyberciti.biz/faq/howto-linux-configuring-default-route-with-ipcommand/
- https://www.vagrantup.com/intro/getting-started/


# Design

## Subnet informations
| Network name |    Network    |     Netmask     |  Host Min. |  Host Max. |  Broadcast | Total Hosts|
|--------------|---------------|-----------------|------------|------------|------------|:----------:|
|   Hosts-A    | 10.0.4.0/25   | 255.255.255.128 | 10.0.4.1   | 10.0.4.126 | 10.0.4.127 |     126    |
|   Hosts-B    | 10.0.2.0/23   | 255.255.254.0   | 10.0.2.1   | 10.0.3.254 | 10.0.3.255 |     510    |
|    Hub       | 10.0.0.0/23   | 255.255.254.0   | 10.0.0.1   | 10.0.1.254 | 10.0.1.255 |     510    |
| Inter-Router | 10.0.4.128/30 | 255.255.255.252 | 10.0.4.129 | 10.0.4.130 | 10.0.4.131 |      2     |

I chose to use 10.x.y.z/8 as base ip's range because it is the commonest range for big private network, and I ordered the subnet from
the biggest to the smallest with the goal of not leaving unused ips between the subnet.
The Netmasks are sized to be as small as possible respecting the specifications.

## Test
To test the reachability of host-c from host-a and host-b, run:
```
vagrant ssh host-a -c "/vagrant/scripts/test_host-a.sh"
```
```
vagrant ssh host-b -c "/vagrant/scripts/test_host-b.sh"
```
These test scripts will test the reachability of all the routers and host-c, check that router-1 will block the connection between host-a
and host-b, and will try to download the html page hosted on Nginx in the container running in Docker over host-c.

