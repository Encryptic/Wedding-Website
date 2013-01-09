# _Project_

This Application is a simple Wedding Website written in Ruby on Rails

It features a simple CMS that requires all markup to be in HTML.  The it also includes a simple login system that uses
a user account created the first time you attempt to login.

Recently I've begun work on the last component which is a RSVP system integrated in for tracking whether your guests will be attending or not.

## Project Setup

1. _To setup the project on your system, install the required gems_
2. _When you perform your initial setup the code is designed to force you to create an account the first time you connect by going to /users/new_

## Deploying
- _Presently this project uses Capistrano to perform the deployment. The current Deploy.rb is included as an examples, but it will need to be modified for your server._

### _How to setup the deployment environment_

- _This application is designed to run on Ruby on Rails v3.2.9_
- _It should be compatible with Ruby v1.8.7 and v1.9.3, however, I use v1.8 in all of my testing._
- _Monitoring services and logging._

## License

_The source code for this application is free to use for any purposes.  I plan to move it under an official license soon, possibly MIT._
