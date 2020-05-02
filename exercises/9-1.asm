assume cs:codesg
s segment
db 41h,02,42h,02,43h,02,44h,02,45h,02,46h,02,47h,02,48h,02
s ends

codesg segment	
start:
	mov ax,s
	mov ds,ax
	mov ax,0b8f0h
	mov ss,ax
	mov cx,16
	mov bx,0
cp:	mov al,[bx]
	mov ss:[bx],ax
	inc bx
	loop cp
	mov ax,4c00h
	int 21h	
codesg ends

end start	