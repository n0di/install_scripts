#!/bin/bash
# edit limits
echo -e "\n* soft nproc 262140\n* hard nproc 262140\n* soft nofile 262140\n* hard nofile 262140\nroot soft nofile 26
2140\nroot hard nofile 262140\nroot soft nproc 262140\nroot hard nproc 262140" >> /etc/security/limits.conf 

ulimit -n 262140
echo "vm.swappiness=1" >> /etc/sysctl.conf

# if use cluster
chmod 600 /path/to/mongodb-keyfile
chown mongodb:mongodb /path/to/mongodb-keyfile
openssl rand -base64 756 > /path/to/mongodb-keyfile

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# /etc/mongod.conf
# # mongod.conf

# # for documentation of all options, see:
# #   http://docs.mongodb.org/manual/reference/configuration-options/

# # Where and how to store data.
# storage:
#   dbPath: /var/lib/mongodb
# #  engine:
# #  wiredTiger:
#   wiredTiger:
#     engineConfig:
#       cacheSizeGB: 8
#       journalCompressor: zstd
#     collectionConfig:
#       blockCompressor: zstd

# # where to write logging data.
# systemLog:
#   destination: file
#   logAppend: true
#   path: /var/log/mongodb/mongod.log

# # network interfaces
# net:
#   port: 27017
#   bindIp: 0.0.0.0
#   maxIncomingConnections: 20000

# # how the process runs
# processManagement:
#   timeZoneInfo: /usr/share/zoneinfo
#   fork: false

# security:
#   authorization: enabled
    # if cluster
    # keyFile: /path/to/mongodb-keyfile

# #operationProfiling:

# # #replication:
# if use cluster
# replication:
#   replSetName: "repls"

# #sharding:

# ## Enterprise-Only Options:

# #auditLog:


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# add user for cluster admin
# connect db
# use admin

# db.createUser(
#   {
#     user: "clusterAdmin",
#     pwd: "strongPassword",
#     roles: [ { role: "root", db: "admin" } ]
#   }
# )

# add user for admin

# use admin

# db.createUser(
#   {
#     user: "admin",
#     pwd: "securePassword",
#     roles: [ { role: "userAdminAnyDatabase", db: "admin" } ]
#   }
# )

# create user for db

# use myDatabase

# db.createUser(
#   {
#     user: "dbUser",
#     pwd: "dbUserPassword",
#     roles: [ { role: "readWrite", db: "myDatabase" } ]
#   }
# )


# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# cluster configure
# write in /etc/hosts ip and hostname mongodb servers
# 10.10.x.10     mongodb-m
# 10.10.x.11     mongodb-s1
# 10.10.x.12     mongodb-s2


# connect db and write 

# rs.initiate(
#   {
#     _id: "repls",
#     members: [
#       { _id: 0, host: "mongodb-m:27017" },
#       { _id: 1, host: "mongodb-s1:27017" },
#       { _id: 2, host: "mongodb-s2:27017" }
#     ]
#   }
# )

# check cluster status
# rs.status()
