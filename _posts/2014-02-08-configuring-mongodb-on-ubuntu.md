---
layout: post
title: Configuring MongoDB on Ubuntu
---
In this blog post I will be focusing on configuring MongoDB to be used on a server with Ubuntu as OS. The MongoDB manual has some nice pages on how to secure MongoDB on different OS, [including Ubuntu](http://docs.mongodb.org/manual/administration/security/). 

Firstly MongoDB should be installed (preferable with MongoDB downloads repository) as [described here](http://docs.mongodb.org/manual/tutorial/install-mongodb-on-ubuntu/). After that we need to create an admin user, initiate `mongo`:

	$ mongo
	> use admin
	> db.addUser({user:"admin", pwd:"PASSWORD",roles:["userAdminAnyDatabase"]})
	
To gain access to the server from outside iptables should be configured to [allow access to and from port 27017](http://docs.mongodb.org/manual/tutorial/configure-linux-iptables-firewall/), the default MongoDB server port.

Now all we need to do is to make sure the `auth`-flag is set on the `mongod` instance currently running. Uncomment the `#auth = true` line in the file `/etc/mongodb.conf` and restart the MongoDB service: `sudo service mongodb restart`. Now you should only be able to access the server with credentials when the host is not localhost.

The admin user created is not very useful, we need to create some databases with users:

	$ mongo
	> use admin
	> db.auth("admin", "PASSWORD")
	> use test-database
	> db.addUser({user:"test-user", pwd:"PASSWORD",roles:["readWrite","dbAdmin"]})
	
Essentially we just created the database `test-database` with the user `test-user` which has permission to read, write data and create new collections ([see the user privileges for MongoDB](http://docs.mongodb.org/manual/reference/user-privileges/)).