%define SULLY_N 5
global _main
extern _fopen
extern _fclose
extern _fputs
extern _strlen
extern _system
extern _sprintf	
section .data
data:
db \
	'global _main', 0,\
	'extern _fopen', 0,\
	'extern _fclose', 0,\
	'extern _fputs', 0,\
	'extern _strlen', 0,\
	'extern _system', 0,\
	'section .data', 0,\
	'data:', 0,\
	'db', 0,\
	0,\
	'fmt_kid: db 83, 117, 108, 108, 121, 45, 37, 100, 46, 115, 0', 0,\
	'fmt_def: db 37, 37, 100, 101, 102, 105, 110, 101, 32, 83, 85, 76, 76, 89, 95, 78, 32, 37, 100, 10, 0', 0,\
        'mode: db 119, 0', 0,\
	'line_feed: db 10, 0', 0,\
	'pre_data: db 9, 39, 0', 0,\
	'post_data: db 39, 44, 32, 48, 44, 92, 10, 0', 0,\
	'junction: db 9, 48, 44, 92, 10, 0', 0,\
	'data_end: db 9, 48, 10, 0', 0,\
        'section .bss', 0,\
	'kid_name: resb 128', 0,\
	'sully_def: resb 128', 0,\
        'section .text', 0,\
	'_main:', 0,\
	'push rbp', 0,\
	'mov rbp, rsp', 0,\
	'mov rdi, SULLY_N', 0,\
	'cmp rdi, 0', 0,\
	'jl return', 0,\
	'lea rdi, [rel kid_name]', 0,\
	'lea rsi, [rel fmt_kid]', 0,\
	'mov rdx, SULLY_N', 0,\
	'call _sprintf', 0,\
	'open_kid:', 0,\
	'lea rdi, [rel kid_name]', 0,\
	'lea rsi, [rel mode]', 0,\
	'call _fopen', 0,\
	'cmp rax, 0', 0,\
	'je return', 0,\
	'mov r14, rax', 0,\
	'lea r12, [rel data]', 0,\
	'print_def:', 0,\
	'lea rdi, [rel sully_def]', 0,\
	'lea rsi, [rel fmt_def]', 0,\
	'mov rdx, SULLY_N', 0,\
	'dec rdx', 0,\
	'call _sprintf', 0,\
	'lea rdi, [rel sully_def]', 0,\
	'mov rsi, r14', 0,\
	'call _fputs', 0,\
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
	'mov r13, r12', 0,\
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
        0
fmt_kid: db 83, 117, 108, 108, 121, 95, 37, 100, 46, 115, 0
fmt_def: db 37, 37, 100, 101, 102, 105, 110, 101, 32, 83, 85, 76, 76, 89, 95, 78, 32, 37, 100, 10, 0
mode: db 119, 0
line_feed: db 10, 0
pre_data: db 9, 39, 0
post_data: db 39, 44, 32, 48, 44, 92, 10, 0
junction: db 9, 48, 44, 92, 10, 0
data_end: db 9, 48, 10, 0
section .bss
kid_name: resb 128
sully_def: resb 128
; do i need to preserve r12 && shiet ?	
section .text
_main:
	push	rbp
	mov	rbp, rsp
	mov	rdi, SULLY_N
	cmp	rdi, 0
	jl	return
	lea	rdi, [rel kid_name]
	lea	rsi, [rel fmt_kid]
	mov	rdx, SULLY_N
	call	_sprintf
open_kid:
	lea	rdi, [rel kid_name]
	lea	rsi, [rel mode]
	call	_fopen
	cmp	rax, 0
	je	return
	mov	r14, rax
	lea	r12, [rel data]
print_def:
	lea	rdi, [rel sully_def]
	lea	rsi, [rel fmt_def]
	mov	rdx, SULLY_N
	dec	rdx
	call	_sprintf
        lea	rdi, [rel sully_def]
	mov	rsi, r14
	call	_fputs
print_code1:
	mov	rdi, r12
	mov	rsi, r14
	call	_fputs
	mov	rdi, r12
	call	_strlen
	add	r12, rax
	inc	r12
	lea	rdi, [rel line_feed]
	mov	rsi, r14
	call	_fputs
	cmp	[r12], byte 0
	jne	print_code1
	inc	r12
	mov	r13, r12
	lea	r12, [rel data]
print_data1:
	lea	rdi, [rel pre_data]
	mov	rsi, r14
	call	_fputs
	mov	rdi, r12
	mov	rsi, r14
	call	_fputs
	mov	rdi, r12
	call	_strlen
	add	r12, rax
	inc	r12
        lea	rdi, [rel post_data]
	mov	rsi, r14
	call	_fputs
	cmp	[r12], byte 0
	jne	print_data1
	lea	rdi, [rel junction]
	mov	rsi, r14
	call	_fputs
	mov	r12, r13
print_data2:
	lea	rdi, [rel pre_data]
	mov	rsi, r14
	call	_fputs
	mov	rdi, r12
	mov	rsi, r14
	call	_fputs
	mov	rdi, r12
	call	_strlen
	add	r12, rax
	inc	r12
	lea	rdi, [rel post_data]
	mov	rsi, r14
	call	_fputs
	cmp	[r12], byte 0
	jne	print_data2
	lea	rdi, [rel data_end]
	mov	rsi, r14
	call	_fputs
	mov	r12, r13
print_code2:
	mov	rdi, r12
	mov	rsi, r14
	call	_fputs
	mov	rdi, r12
	call	_strlen
	add	r12, rax
	inc	r12
	lea	rdi, [rel line_feed]
	mov	rsi, r14
	call	_fputs
	cmp	[r12], byte 0
	jne	print_code2
close_kid:
	mov	rdi, r14
	call	_fclose
return:
        pop	rbp
 	ret
