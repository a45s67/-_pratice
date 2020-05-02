assume cs:codesg
data segment
	db'1975','1976','1977','1978','1979','1980','1981','1982'
	dd 16,22,382,1356,2390,8000,16000,24486
	dw 3,7,9,13,28,38,130,220
data ends


table segment
	db 21 dup ('year summ ne ?? ')
	table ends

stack segment
	db 8 dup (0)
	
	stack ends
	
codesg segment

start:
	mov ax,stack
	mov ss,ax
	mov sp,10h
	mov cx,8
	
s1: push cx
	
	mov cx,4
	mov si,0
s2:	
	mov bp,0
	mov bx,[bp]
	mov ax,data
	mov ds,ax
	mov dl,[bx+si]

	

	mov bp,2
	mov bx,[bp]
	mov ax,table
	mov ds,ax
	mov [bx+si],dl
	inc si
	
	loop s2
	
	add bx,10h
	mov [bp],bx	
	mov bp,0
	mov bx,[bp]
	add bx,4
	mov [bp],bx
	
	pop cx
	
	loop s1
	mov cx,8
	mov bp,2
	mov bx,0
	mov [bp],bx
	mov si,0
s3:	
	mov bp,0
	mov ax,data
	mov ds,ax
	mov bx,[bp]
	mov dx,[bx+si]
	
	mov bp,2
	mov ax,table
	mov ds,ax
	mov bx,[bp]
	mov [bx+5],dx

	mov bp,0
	mov ax,data
	mov ds,ax
	mov bx,[bp]
	mov dx,[bx+si+2]
	
	mov bp,2
	mov ax,table
	mov ds,ax
	mov bx,[bp]
	mov [bx+2+5],dx	
	add si,4
	add bx,10h
	mov [bp],bx
	
	loop s3  
	mov ax,0
	mov [bp],ax
	mov bp,0
	mov bx,[bp]
	add bx,si
	mov [bp],bx
	mov si,0
s4:	
	mov bp,0
	mov ax,data
	mov ds,ax
	mov bx,[bp]
	mov dx,[bx+si]
	
	mov bp,2
	mov ax,table
	mov ds,ax
	mov bx,[bp]
	mov [bx+0Ah],dx
	add bx,10h
	mov [bp],bx
	add si,2
	
	loop s4
	mov ax,table
	mov ds,ax
	mov bx,0
	mov cx,8
s5:	mov ax,[bx+5]
	mov dx,[bx+7]
	div word ptr [bx+0Ah]
	
	mov [bx+0Dh],ax
	add bx,10h
	loop s5
	


	
	
	mov ax ,4c00h
	int 21h
	
	codesg ends
	
	end start
	
	