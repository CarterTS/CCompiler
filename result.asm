ADD R2, R0, 4096
JL R1, _start
JL R1, main
J __after
~ 46 69 62 62 6F 6E 61 63 69 0A 00
# void update_display()
update_display:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
ADD R3, R0, 32767
ADD R4, R0, 1
SB R3, R4
update_display_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# void halt()
halt:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
ADD R3, R0, 65535
ADD R4, R0, 1
SB R3, R4
halt_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# void insert_char(char val, char x, char y)
insert_char:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
ADD R6, R0, 0
MUL R6, R5, 128
ADD R7, R0, 0
MUL R7, R4, 2
ADD R8, R0, 0
ADD R8, R6, R7
ADD R9, R0, 0
ADD R9, R8, 32768
ADD R10, R0, R9
SB R10, R3
insert_char_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# void clear_display()
clear_display:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
ADD R3, R0, 32
ADD R4, R0, 28672
ADD R5, R0, 28672
ADD R6, R0, 0
SB R5, R6
ADD R6, R0, 28673
ADD R7, R0, 0
SB R6, R7
ADD R8, R0, 0
clear_display_L0:
ADD R6, R0, 1024
ADD R9, R0, 0
CL R9, R8, R6
CE R15, R9, 0
JF R15, clear_display_L1
SUB R2, R2, 2
SW R2, R8
ADD R4, R0, R8
ADD R5, R0, 0
JL R1, insert_char
RW R8, R2
ADD R2, R2, 2
ADD R10, R0, 0
ADD R10, R8, 1
ADD R8, R0, R10
J clear_display_L0
clear_display_L1:
ADD R6, R0, 28672
ADD R7, R0, 0
SB R6, R7
ADD R6, R0, 28673
ADD R7, R0, 0
SB R6, R7
JL R1, update_display
clear_display_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# char put_char(char val)
put_char:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
ADD R4, R0, 0
CE R4, R3, 10
CE R15, R4, 0
JF R15, put_char_L0
ADD R5, R0, 28672
ADD R6, R0, 28672
ADD R7, R0, 0
SB R6, R7
ADD R6, R0, 28673
ADD R7, R0, 28673
ADD R8, R0, 0
RB R8, R7
ADD R9, R0, 0
ADD R9, R8, 1
SB R6, R9
ADD R15, R0, 0
J put_char_ret
put_char_L0:
put_char_L1:
ADD R10, R0, 0
ADD R6, R0, 28672
ADD R11, R0, 0
RB R11, R6
ADD R10, R0, R11
ADD R6, R0, 28673
ADD R12, R0, 0
RB R12, R6
ADD R6, R0, R3
SUB R2, R2, 2
SW R2, R10
ADD R3, R0, R6
ADD R4, R0, R11
ADD R5, R0, R12
JL R1, insert_char
RW R10, R2
ADD R2, R2, 2
ADD R6, R0, 28672
ADD R13, R0, 0
ADD R13, R10, 1
SB R6, R13
put_char_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# void print(char* data)
print:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
ADD R4, R0, R3
ADD R3, R0, R4
print_L0:
ADD R5, R0, 0
RB R5, R3
CE R15, R5, 0
JF R15, print_L1
ADD R6, R0, 0
RB R6, R3
SUB R2, R2, 2
SW R2, R3
ADD R3, R0, R6
JL R1, put_char
RW R3, R2
ADD R2, R2, 2
ADD R7, R0, 0
ADD R7, R3, 1
ADD R3, R0, R7
J print_L0
print_L1:
JL R1, update_display
print_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# void print_number(unsigned char num)
print_number:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
ADD R4, R0, 9
ADD R5, R0, 0
CNLE R5, R3, R4
CE R15, R5, 0
JF R15, print_number_L0
ADD R6, R0, 0
DIV R6, R3, 10
ADD R7, R0, 0
ADD R7, R6, 48
SUB R2, R2, 2
SW R2, R3
ADD R3, R0, R7
JL R1, put_char
RW R3, R2
ADD R2, R2, 2
print_number_L0:
print_number_L1:
ADD R8, R0, 0
DIV R8, R3, 10
ADD R9, R0, 0
MUL R9, R8, 10
ADD R10, R0, 0
SUB R10, R3, R9
ADD R3, R0, R10
ADD R11, R0, 0
ADD R11, R3, 48
ADD R3, R0, R11
JL R1, put_char
JL R1, update_display
print_number_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# char fibb(int n)
fibb:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
ADD R4, R0, 2
ADD R5, R0, 0
CL R5, R3, R4
CE R15, R5, 0
JF R15, fibb_L0
ADD R15, R0, 1
J fibb_ret
fibb_L0:
fibb_L1:
ADD R6, R0, 0
SUB R6, R3, 1
SUB R2, R2, 2
SW R2, R3
ADD R3, R0, R6
JL R1, fibb
ADD R7, R0, R15
RW R3, R2
ADD R2, R2, 2
ADD R8, R0, 0
SUB R8, R3, 2
SUB R2, R2, 2
SW R2, R7
ADD R3, R0, R8
JL R1, fibb
ADD R4, R0, R15
RW R7, R2
ADD R2, R2, 2
ADD R9, R0, 0
ADD R9, R7, R4
ADD R15, R0, R9
fibb_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# int main()
main:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
JL R1, clear_display
ADD R3, R0, 16
JL R1, print
ADD R4, R0, 0
ADD R4, R0, 0
main_L0:
ADD R5, R0, 10
ADD R6, R0, 0
CL R6, R4, R5
CE R15, R6, 0
JF R15, main_L1
SUB R2, R2, 2
SW R2, R4
ADD R3, R0, R4
JL R1, fibb
RW R4, R2
ADD R2, R2, 2
SUB R2, R2, 2
SW R2, R4
ADD R3, R0, R15
JL R1, print_number
RW R4, R2
ADD R2, R2, 2
SUB R2, R2, 2
SW R2, R4
ADD R3, R0, 10
JL R1, put_char
RW R4, R2
ADD R2, R2, 2
ADD R7, R0, 0
ADD R7, R4, 1
ADD R4, R0, R7
J main_L0
main_L1:
main_L2:
ADD R5, R0, 1
CE R15, R5, 0
JF R15, main_L3
J main_L2
main_L3:
ADD R15, R0, 0
main_ret:
RW R1, R2
ADD R2, R2, 2
J R1


# void _start()
_start:
SUB R2, R2, 2
SW R2, R1
ADD R1, R0, 0
ADD R15, R0, 0
_start_ret:
RW R1, R2
ADD R2, R2, 2
J R1

__after:

