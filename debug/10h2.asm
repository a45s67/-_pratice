assume cs:codesg

data segment
	db 16 dup(0)
data ends



codesg segment
start:
	mov ax,data
	mov ss,ax
	mov sp,16
	mov ax,4240h
	mov dx,0fh
	mov cx,0ah
	
	call divdw
	mov ax,4c00h
	int 21h
divdw:
	mov bx,ax
	mov ax,dx
	mov dx,0
	div cx
	push ax
	mov ax,bx
	div cx
	mov cx,dx
	pop dx
	ret
	
	
	



codesg ends
end start