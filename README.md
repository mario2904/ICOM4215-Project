# ICOM4215-Project

This is a class project for the class of Computer Architecture. The project consist of the simulation of a subset of instructions of the ARM architecture. The tool used for simulation is Icarus Verilog.

## Design Specifications

### Hardware

* RAM
  * Size of 256 Bytes
  * Big endian
  * Access to Bytes, Halfwords, Words and Doublewords
* Control Unit
  * Hardwired

### Instruction Set

* Data Processing
  * 32-bit Immediate Shifter Operand
  * Shift by Immediate Shifter Operand
* Load and Store Word or Unsigned Byte
  * [\<Rn>,# +/-\<offset_12>] Immediate Offset
  * [\<Rn>,# +/-\<Rm>] Register Offset
  * [\<Rn>,# +/-\<offset_12>]! Immediate Pre-Indexed
  * [\<Rn>,# +/-\<Rm>]! Register Pre-Indexed
  * [\<Rn>],# +/-\<offset_12> Immediate Post-Indexed
  * [\<Rn>],# +/-\<Rm> Register Post-Indexed
* Miscellaneous Load and Store Signed Byte, Signed Halfword and Doubleword
  * [\<Rn>,# +/-\<offset_8>] Immediate Offset
  * [\<Rn>,# +/-\<offset_8>]! Immediate Pre-Indexed
  * [\<Rn>],# +/-\<offset_8> Immediate Post-Indexed
  * [\<Rn>,# +/-\<Rm>] Register Offset
  * [\<Rn>,# +/-\<Rm>]! Register Pre-Indexed
  * [\<Rn>],# +/-\<Rm> Register Post-Indexed
* Branch and Branch & Link

##### Check the [doc](https://github.com/mario2904/ICOM4215-Project/tree/master/doc) directory to see the design documents and schematics.

## Requirements

Have Icarus Verilog installed on your machine, found [here](http://iverilog.icarus.com/)

> To verify the installation run the following command in your terminal or command prompt.

```bash
iverilog -v
```

## Building

Clone this project to your machine and go to the project directory.

```bash
git clone https://github.com/mario2904/ICOM4215-Project.git && cd ICOM4215-Project
```

Go to the src/ directory.

```bash
cd src
```

Compile the source code.

```bash
iverilog -o main -c file_list.txt
```

## Running

Run the following command from the src/ directory.

```bash
vvp main
```

To save the output of the simulation, you can just redirect the output to a designated file.

```bash
vvp main > output.txt
```

## Customize

By default it will load the 32-bit binary test instructions that are located in **test/input/testcode_arm1.txt**  to RAM and execute them. You can change the instructions directly on that file or create another file with your custom test instructions and change the line **95** of the source file **src/datapath/ram_256.v** to : **fd = $fopen("path/to/custom/test.txt", "r");**. Be sure to follow the same structure as is in the default test file.

## Team Members

* Mario Orbegoso Villanueva
* Edgardo A. Rivera Rivera
* Kevin Santiago Ortiz
