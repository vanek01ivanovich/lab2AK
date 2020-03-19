.global lab1
.syntax unified
#define P0_DATA #2
#define P1_DATA #7
#define P2_DATA #1
#define P3_DATA #2
// (a&b) >> + c!
lab1:
push {lr}
//calc
mov r0, P0_DATA
mov r1, P1_DATA
mov r2, P2_DATA
mov r3, P3_DATA
bl Calc
pop {pc}

Calc:
push {r4, r5, lr}
mov r4, r0 //save D0
rev r0, r0
and r1, r2
lsr r1, 1
adds r0, r1
//factorial
mov r5, r0
mov r0, r4 //D0
bl Factorial
add r0, r5
pop {r4, r5, pc}

Factorial:
push {r4}
mov r4, 3

.fact_calc:
mul r4, r0
subs r0, #1
bne .fact_calc
mov r0, r4
pop {r4}
bx lr
