%macro DEFS 0
global _main
extern _fopen
extern _fclose
extern _fputs
extern _strlen
%endmacro
%macro DATA 0
section .data
data:
db \
	'%macro DEFS 0', 0,\
	'global _main', 0,\
	'extern _fopen', 0,\
	'extern _fclose', 0,\
	'extern _fputs', 0,\
	'extern _strlen', 0,\
	'%endmacro', 0,\
	'%macro DATA 0', 0,\
	'section .data', 0,\
	'data:', 0,\
	'db \', 0,\
	0,\
	'line_feed: db 10, 0', 0,\
	'pre_data: db 9, 39, 0', 0,\
	'post_data: db 39, 44, 32, 48, 44, 92, 10, 0', 0,\
	'junction: db 9, 48, 44, 92, 10, 0', 0,\
	'data_end: db 9, 48, 10, 0', 0,\
	'kid: db 71, 114, 97, 99, 101, 95, 107, 105, 100, 46, 115, 0', 0,\
	'mode: db 119, 0', 0,\
	'%endmacro', 0,\
	'%macro MAIN 0', 0,\
	'section .text', 0,\
	'_main:', 0,\
	'push rbp', 0,\
	'mov rbp, rsp', 0,\
	'make_kid:', 0,\
	'lea rdi, [rel kid]', 0,\
	'lea rsi, [rel mode]', 0,\
	'call _fopen', 0,\
	'cmp rax, 0', 0,\
	'je return', 0,\
	'mov r14, rax', 0,\
	'lea r12, [rel data]', 0,\
	'print_code1:', 0,\
	'mov rdi, r12', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'mov rdi, r12', 0,\
	'call _strlen', 0,\
	'add r12, rax', 0,\
	'inc r12', 0,\
	'lea rdi, [rel line_feed]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'cmp [r12], byte 0', 0,\
	'jne print_code1', 0,\
	'inc r12', 0,\
	'mov r13, r12 ;saves rest of data in r13', 0,\
	'lea r12, [rel data]', 0,\
	'print_data1:', 0,\
	'lea rdi, [rel pre_data]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'mov rdi, r12', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'mov rdi, r12', 0,\
	'call _strlen', 0,\
	'add r12, rax', 0,\
	'inc r12', 0,\
	'lea rdi, [rel post_data]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'cmp [r12], byte 0', 0,\
	'jne print_data1', 0,\
	'lea rdi, [rel junction]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'mov r12, r13', 0,\
	'print_data2:', 0,\
	'lea rdi, [rel pre_data]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'mov rdi, r12', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'mov rdi, r12', 0,\
	'call _strlen', 0,\
	'add r12, rax', 0,\
	'inc r12', 0,\
	'lea rdi, [rel post_data]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'cmp [r12], byte 0', 0,\
	'jne print_data2', 0,\
	'lea rdi, [rel data_end]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'mov r12, r13', 0,\
	'print_code2:', 0,\
	'mov rdi, r12', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'mov rdi, r12', 0,\
	'call _strlen', 0,\
	'add r12, rax', 0,\
	'inc r12', 0,\
	'lea rdi, [rel line_feed]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
	'cmp [r12], byte 0', 0,\
	'jne print_code2', 0,\
	'close_kid:', 0,\
	'mov rdi, r14', 0,\
	'call _fclose', 0,\
	'return:', 0,\
	'pop rbp', 0,\
	'ret', 0,\
	'%endmacro', 0,\
	'DEFS', 0,\
	'DATA', 0,\
	'MAIN', 0,\
	0
line_feed: db 10, 0
pre_data: db 9, 39, 0
post_data: db 39, 44, 32, 48, 44, 92, 10, 0
junction: db 9, 48, 44, 92, 10, 0
data_end: db 9, 48, 10, 0
kid: db 71, 114, 97, 99, 101, 95, 107, 105, 100, 46, 115, 0
mode: db 119, 0
%endmacro
%macro MAIN 0
section .text
_main:
push rbp
mov rbp, rsp
make_kid:
lea rdi, [rel kid]
lea rsi, [rel mode]
call _fopen
cmp rax, 0
je return
mov r14, rax
lea r12, [rel data]
print_code1:
mov rdi, r12
mov rsi, r14
call _fputs
mov rdi, r12
call _strlen
add r12, rax
inc r12
lea rdi, [rel line_feed]
mov rsi, r14
call _fputs
cmp [r12], byte 0
jne print_code1
inc r12
mov r13, r12 ;saves rest of data in r13
lea r12, [rel data]
print_data1:
lea rdi, [rel pre_data]
mov rsi, r14
call _fputs
mov rdi, r12
mov rsi, r14
call _fputs
mov rdi, r12
call _strlen
add r12, rax
inc r12
lea rdi, [rel post_data]
mov rsi, r14
call _fputs
cmp [r12], byte 0
jne print_data1
lea rdi, [rel junction]
mov rsi, r14
call _fputs
mov r12, r13
print_data2:
lea rdi, [rel pre_data]
mov rsi, r14
call _fputs
mov rdi, r12
mov rsi, r14
call _fputs
mov rdi, r12
call _strlen
add r12, rax
inc r12
lea rdi, [rel post_data]
mov rsi, r14
call _fputs
cmp [r12], byte 0
jne print_data2
lea rdi, [rel data_end]
mov rsi, r14
call _fputs
mov r12, r13
print_code2:
mov rdi, r12
mov rsi, r14
call _fputs
mov rdi, r12
call _strlen
add r12, rax
inc r12
lea rdi, [rel line_feed]
mov rsi, r14
call _fputs
cmp [r12], byte 0
jne print_code2
close_kid:
mov rdi, r14
call _fclose
return:
pop rbp
ret
%endmacro
DEFS
DATA
MAIN
