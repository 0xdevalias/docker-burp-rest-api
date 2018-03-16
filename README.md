# docker-burp-rest-api

Easily build/run [vmware/burp-rest-api](https://github.com/vmware/burp-rest-api) in Docker by [Glenn 'devalias' Grant](http://devalias.net/) ([@_devalias](https://twitter.com/_devalias))

Original [Burp](https://portswigger.net/burp) Dockerfile inspired by [ilyaglow/docker-burp](https://github.com/ilyaglow/docker-burp)

## Warning!

While this project can help you build your own containers using your own legally acquired copy of Burp, please **DO NOT** push the built images anywhere public. I'm pretty sure that will violate Burp's licence agreement and other such fun things. If you do.. that's a you problem, I don't take any responsibility for it. Sharing is caring, but be smart and don't violate any legalities in the process. Have fun :3

## Setup

TODO: When we can properly build `burp-rest-api` in docker, add the build instructions here:

```
TODO: Can see WIP in Dockerfile.build, but it hits an issue: https://github.com/vmware/burp-rest-api/issues/32
```

Make sure your built `burp-rest-api` jar (eg. `burp-rest-api-1.0.2.jar`) is in the root folder. Then build the docker container:

```
./build.sh # OR docker-compose build
```

If this is the first time you are doing this, and you haven't yet got the preferences/activation files in `./.java`, then you will need to run the 'setup' mode. (Note: if you run burp on linux normally, you can copy/map through your ~/.java folder and it should work. No luck on macOS since it uses `.plist`):

```
./setup # OR docker-compose run --rm burp
```

This will start the container, print out a bunch of licence agreement details, and then prompt you with options that look like the following:

```
..snip..
This Licence, its subject matter or its formation (including non-contractual disputes or claims) shall be governed by and construed in accordance with English law and submitted to the exclusive jurisdiction of the English courts.

Do you accept the license agreement? (y/n)
y

This version of Burp requires a license key. To continue, please paste your license key below.
MYSUPERREDACTEDBURPLICENCEKEYHERE=

Burp will now attempt to contact the license server and activate your license. This will require Internet access.
NOTE: license activations are monitored. If you perform too many activations, further activations for this license may be prevented.

Enter preferred activation method (o=online activation; m=manual activation; r=re-enter license key)
m
```

Agree to the licence agreement, enter your licence key, and choose online activation. Once this is complete, you should see a line like the following, then a bunch of logs as everything starts up:

```
Your license is successfully installed and activated.

..snip tons of log lines..

2018-03-15 01:56:34.107  INFO 1 --- [           main] c.vmware.burp.extension.BurpApplication  : Started BurpApplication in 52.797 seconds (JVM running for 53.486)
```

At this point we should be good to go. You can close the server with `Ctrl-C`.

## Usage

```
./run.sh

# OR

docker-compose up burp # Logs in foreground

# OR

docker-compose up burp -d # Detached mode
```

Once this is done, you should have burp listening on port `8080`, and the API listening on `8090` (unless you changed these in `docker-compose.yml`)

## Tips & Tricks

* The Swagger API documentation is accessible at http://127.0.0.1:8090/v2/api-docs/
* You can parse it into something pretty with https://editor.swagger.io/
* The [Postman](https://www.getpostman.com/) is your friend
* You need to add a domain to your scope before you can spider it.
* Additional configuration files can be passed through as command line arguments in `docker-compose.yml`
* If you want some X11 forwarded GUI goodness, [checkout how ilyaglow did it](https://github.com/ilyaglow/docker-burp/blob/master/docker-compose.yml), and make sure burp-rest-api is [configured to enable GUI](https://github.com/vmware/burp-rest-api#configuration)

## Improvements

* Fix build, then it's docker multistage build time: https://github.com/vmware/burp-rest-api/issues/32

## You may also enjoy

* [0xdevalias/go-burp-rest](https://github.com/0xdevalias/go-burp-rest) : Golang API client for vmware/burp-rest-api
