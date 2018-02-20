assume cs:codesg
data segment
db 'welcome to masm!',0
data ends

codesg segment	
start:
	mov dh,20
	mov dl,
	mov cl,2
	mov ax,data
	mov ds,ax
	mov si,0
	call show_str
	
	mov ax,4c00h
	int 21h

	

	
	
show_str:
	push dx
	push cx
;;function
	
set:
	mov ax,0b800h
	mov es,ax
	mov ax,0
	mov al,dh
	mov ah,0a0h
	mul ah
	mov bx,ax
	
	mov ax,0
	mov ah,2
	mov al,dl
	mul ah
	add bx,ax
	mov si,0
color:
	mov ah,0
	or ah,cl
	
	
print:	
	mov al,[si]
	mov cx,0
	mov cl,al
	jcxz fin
	
	mov es:[bx],al
	mov es:[bx+1],ah
	inc si
	add bx,2
	jmp print

	
;;	
fin:pop cx
	pop dx
	ret
	
codesg ends

end start	