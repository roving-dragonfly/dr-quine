global _main
extern _printf
section .data
data:
db \
	'global _main', 0,\
	'extern _printf', 0,\
	'section .data', 0,\
	'data:', 0,\
	'db \', 0,\
	0,\
	'fmt_code: db 37, 115, 10, 0', 0,\
	'fmt_data: db 9, 39, 37, 115, 39, 44, 32, 48, 44, 92, 10, 0', 0,\
	'junction: db 9, 48, 44, 92, 10, 0', 0,\
	'data_end: db 9, 48, 10, 0', 0,\
	'section .text', 0,\
	'_main:', 0,\
	'push rbp', 0,\
	'mov rbp, rsp', 0,\
	'lea r12, [rel data] ;r12, r13, r14 not modified at call', 0,\
	'lea r13, [rel fmt_code]', 0,\
	'print_code1:', 0,\
	'mov rsi, r12', 0,\
	'mov rdi, r13', 0,\
	'call _printf', 0,\
	'add r12, rax', 0,\
	'cmp [r12], byte 0', 0,\
	'jne print_code1', 0,\
	'inc r12', 0,\
	'mov r14, r12', 0,\
	'lea r12, [rel data]', 0,\
	'lea r13, [rel fmt_data]', 0,\
	'print_data1:', 0,\
	'mov rsi, r12', 0,\
	'mov rdi, r13', 0,\
	'call _printf', 0,\
	'add r12, rax', 0,\
	'sub r12, 8', 0,\
	'cmp [r12], byte 0', 0,\
	'jne print_data1', 0,\
	'inc r12', 0,\
	'lea r13, [rel fmt_data]', 0,\
	'print_junction:', 0,\
	'lea rdi, [rel junction]', 0,\
	'call _printf', 0,\
	'print_data2:', 0,\
	'mov rsi, r12', 0,\
	'mov rdi, r13', 0,\
	'call _printf', 0,\
	'add r12, rax', 0,\
	'sub r12, 8', 0,\
	'cmp [r12], byte 0', 0,\
	'jne print_data2', 0,\
	'print_data_end:', 0,\
	'lea rdi, [rel data_end]', 0,\
	'call _printf', 0,\
	'mov r12, r14', 0,\
	'lea r13, [rel fmt_code]', 0,\
	'print_code2:', 0,\
	'mov rsi, r12', 0,\
	'mov rdi, r13', 0,\
	'call _printf', 0,\
	'add r12, rax', 0,\
	'cmp [r12], byte 0', 0,\
	'jne print_code2', 0,\
	'pop rbp', 0,\
	'ret', 0,\
	0
fmt_code: db 37, 115, 10, 0
fmt_data: db 9, 39, 37, 115, 39, 44, 32, 48, 44, 92, 10, 0
junction: db 9, 48, 44, 92, 10, 0
data_end: db 9, 48, 10, 0
section .text
_main:
push rbp
mov rbp, rsp
lea r12, [rel data] ;r12, r13, r14 not modified at call
lea r13, [rel fmt_code]
print_code1:
mov rsi, r12
mov rdi, r13
call _printf
add r12, rax
cmp [r12], byte 0
jne print_code1
inc r12
mov r14, r12
lea r12, [rel data]
lea r13, [rel fmt_data]
print_data1:
mov rsi, r12
mov rdi, r13
call _printf
add r12, rax
sub r12, 8
cmp [r12], byte 0
jne print_data1
inc r12
lea r13, [rel fmt_data]
print_junction:
lea rdi, [rel junction]
call _printf
print_data2:
mov rsi, r12
mov rdi, r13
call _printf
add r12, rax
sub r12, 8
cmp [r12], byte 0
jne print_data2
print_data_end:
lea rdi, [rel data_end]
call _printf
mov r12, r14
lea r13, [rel fmt_code]
print_code2:
mov rsi, r12
mov rdi, r13
call _printf
add r12, rax
cmp [r12], byte 0
jne print_code2
pop rbp
ret
