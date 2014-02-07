---
layout: post
title: Installing MongoDB in Mac OS
---
For this I will be using [Homebrew](http://brew.sh/) (a very useful package manager for Mac OS), if you don't know this you should head over to their homepage and get it installed right now, or just enter the following command:
	
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
	
## Removing an existing MongoDB installation

A year ago I installed MongoDB and used it in a small node.js project and haven't used it since, in the meantime I have (of course) lost the passwords for the local development database, so the first step is to completely remove the existing installation of MongoDB.

First I removed MongoDB through Homebrew:

	brew remove mongodb
	
Then I ensured that the `mongod` binary was shutdown through the Activity Monitor. After that I removed the possible left-overs (data-files, etc.) located by inspecting the [Brew-formula for MongoDB](https://github.com/Homebrew/homebrew/blob/master/Library/Formula/mongodb.rb#L69). These files were located in `/usr/local/var/mongodb`, so this folder was completely removed:

	rm -r /usr/local/var/mongodb
	
## Installing MongoDB

After that I just installed MongoDB again:

	brew update
	brew install mongodb
	launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist
    
And verified that it worked:

	mongo
	
Giving the output:

	MongoDB shell version: 2.4.9
	connecting to: test
	> 

For easy listing of databases, collections and data the the [MongoHub GUI](http://docs.mongodb.org/ecosystem/tools/administration-interfaces/#mongohub) is strongly recommended.
	
The next blog post will be about creating users with appropriate permissions.