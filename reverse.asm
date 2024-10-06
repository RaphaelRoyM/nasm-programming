section .data
	msg1 db 'enter a string',0xa
	lenmsg1 equ $-msg1
	
	msg2 db 'entered string is '
	lenmsg2 equ $-msg2
	
	msg3 db 0xa,'reversed string is '
	lenmsg3 equ $-msg3

section .bss
	msg11 resb 100
	reversed resb 100

section .text
	global _start

_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg1
	mov edx,lenmsg1
	int 0x80
	
	mov eax,3
	mov ebx,1
	mov ecx,msg11
	mov edx,100
	int 0x80
	
	mov byte [ecx+eax-1],0
	mov ecx,eax
	dec ecx
	
	mov esi,msg11
	add esi,ecx
	;dec esi
	mov edi,reversed
	
reverse:
	mov al,[esi]
	mov [edi],al
	dec esi
	inc edi
	dec ecx
	jnz reverse
	
	mov byte [edi],0

	mov eax,4
	mov ebx,1
	mov ecx,msg2
	mov edx,lenmsg2
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,msg11
	mov edx,100
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,msg3
	mov edx,lenmsg3
	int 0x80
	
	mov eax,4
	mov ebx,1
	mov ecx,reversed
	mov edx,100
	int 0x80
	
	mov eax,1
	xor ebx,ebx
	int 0x80
