[![Watch the video](https://img.youtube.com/vi/83VYfRomgRI/0.jpg)](https://www.youtube.com/watch?v=83VYfRomgRI&t=5s)

## What does it do?
This example is used to show how to communicate from the FPGA chip to your computer using a USB-C cable with the [UART protocol](https://en.wikipedia.org/wiki/Universal_asynchronous_receiver-transmitter).  
Its sending out the character '%' repeatedly all the time. If you press any keys on the keyboard, the output won't change because this example is just used to transmit to the PC, not to receive any data from the PC.

You can edit the uart_trx.v file, line 43, with binary code for other ASCII characters, if you like.

## Testing on Linux terminal
Install PuTTY using 
```sh
sudo apt-get update
sudo apt-get install putty -y
```
While invoking putty command line, you might get error that Fonts are not present. In that case, invoke putty with below env variables:
```sh
env GDK_BACKEND=x11 putty
```
By default, the serial port will be /dev/ttyUSB0. If not, you can check using the dmesg command and grep for tty, to get the active serial port.
Use a baud rate of 9600Hz as shown in my video.

![Screenshot](https://github.com/adinath-verilog/FPGA_mini/blob/main/Chapter_4_Serial_Communication_UART/Screenshot%20from%202025-04-04%2012-47-59.png)

## How does it work?
The UART protocol is implemented in the module uart_trx.v file.
It works in one direction only, i.e., it sends data without having a provision to receive the data back from the receiver.
For UART to work, the baud rate should be the same on both the transmitting and receiving side.
Here the baud rate is 9600 Hz.

