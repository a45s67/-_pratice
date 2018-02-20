assume cs:codesg

data segment
	dw 123,12666,1,8,3,38
	
data ends

prt segment
	dw 8 dup (0)
prt ends

stk segment
	dw 16 dup (0)
	dw 16 dup (0)
stk ends

codesg segment
start:	
	mov ax,stk
	mov ss,ax
	mov sp,20h
	mov ax,data
	mov ds,ax
	
	mov cx,6
	call dtoc

	
	mov ax,4c00h
	int 21h
	
dtoc:
		
	mov bx,0
loop1:
	push cx
	mov ax,data
	mov ds,ax

	
	mov ax,0 ;push times
	mov ss:[22h],ax
	mov dx,0
	mov ax,10
	mov ss:[20h],ax
	
	mov ax,[bx]
	
d:	div word ptr ss:[20h]	
	mov cx,ax
	add dx,30h
	push dx	
	inc word ptr ss:[22h]
	mov dx,0	
	jcxz ok


	jmp d

	
ok:	mov ax,prt
	mov ds,ax
	mov cx,ss:[22h]
	mov si,0
put:
	pop ax
	mov [si],ax
	add si,1
	loop put
	
	call start1
	add bx,2
	
	
	pop cx
	loop loop1
	
	ret
	
	
	
start1:
	push bx
	mov dh,15
	add dh,ss:[24h]
	inc word ptr ss:[24h]
	mov dl,3
	mov cl,7
	mov ax,prt
	mov ds,ax
	mov si,0
	call show_str
	pop bx
	ret

	

	
	
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
	mov ah,10001000b
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

end	start
