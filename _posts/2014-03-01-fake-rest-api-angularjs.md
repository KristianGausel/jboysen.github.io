---
layout: post
title: Faking a REST API in development mode
---
I'm working on a minor project to find the daily average price on (currently only) iPhones on a major danish trading site called [DBA.dk](http://dba.dk). Currently I managed to get access to their internal API by "reverse engineering" how they communicate with it through their iPhone App. 

## Backend

I'm building the backend (scraper and REST server) using Scala and will probably be using some of the libraries available by [Spray.io](http://spray.io/). I have just started exploring Scala and is learning a little every time I'm using it - but progress is slow as I'm currently hung up on various other projects (*thesis*). The book [Programming in Scala](http://www.amazon.com/Programming-Scala-Comprehensive-Step-Step/dp/0981531644) by Martin Odersky (the designer of Scala) et al. is by the way highly recommendable! The backend code is available on [Github](https://github.com/jboysen/iprice).

## Frontend

For quite a long time I have thought about trying out AngularJS but haven't found a suitable project, but for this I think it fits perfectly. I'm planning on decoupling frontend and backend completely, and let the frontend communicate with the backend through AJAX calls, by doing this the actual website can be hosted on e.g. Github free static site host.

As I by no means am a designer I will of course just be using Bootstrap as design. 

### Faking an API

Now to the reason for this post: I'm trying to find a service where I can make fake endpoints available to test against when developing the frontend. I ran across this simple project on Github: [JSON Server](https://github.com/typicode/json-server), essentially just a (very) simple server serving static JSON content. It can be used as a Node module or just as a CLI tool directly, e.g.:

	$ cat db.json
	{ 
	  "posts": [
	    { "id": 1, "body": "foo" }
	  ]
	}
	$ json-server --file db.json
	$ curl -i http://localhost:3000/posts/1
	
For learning AngularJS I think it's a great tool as no effort need to be put into the backend before the actual requirements to it has been covered by developing the frontend. 