section .data
	msg4input db 'enter the word to toggle',0xa
	lenmsg4input equ $-msg4input
	
section .bss
	str1 resb 100
	
section .text
	global _start
	
_start:
	mov eax,4
	mov ebx,1
	mov ecx,msg4input
	mov edx,lenmsg4input
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,str1
	mov edx,100
	int 0x80
	
	mov byte[ecx+eax-1],0
	mov esi,str1
	
toggle:
	mov al,[esi]
	test al,al
	jz print
	cmp al,'a'
	jl upper
	cmp al,'z'
	jg store
	sub al,32
	jmp store
upper:
	cmp al,'A'
	jl store
	cmp al,'Z'
	jg store
	add al,32
store:
	mov [esi],al
	inc esi
	jmp toggle
	
print:
	mov eax,4
	mov ebx,1
	mov ecx,str1
	mov edx,100
	int 0x80
	
exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
