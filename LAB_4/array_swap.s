    .8byte    
    .global array_swap    // Export symbol

array_swap:           // X0 -> first parameter
                      // X1 -> output array_ptr

/************Begin Implementation here**************/
        sub x1,x0,256
        add x2,xzr,xzr //x2=i=0
LOOP:
        sub x3,x2,16
        cbz x3,END
        sub x4,x2,31
        sub x4,xzr,x4 //x4=31-i
        lsl x5,x2,3 //x5=i*8
        lsl x6,x4,3 //x6=(31-i)*8
        add x5,x5,x0
        add x6,x6,x0
        ldur x7,[x5,0] //x7=A[i]
        ldur x8,[x6,0] //x8=A[31-i]
        stur x8,[x5,0]
        stur x7,[x6,0]
        add x2,x2,1
        b LOOP


/************End Implementation here****************/
END:
// This returns back to C code
    BR x30