SpeedTest
=========

This project allows you to test your network HTTP connexion.  
Useful when you can't use iperf. :-)

Requirements
------------
* openjdk11
* Tomcat 7-9 (or any Servlet 3.0-compliant server)
* Maven 3 for compiling

Compiling
---------

	mvn clean package

Docker
------

	docker run --name speedtest -p 80:8080 motababravo/speedtest:amd64/aarch64


Running
-------
Deploy `target/speedtest.war` into a Servlet 3.0 server (e.g. Tomcat 9).

Test download:	`curl -o /dev/null http://server/speedtest/<size>[kKmMgG]`

* `k`: kilo  
* `K`: kili  
* `m`: mega  
* `M`: megi  
* `g`: giga  
* `G`: gigi  

Test upload:	`curl -X POST -T <big_file> http://server/speedtest/`  
the returned number is your upload speed in bytes / second.
