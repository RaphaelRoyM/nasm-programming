section .data
	inputmsg1 db 'enter first string '
	leninputmsg1 equ $-inputmsg1
	
	inputmsg2 db 'enter second string '
	leninputmsg2 equ $-inputmsg2
	
	strnoteq db 'strings not equal',10
	lenstrnoteq equ $-strnoteq
	
	streq db 'strings are equal',10
	lenstreq equ $-streq
	

section .bss
	firststr resb 100
	secondstr resb 100

section .text
	global _start
_start:
	;entering first string
	mov eax,4
	mov ebx,1
	mov ecx,inputmsg1
	mov edx,leninputmsg1
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,firststr
	mov edx,100
	int 0x80
	
	mov byte [ecx+eax-1],0
	
	;entering second string
	mov eax,4
	mov ebx,1
	mov ecx,inputmsg2
	mov edx,leninputmsg2
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,secondstr
	mov edx,100
	int 0x80
	
	mov byte [ecx+eax-1],0
	
	mov esi,firststr
	mov edi,secondstr
	
compare:
	mov al,[esi]
	mov dl,[edi]
	cmp al,dl
	jne notequal
	test al,dl
	jz equal
	inc esi
	inc edi
	loop compare
	
equal:
	mov eax,4
	mov ebx,1
	mov ecx,streq
	mov edx,lenstreq
	int 0x80
	
	jmp exit

notequal:
	mov eax,4
	mov ebx,1
	mov ecx,strnoteq
	mov edx,lenstrnoteq
	int 0x80
	
	jmp exit
	
exit:
	mov eax,1
	xor ebx,ebx
	int 0x80
