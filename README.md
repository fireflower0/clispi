# clispi

Framework for electronic work on Raspberry Pi

## Description

A framework that makes it easy to perform electronic work using Common Lisp on Raspberry Pi.

## Requirement

* [Wiringpi](http://wiringpi.com/)
* [Roswell](https://github.com/roswell/roswell)
* [qlot](https://github.com/fukamachi/qlot)

## Installation

```
$ ros install fireflower0/clispi
```

## Usage

```
$ clispi new <project name>
$ cd <project name>
$ qlot install
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

Start REPL with `M-x slime-qlot-exec`  
Run the following in REPL

```
(ql:quickload :<project name>)
(<project name>:start)
```

## Author

fireflower0

## License

MIT
