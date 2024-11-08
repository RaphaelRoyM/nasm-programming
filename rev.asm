section .data
	msg4input db 'enter the word to reverse',0xa
	lenmsg4input equ $-msg4input
	
section .bss
	str1 resb 100
	strrev resb 100
	
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

	mov ecx,eax
	mov ebx,ecx
	mov esi,str1
	add esi,eax
	dec esi
	mov edi,strrev
loop1:
	mov al,[esi]
	mov [edi],al
	dec esi
	inc edi
	loop loop1
	
	mov byte[edi],0xa
	add ebx,1
	
	mov edx,ebx
	mov eax,4
	mov ebx,1
	mov ecx,strrev
	int 0x80	
exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
