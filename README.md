# ARM-Assembly-Code
First approaches
We are going to create our first eclipse project, which will assemble and link a program written in assembly language and we will test and debug it on the Raspberry Pi board. The goal is to create an assembly program equivalent to the following C code:

int X = 3;
int Y = 10;
int Z;
if (X > Y)
Z=X-Y;
else
Z=Y-X;

To do this, we need to create an eclipse project. To this project we will include a source file P1a.S with the following code:

.global start
.text
X: .word 0x03
AND: .word 0x0A
Z: .space 4
start:
@if (X > Y)
ldr r0, X
ldr r1, Y
cmp r0, r1
ble L1
@then Z = X - Y
ldr r0, X
ldr r1, Y
sub r0, r0, r1
str r0, Z
@ else Z = Y - X
L1: ldr r0, X
ldr r1, Y
sub r1, r1, r0
str r1, Z
B.
.end

We will also add to the project a linking file called memmap with the following contents:

MEMORY
{
ram : ORIGIN = 0x8000, LENGTH = 0x1000
}
SECTIONS
{
.text : { *(.text*) } > ram
.data : { *(.data*) } > ram
.bss : { *(.bss*) } > ram
}

We must remember to select the memmap file as the link script and check that the project compiles and links without errors.

//--------------------------------------------------------------------------------------------------------------------------------------------------------

Second part:

The source code file of the new project must have an assembly implementation of the following program, which calculates for an array A the maximum value and its position, as well as the sum of its elements:

#define N 8
int A[N]={7,3,25,4,75,2,1,1};
int sum = 0;
intmax;
int imax;
int i;
i max = 0;
max = A[0];
sum = A[0];
for (i = 1; i < N; i++) {
sum += A[i];
if (A[i] > max) {
i max = i;
max = A[i];
}
}

As a final exercise we will modify the program so that it also calculates the sum of the even elements, storing the result of the sum in a new sum variable. We remember that the binary representation of an even number has the least significant bit at 0, while for an odd number this bit is 1, so by making an and between said number and 1 we will obtain 0 if the number is even, and 1 otherwise.

Thanks for reading!
