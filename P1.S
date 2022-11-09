/*.global start
        .bss
Z:      .space 4
        .text
X:      .word 0x03
Y:      .word 0x0A
//Z:      .space 4
start:
        @ if (X > Y)
        ldr r0, X
        ldr r1,
        cmp r0, r1
        ble L1
        @ then Z = X - Y
        ldr r0, X
        ldr r1, Y
        sub r0, r0, r1
        ldr r3, =Z
        str r0, [r3]

        @ else Z = Y - X
L1:     ldr r0, X
        ldr r1, Y
        sub r1, r1, r0
        ldr r3, =Z
        str r1, [r3]

        B .
        .end


*/
         .global start
        .equ N,8
        .data
A: 		.word 7,3, 25, 4, 75, 2, 1, 1
		.bss
max: 		.space 4
imax:	    .space 4
sum:        .space 4
		.text
start:
		ldr r0,=A       	 // r0 = dirección de A
		ldr r2, [r0]      // A[0]
		mov r1, #0    	// imax
		mov r3, r2     // max = A[0]
		mov r4, r2     // sum = A[0]

		mov r5,#1 // int i=1 ....R5=i
LO:     cmp r5,#N //i>N
		bge L1  //saltamos y salimos del bucle

		ldr r6,[r0,r5,lsl#2] //R6 => A[i]
		add r4,r4,r6 //sum=sum+A[i]
		//IF
		cmp r6,r3 //comparamos registros
		ble L2 //si A[i]>max saltamos a L2

		ldr r1, =imax //cargamos la direccion imax
		ldr r5,[r5] //cargamos valor de i
		str r5,[r1] //guardamos el valor de i en la direrccion de imax

		ldr r3, =max //cargamos dirreccion de max
		ldr r6, [r6] //cargamos valor de A[i]
		str r6,[r3]  //guardamos valor de A[i] en dirrecion de max
		b LO
L2:   	add r4, r4,#1
		ldr r0, =sum
		str r4, [r0]
		ldr r0, =imax
		str r1, [r0]
		ldr r0, =max
		str r3, [r0]
L1: 	b .
		.end
