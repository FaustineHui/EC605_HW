	.8byte				//    PRESERVE8

	.global array_even_odd  // Export symbol

array_even_odd:             // X0 -> input array_ptr

/************Begin Implementation here**************/
        add x1,xzr,xzr //x1=i=0
LOOP1:
        sub x2,x1,32
        cbz x2,END1
        lsl x3,x2,3
        add x3,x3,x0
        ldur x4,[x3,0]
        lsl x4,x4,1
        stur x3,[x3,0]
        add x1,x1,2
        b LOOP1
END1:
        add x5,xzr,1
LOOP2:
        sub x6,x5,33
        cbz x6,END2
        lsl x7,x5,3
        add x7,x7,x0
        ldur x8,[x7,0]
        lsr x8,x8,1
        stur x8,[x7,0]
        add x5,x5,2
        b LOOP2
/************End Implementation here****************/
END2:
// This returns back to C code
	BR x30