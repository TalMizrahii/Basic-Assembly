# Ex2 - Computer Systems course


<h1 align="center">
  

  Computer Systems
  <br>
</h1>

<h4 align="center">This gitHub repository is for the second assignments given in Computer Systems course, Bar Ilan University.


<p align="center">
  <a href="#description">Description</a> •
  <a href="#installing-and-executing">Installing And Executing</a> •
  <a href="#authors">Authors</a> 
</p>

## Description

This is my first assembly project for the Computer Systems course at Bar Ilan university.

The project contains four parts:
* Print your id number (a 9-digits decimal number).
* Take the second number in your id number. If its even, divide the id number by three and print the reminder. Otherwise, multiply th id number by three and print it.
* Xor the first and third bytes in id. If the unsigned result is greater then 127, print 'True', otherwise, print 'False'.
* count the number of 1's in the fourth byte of the id number and print it.

For example, if id is 123456789, the output of the program is:

123456789

370370367

False

3


## Installing And Executing

To clone and run this application, you'll need to use [Git](https://git-scm.com) and the [gcc](https://gcc.gnu.org/) compiler. From your command line:

```bash
# Clone this repository.
$ git clone https://github.com/TalMizrahii/Ex2ComputerSystems

# Go into the repository.
$ cd Ex2ComputerSystems

# Compile the program.
$ gcc main.s

# Run the program (Linux).
$ ./a.out
```
```bash
# Run the program (Windows).
$ a.out
```


## Author
* [@Tal Mizrahi](https://github.com/TalMizrahii)


