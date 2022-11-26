# Ex2 - Computer Systems course


<h1 align="center">
  

  Computer Systems
  <br>
</h1>

<h4 align="center">This gitHub repository is for the assignments given in Computer Systems course, Bar Ilan University.


<p align="center">
  <a href="#description">Description</a> •
  <a href="#implementation">Implementation</a> •
  <a href="#dependencies">Dependencies</a> •
  <a href="#installing-and-executing">Installing And Executing</a> •
  <a href="#authors">Authors</a> 
</p>

## Description

This program represents a chat group users can join, write messages and change their names. 
No parallelism performed in the program, so only when a user interacts with the Server, he receives all updates sent to him since he joined the group.

The Server's purpose is to manage the group's data, store current group members and their names, store pending messages, and be responsible for checking if the client sent a message in the correct format.

The Client receives the Server's port number and IP, and the Server the port number as a system arguments.

commends:
* To join the group: 1 [Name]
* To send a message: 2 [Message]
* To change my name: 3 [New Name]
* To exit the group: 4
* To receive all pending messages: 5

Any message not by the format specified above will be replied by the server an "Illegal request" message.
  
  A full run example:
  
<img width="618" alt="Capture" src="https://user-images.githubusercontent.com/103560553/203810324-cacafd9f-34ee-45ea-b3de-bf99a59ffec7.PNG">


## Implementation

### The Client module
The Client receives the Server's port and ip numbers as system arguments.

He connects to the server via "sendto()" method, and sends him a message.
If the Client wants to exit the program (command 4), it closes the module and finishes the program.

### The Server module

The Server receives a port number as a system argument. It binds it to the Server's socket.

For every message the Server receives from a client, we use several integrity checks to validate the string. 
If the string does not pass the integrity checks, we print an eror massage and then the client can try again.

The integrity checks include:

* If the request is by format.
* If the request is to join the group, but the user is already in it.
* If the request is to preform an action by a nonmember of the group (except joining the group).

## Dependencies

* The program build and tested for linux machines.
* Except "socket" and "sys", no other libraries where used.

## Installing And Executing

To clone and run this application, you'll need [Git](https://git-scm.com) installed on your computer. From your command line:

```bash
# Clone this repository.
$ git clone https://github.com/TalMizrahii/VirtualChat

# Go into the repository.
$ cd VirtualChat
```

```bash
# Run the server.
server.py [servers port number]
```

```bash
# Run the client.
Client.py [server's ip] [servers port number]
```
  You can use localhost ip 127.0.0.1 and port number 12345 as run example.


## Authors
* [@Yuval Arbel](https://github.com/YuvalArbel1)
* [@Tal Mizrahi](https://github.com/TalMizrahii)


