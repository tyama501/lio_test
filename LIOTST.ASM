
	.model tiny

	.data

	putmsg dw 3441h, 3b7ah
	retmsg db "returned from interrupt!!",0dh,0ah,'$'

	.code

	org 100h

start:
	push	cs
	pop	ds
	mov	dx,offset c5irq
	mov	ax,25c5h
	int	21h

	mov     ax,0f990h
	mov	ds,ax
	xor	bx,bx

	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a0h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a1h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a2h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a3h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a4h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a5h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a6h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a7h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a8h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25a9h
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25aah
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25abh
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25ach
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25adh
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25aeh
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25afh
	int	21h

	add	bx,4
	mov	dx,WORD PTR ds:[bx+6]
	mov	ax,25ceh
	int	21h

ginit:
	mov	bp,sp
	mov	sp,0e000h
	push	ds
	push	es
	push	ss
	push	bx
	push	cx
	push	dx
	push	bp
	push	sp
	push	si
	push	di
	mov	ax,ss
	add	ax,0e01h
	mov	ds,ax
	int	0a0h
	pop	di
	pop	si
	pop	sp
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ss
	pop	es
	pop	ds

	mov	ax,ss
	add	ax,0e01h
	mov	ds,ax
gscreen:
	xor	bx,bx
	mov	BYTE PTR ds:[bx], 03h		;Color 640x400
	mov	BYTE PTR ds:[bx+1], 00h
	mov	BYTE PTR ds:[bx+2], 00h
	mov	BYTE PTR ds:[bx+3], 01h
	push	ds
	push	es
	push	ss
	push	bx
	push	cx
	push	dx
	push	bp
	push	sp
	push	si
	push	di
	int	0a1h
	pop	di
	pop	si
	pop	sp
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ss
	pop	es
	pop	ds

gcolor1:
	xor	bx,bx
	mov	BYTE PTR ds:[bx+1], 0ffh
	mov	BYTE PTR ds:[bx+2], 0ffh
	mov	BYTE PTR ds:[bx+3], 0ffh
	mov	BYTE PTR ds:[bx+4], 02h		;16 Color mode
	push	ds
	push	es
	push	ss
	push	bx
	push	cx
	push	dx
	push	bp
	push	sp
	push	si
	push	di
	int	0a3h
	pop	di
	pop	si
	pop	sp
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ss
	pop	es
	pop	ds

	mov	cx,7
	mov	dx,0008h
gcolor2:
	xor	bx,bx
	mov	ax,cx
	add	ax,8
	mov	BYTE PTR ds:[bx], al		;Pallet Number
	mov	WORD PTR ds:[bx+1], dx		;Color Information
	push	ds
	push	es
	push	ss
	push	bx
	push	cx
	push	dx
	push	bp
	push	sp
	push	si
	push	di
	int	0a4h
	pop	di
	pop	si
	pop	sp
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ss
	pop	es
	pop	ds
	sal	dx,1
	and	dx,0fffh
	loop	gcolor2

gcls:
	push	ds
	push	es
	push	ss
	push	bx
	push	cx
	push	dx
	push	bp
	push	sp
	push	si
	push	di
	int	0a5h
	pop	di
	pop	si
	pop	sp
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ss
	pop	es
	pop	ds

	mov	cx,7
	mov	dx,00e0h
gcircle:
	xor	bx,bx
	mov	WORD PTR ds:[bx], dx		;X Center
	mov	WORD PTR ds:[bx+2], 0080h	;Y Center
	mov	WORD PTR ds:[bx+4], 0020h	;X Radius
	mov	WORD PTR ds:[bx+6], 0020h	;Y Radius
	mov	BYTE PTR ds:[bx+8], cl		;Pallet Number
	mov	BYTE PTR ds:[bx+9], 00h		
	mov	WORD PTR ds:[bx+10], 0000h
	mov	WORD PTR ds:[bx+12], 0000h
	mov	WORD PTR ds:[bx+14], 0000h
	mov	WORD PTR ds:[bx+16], 0000h
	mov	BYTE PTR ds:[bx+18], 00h
	mov	WORD PTR ds:[bx+19], 0000h
	mov	WORD PTR ds:[bx+21], 0000h
	push	ds
	push	es
	push	ss
	push	bx
	push	cx
	push	dx
	push	bp
	push	sp
	push	si
	push	di
	int	0a8h
	pop	di
	pop	si
	pop	sp
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ss
	pop	es
	pop	ds
	add	dx, 0020h
	loop	gcircle

	mov	cx,7
	mov	dx,00d0h
gline:
	xor	bx,bx
	mov	ax,cx
	add	ax,8
	mov	WORD PTR ds:[bx], dx		;X Start
	mov	WORD PTR ds:[bx+2], 00e0h	;Y Start
	add	dx,0020h
	mov	WORD PTR ds:[bx+4], dx		;X End
	mov	WORD PTR ds:[bx+6], 0100h	;Y End
	mov	BYTE PTR ds:[bx+8], al		;Pallet Number
	mov	BYTE PTR ds:[bx+9], 02h		;Box Fill
	mov	BYTE PTR ds:[bx+10], 01h
	mov	BYTE PTR ds:[bx+11], al		;Pallet Number in Box
	mov	BYTE PTR ds:[bx+12], 00h
	mov	BYTE PTR ds:[bx+13], 00h
	mov	WORD PTR ds:[bx+14], 0000h
	mov	WORD PTR ds:[bx+16], 0000h
	push	ds
	push	es
	push	ss
	push	bx
	push	cx
	push	dx
	push	bp
	push	sp
	push	si
	push	di
	int	0a7h
	pop	di
	pop	si
	pop	sp
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ss
	pop	es
	pop	ds
	loop	gline

	mov	cx,2
	mov	si,offset putmsg
	mov	dx, 0120h
	push	dx
gput2:
	xor	bx,bx	
	mov	WORD PTR ds:[bx], dx		;Upper Left Corner X
	mov	WORD PTR ds:[bx+2], 0120h	;Upper Left Corner Y
	mov	dx, es:[si]
	mov	WORD PTR ds:[bx+4], dx		;JIS Code
	mov	BYTE PTR ds:[bx+6], 00h
	mov	BYTE PTR ds:[bx+7], 01h		;Color mode
	mov	BYTE PTR ds:[bx+8], 05h		;Foreground Color
	mov	BYTE PTR ds:[bx+9], 00h		;Background Color
	push	ds
	push	es
	push	ss
	push	bx
	push	cx
	push	dx
	push	bp
	push	sp
	push	si
	push	di
	int	0adh
	pop	di
	pop	si
	pop	sp
	pop	bp
	pop	dx
	pop	cx
	pop	bx
	pop	ss
	pop	es
	pop	ds
	add	si,2
	pop	dx
	add	dx,0020h
	loop	gput2

	mov	sp,bp

	push	cs
	pop	ds
	mov	dx,offset retmsg
	mov	ah,09h
	int	21h

	mov	ax, 4c00h
	int	21h

c5irq:
	iret

	end
