# Demo for painting
#
# Bitmap Display Configuration:
# - Unit width in pixels: 8					     
# - Unit height in pixels: 8
# - Display width in pixels: 256
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
.data
	displayAddress:	.word	0x10008000
.text
	lw $t0, displayAddress	# $t0 stores the base address for display
	li $t1, 0x0000ff
	li $t2, 0x00ff00	
	li $t3, 0xfff00f
	
tela1:	
	li $a1, 28
	li $a0, 2
    	jal boneco
        
    	jal fundo
	li $v0, 32          # sleep
    	li $a0, 1000        # sleep por 500 ms
    	syscall
	

tela2:	
	li $a1, 28
	li $a0, 2
	li $t1, 0x000000
    	jal boneco
    	li $t1, 0x0000ff
        
    	li $a1, 23
	li $a0, 8
    	jal boneco
        
    	jal fundo
    	    
	li $v0, 32          # sleep
    	li $a0, 1000 # sleep por 500 ms
    	syscall
	

tela3:
	li $a1, 23
	li $a0, 8
	li $t1, 0x000000
    	jal boneco
    	li $t1, 0x0000ff
        
    	li $a1, 16
	li $a0, 13
    	jal boneco
        
    	jal fundo
	
	li $v0, 32      # sleep
    	li $a0, 1000 	# sleep por 500 ms
    	syscall
  
 tela4:
	li $a1, 16
	li $a0, 13
	li $t1, 0x000000
    	jal boneco
    	li $t1, 0x0000ff
        
    	li $a1, 10
	li $a0, 19
    	jal boneco
        
	jal fundo
	
  	li $v0, 32      # sleep
    	li $a0, 1000 	# sleep por 500 ms
    	syscall
  
tela5:
	li $a1, 10
	li $a0, 19
	li $t1, 0x000000
    	jal boneco
    	li $t1, 0x0000ff
        
    	li $a1, 5
	li $a0, 26
    	jal boneco
        
	jal fundo
	        
	li $v0, 32      # sleep
    	li $a0, 1000 	# sleep por 500 ms
    	syscall

tela6:
	li $a1, 5
	li $a0, 26
	li $t1, 0x000000
    	jal boneco
    	li $t1, 0x0000ff
        
   	li $a1, 9
	li $a0, 26
    	jal bonecoInv
        
	jal fundo
	li $v0, 32      # sleep
    	li $a0, 1000 	# sleep por 500 ms
    	syscall	

tela7:
	li $a1, 9
	li $a0, 26
	li $t1, 0x000000
    	jal bonecoInv
   	li $t1, 0x0000ff
        
    	li $a1, 14
	li $a0, 19
    	jal bonecoInv
        
	jal fundo
	li $v0, 32      # sleep
   	li $a0, 1000 	# sleep por 500 ms
    	syscall	

tela8:
	li $a1, 14
	li $a0, 19
	li $t1, 0x000000
    	jal bonecoInv
    	li $t1, 0x0000ff
        
    	li $a1, 20
	li $a0, 13
    	jal bonecoInv
        
	jal fundo
	li $v0, 32  	# sleep
    	li $a0, 1000 	# sleep por 500 ms
    	syscall	

tela9:
	li $a1, 20
	li $a0, 13
	li $t1, 0x000000
    	jal bonecoInv
    	li $t1, 0x0000ff
        
    	li $a1, 27
	li $a0, 8
    	jal bonecoInv
        
	jal fundo
	li $v0, 32	# sleep
	li $a0, 1000 	# sleep por 500 ms
    	syscall	


Exit:
	li $v0, 10 	# terminate the program gracefully
	syscall
		
linhah:	
    	addi $sp, $sp, -4
    	sw $ra, 0($sp)

	li $t5, 0
	sll $t6, $a1, 7  #$a1 x 128 eixo y
	sll $t7, $a0, 2  #$a0 x 4 eixo x
	addu $t4, $t6, $t7 #endereço
	addu $t4, $t4, $t0
	
Linha:
   	addiu $t5,$t5, 1
    	sw $t3, ($t4)	
    	addiu $t4, $t4, 4
   	bne $t5, 6, Linha
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
	
boneco:
	addi $sp, $sp, -4
    	sw $ra, 0($sp)
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	sw $t1, 8($t4)
	
	addi $a1, $a1, -1
	addi $a0, $a0, 1
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)

	addi $a1, $a1, -1
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	
	addi $a0, $a0, 1
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2 	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	
	addi $a0, $a0, -2
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	addi $a1, $a1, -1
	addi $a0, $a0, 1
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	
	jr $ra	
	
fundo:
	addi $sp, $sp, -4
   	sw $ra, 0($sp)

	li $a1, 12
	li $a0, 18
	jal linhah

	li $a1, 25
	li $a0, 7
	jal linhah

    	li $a1, 30
	li $a0, 1
	jal linhah
			
	li $a1, 18
	li $a0, 12
	jal linhah
	
	li $a1, 7
	li $a0, 25
	jal linhah

	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra

bonecoInv:
	addi $sp, $sp, -4
    	sw $ra, 0($sp)
	
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	sw $t1, 8($t4)
	
	addi $a1, $a1, 3
	addi $a0, $a0, 1
	
	sll $t6, $a1, 7 	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)

	addi $a1, $a1, -1
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	
	addi $a0, $a0, 1
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	
	addi $a0, $a0, -2
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	addi $a1, $a1, -1
	addi $a0, $a0, 1
	
	sll $t6, $a1, 7  	#$a1 x 128 eixo y
	sll $t7, $a0, 2  	#$a0 x 4 eixo x
	addu $t4, $t6, $t7 	#endereço
	addu $t4, $t4, $t0
	sw $t1, ($t4)
	
	jr $ra	
