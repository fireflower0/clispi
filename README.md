# clispi

Framework for electronic work on Raspberry Pi

## Description

A framework that makes it easy to perform electronic work using Common Lisp on Raspberry Pi.

## Requirement

* [Wiringpi](http://wiringpi.com/)
* [Roswell](https://github.com/roswell/roswell)

## Installation

Install roswell and clispi

```
$ wget https://raw.githubusercontent.com/fireflower0/clispi/master/installer.sh
$ chmod u+x installer.sh
$ ./installer.sh
$ source .bashrc
```

## Update

Update clispi

```
$ ros update clispi
```

## Usage

```
$ cd .roswell/local-projects/
$ mkdir <user name>
$ cd <user name>
$ clispi new <project name>
$ cd <project name>
```

## Example

Edit `app.lisp`  
Added the following code

```
(defconstant +pin+ 11)

(defun main ()
  (wiringpi-setup-gpio)
  (pin-mode +pin+ +output+)

  ;; Infinite loop (Ctrl-c exits loop)
  (loop
     (digital-write +pin+ 1)   ; Turn on LED
     (delay 500)               ; Delay 500(ms)
     (digital-write +pin+ 0)   ; Turn off LED
     (delay 500)))             ; Delay 500(ms)
```

Start REPL

```
$ ros run
```

Run the following in REPL

```
(ql:quickload :<project name>)
(<project name>:start)
```

### Roswell Script

Can also use Roswell Script as follows

```
cd roswell
chmod u+x <file name>
./<file name>
```

## Author

fireflower0

## License

MIT
