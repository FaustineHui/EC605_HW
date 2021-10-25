	    .8byte				//    PRESERVE8

	    .global Fib_array	// Export symbol

Fib_array:           // X0 -> first parameter

/************Begin Implementation here**************/
        add x1,xzr,xzr
        stur x1,[x0,0]
        add x1,x1,1
        stur x1,[x0,8]
        add x2,x1,1
LOOP:
        sub x4,x2,32
        cbz x4,END
        lsl x5,x2,3
        add x5,x5,x0
        sub x6,x2,1
        sub x7,x2,2
        lsl x6,x6,3
        lsl x7,x7,3
        add x6,x6,x0
        add x7,x7,x0
        ldur x8,[x6,0]
        ldur x9,[x7,0]
        add x10,x9,x8
        stur x10,[x5,0]
        add x2,x2,1
        b LOOP


/************End Implementation here****************/
END:
// This returns back to C code
	BR x30