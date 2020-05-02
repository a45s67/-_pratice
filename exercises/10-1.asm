assume cs:c
s segment
	db 8 dup (0)
s ends	

c segment
start:
	mov ax,s
	mov ss,ax
	mov sp,16
	mov ds,ax
	mov ax,0
	call word ptr ds:[0eh]
	inc ax 
	inc ax
	inc ax
	


	mov ax,4c00h
	int 21h

c ends
end start