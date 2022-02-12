.data
comaa: .asciiz ","
newLine: .asciiz "\n"
size: .asciiz " SIZE: "
by: .asciiz "I write the result to the file and console these are final array not candidate sequence !"
newString: .asciiz " " #to save data to file
newString1: .asciiz " " #to save data to file
fileName: .asciiz "arrays.txt"
fileName1: .asciiz "output.txt"
fileWords: .space 1024 #for reading whole file and assign filewords
i: .byte 1 #i value for loop
j: .byte 0 # j value for loop
k: .byte 0 # k value for array index
count: .byte 1 
atoi: .byte -48 #for convert char to int
slash: .byte -35 # for control end of line in file
coma: .byte -4 #for control "," in file
low: .byte 0
max: .byte 0 #size of last array
control: .byte -1 #for controlling

.text
	jal OpenFile
	jal Read #read from file once
	lb ,$t8 , atoi #for char to int
	li ,$t7 , 0 #read counter
	li ,$t6 , 0 #size
	li ,$t5 , 0 #read counter twice
	li ,$t0 , 0
	j label40
label39:
	 
	lb ,$t8 , atoi #for char to int
	li ,$t6 , 0 #size
	move $t5,$t7 #when reading the filewords string easily we check which row 
	#addi $t5,$t5,-2 #for reading filewords twice $t5 is back of t7 in a row
label40:
	lb,$t3,fileWords($t7) #read one byte
	add $t3 ,$t3 ,$t8 #char to int
	addi $t7,$t7,1 #for indexing
	beq $t3 ,-4,label42 #check coma or not
	j label43 
label42:
	addi $t6,$t6,1 #to find the size of array
label43:
	beq $t3 ,-35,label41 #check slash or not
	j label40

label41:
	addi $t7,$t7,1 #moving in a row in filewords string
	move $t9,$t7
	addi $t9 , $t9 ,-2
	addi $t6,$t6,1

	add $a0 ,$zero,$t6 #enough space byte for t6 value 
	li $v0 ,9 #syscall 9 (sbrk)
	syscall
	move $a3, $v0 #assign space value to a3 register

	li $s2,0 #for caunting
	li $t3,0 
label44:
	beq $t3,-4,label48 #check ","
	move $t2 ,$t3 #assign last value to t2 for returning two or more scaler char value to int such as  "23" we can add it 20 + 3 and create new int value 23
	j label49
label48:
	li $t2,0
label49:
	lb,$t3,fileWords($t5) #read one byte from filewords
	add $t3 ,$t3 ,$t8 #char to int
	addi $t5,$t5,1	#increase filewords index

	beq $t3,-4,label47 #check ","

label46:
	mul $t2,$t2,10 #to calculate such as "23" -> 20 + 3 while converting char to int
	add $t3 ,$t2,$t3 #20 + 3 -> 3 value is t2   - t3 value is 20 
	j label51

label47:#save  number to array 
	add $s3,$s2,$a3 #take true address
	sb $t2 , ($s3) #store byte to array
	addi $s2,$s2,1 #increase size

	

label51:
	beq $t5 ,$t9,label45 #check to reach end of row 

	j label44

label45:#save last number to array in a row

	add $s3,$s2,$a3
	sb $t3 , ($s3)
	addi $s2,$s2,1
	

main:
	move $a2 ,$t6 # t6 is a size
	li $a1 ,1
	li $t6 ,2
	li $t9,-1
	lb $s7 ,control
	beq $a2, $zero , Exit

	add $a0 ,$zero,$a2 #enough space with size
	li $v0 ,9 #syscall 9 (sbrk)
	syscall
	move $t2, $v0 #assign allocated size to t2 register

	li $s2,0 #i value for loop
loop5:
	beq $s2 $a2,loop5exit #if check to exit loop
	add $t5,$s2,$t2 #for finding true address
	sb $a1 , ($t5) #add one whole array
	addi $s2 ,$s2,1 #increment i for control loop
	j loop5

loop5exit:

	jal getMaxLength #function call

	move $s1 ,$v0 #t0 has max size value of array
	

	beq $s1 $zero,label22 # if max value is zero we assign it to 1 for showing exact one value 
	j label23
	label22:
	addi $s1 , $s1,1 #increase size 1

label23:
	lb $s4 , low #low value to s4
	lb $s5 , count #count value
	li $s2,0 #i value for loop
	lb $s0,k #k value for loop
loop3: #loop
	beq $s2 $a2,loop3exit #if check to exit loop
	add $t3,$t2,$s2 #finding true address 
	lb $t4, ($t3) #load byte from finding address
	beq $t4 $s5,label2 #check count is equal with loaded address value
	j label6
label2:
	addi $s4 , $s4 , 1 #incremenet value
label6:
	beq $t4 $t6,label7
	j increment
label7:
	j loop3exit

increment:
	addi $s2 ,$s2 ,1  #incremenet value for loop check
	j loop3

loop3exit:

	add $a0 ,$zero,$s1 #enough space with size
	li $v0 ,9 #syscall 9 (sbrk)
	syscall
	move $s6 , $v0 #assign created space to s6 register
	addi $s4 ,$s4 ,-1
	move $s2,$s4  #i value for loop


loop4:
	beq $s2 $a2,loop4exit #if check to exit loop
	add $t3,$t2,$s2
	lb $t4, ($t3) #load value from array
	beq $t4 $s5,label8
	j increment1

label8:
	li $s7,-1 #for check
	move $t3,$s2 #to find i+1
	addi $t3 , $t3 , 1#i+1
	add $t8,$t2,$t3#find i+1 address
	lb $t4, ($t8)#find i+1 value from array
	beq $t4 $s5,label9# check i+1 value is same with s5 register value
	j label10
label9:
	addi $s0,$s2,1 #s0-t0
	add $a0,$a3,$s2 #find true address
	lb $t8, ($a0) #a0 is a beginning array
	add $a0,$a3,$s0 #find true address #s0-t0
	lb $t9, ($a0) #load from array
	slt  $t1,$t8,$t9      # checks if $s0 < $s1
	beq  $t1,$zero,label13 # if $s0 <  $s1, goes to label3

	j label10
label13:
	add $t5,$s6,$s0 #take s6 value 
	sb $t9 , ($t5) #read from array
	li $s7,1 #for check is assigned before or not like control==1

label10:
	beq $s7 $t9,label11 
	j label12
label11:
	add $a0,$a3,$s2 
	lb $t4, ($a0) #load from array
	add $t5,$s6,$s0
	sb $t4 , ($t5) #load from array
label12:	
	addi $s5,$s5,1 #increment size 
	addi $s0,$s0,1#increment size  
increment1:
	addi $s2 ,$s2 ,1 #increment size for second loop
	j loop4


loop4exit:
	li $s2 , 0
printArr:#print array to the console

	beq $s2, $s1,loop500

	add $s0 , $s2 , $s6

	lb $t1, ($s0)

	addi $s2 ,$s2,1

	li $v0 , 1
	addi $a0 , $t1,0
	syscall

	li $v0 ,4
	la $a0 , comaa
	syscall

	j printArr
loop500:
	li $v0 ,4
	la $a0 , newLine
	syscall
	jal Write #reach write function to write file
	beq $t0 ,14,Exit
	j label39

Exit: #exit the mýps 
	jal CloseFile
	li $v0,4
	la $a0, newLine # \n value
	syscall
	li $v0,4
	la $a0, by #selamun aleykum
	syscall
	
	li $v0 ,10 #for exit
	syscall

getMaxLength: #function
	lb $s2,i # i value for loop
	lb $s1,max # size of the array
loop1:
	beq $s2, $a2 , exitloop1 #check array size and i value 
	li $s3 , 0

loop2:
	beq $s3 ,$s2 , exitloop2  #check array size and j value 
	add $a0,$a3,$s2 #find correct array address
	lb $t3 ,($a0)	#load byte from array
	add $a0,$a3,$s3 #find correct array address
	lb $t4 ,($a0)	#load byte from array
	sgt  $t1,$t3,$t4      # checks if $s0 > $s1
	bne  $t1,$zero,label1 # if $s0 >  $s1, goes to label1

	j label3

label1:
	add $t3,$t2,$s2	#find correct array address
	add $t4,$t2,$s3 #find correct array address
	lb $t5 ,($t3) #load from array 
	lb $t6,($t4)#load from array 
	addi $t6 , $t6 ,1
	
	slt  $t1,$t5,$t6      # checks if $s0 < $s1
	bne  $t1,$zero,label4 # if $s0 <  $s1, goes to label4
	j label3

label4:
	add $t3,$t2,$s2 #find correct array address
	sb   $t6 , ($t3)#load from array 
	add $t3,$t2,$s2 #find correct array address
	lb   $t5 ,($t3)#load from array 
	slt  $t1,$s1,$t5      # checks if $s0 < $s1
	bne  $t1,$zero,label5
	j label3
label5:
	add $t3,$t2,$s2 #find correct array address 
	lb $s1, ($t3)	#load from array 

label3:
	addi $s3 ,$s3, 1 #increment loop counting value
	j loop2

exitloop2:
	addi $s2, $s2, 1 #increment loop counting value

	j loop1

exitloop1:
	
	
	add $v0 ,$s1 , $zero
	jr $ra # return back where is function is called

Read:
	li $v0,	13	 # open file syscall
	la $a0, fileName # get the file name
	li $a1,	0	 # read file
	syscall
	move $s0,$v0		#save the file descriptor
	li $v0 ,14	 #read_file syscall code = 14
	move $a0 , $s0 # file decriptor
	la $a1,fileWords #the buffer that holds the string of the whole file
	la $a2,1024 #buffer length
	syscall

	
	li $v0 ,16 #close the file
	move $a0,$s0
	syscall
	jr $ra 
OpenFile:
	li $v0,	13	 # open file syscall
	la $a0, fileName1   # get the file name
	li $a1,	1	 #  write to file
	syscall
	move $v1 , $v0 #save the file descriptor
	jr $ra
CloseFile:
	li 	$v0,16		#close file syscall code = 16
	move 	$a0,$s1		#file descriptor to close
	syscall
	jr $ra
Write:
	
	li $s2 , 0 #count value for loop
	li $s4 ,0
	li $t5,10
	li $t4,100
	
loop99:
	beq $s2,$s1 ,loop99exit
	add $t3,$s2,$s6
	lb   $t6 , ($t3) #load from array
	
	slt $t1 ,$t6,$t5
	beq $t1, 1,label200 #one digit
	slt $t1 ,$t6,$t4
	beq $t1, 1,label202 #two digit
	j label203
label200:
	addi $t6,$t6,48 #convert it to char
	j label201
label202:#To find 2 digtis number and write it one by one to the file
	div $s0,$t6,10
	
	mul $s7,$s0,10
	
	sub $t9,$t6,$s7
	
	addi $t9,$t9,48 #convert it to char
	addi $s0,$s0,48 #convert it to char
	sb $s0,newString($s4) #save to the string
	addi $s4,$s4,1 #increment count alue
	sb $t9,newString($s4) #save to the string
	addi $s4,$s4,1 #increment count alue
	addi $s2,$s2,1 #increment count alue
	li $t6,44
	sb $t6,newString($s4) #save to the string
	addi $s4,$s4,1 #increment count alue
	j loop99
label203:

	
label201:
	sb $t6,newString($s4) #save to the string
	addi $s4,$s4,1 #increment count alue
	addi $s2,$s2,1 #increment count alue
	
	li $t6,44
	sb $t6,newString($s4) #save to the string
	addi $s4,$s4,1 #increment count alue
	
	j loop99
loop99exit:

	
	li $a2,0
	li $v0 ,15
	move $a0 ,$v1
	la 	$a1, newString	#the string what will be written
	add 	$a2, $a2,$s4		#length of the toWrite string
	syscall
	
	li $v0 ,15
	move $a0 ,$v1
	la 	$a1, size	#the string what will be written
	la 	$a2, 7		#length of the toWrite string
	syscall
	addi $t0, $t0 ,1
	
	li $t6,0
	add $t6,$s1,$zero
	
	addi $t6,$t6,48 #convert it to char
	sb $t6,newString1 #save to the string
	
	li $v0 ,15
	move $a0 ,$v1
	la 	$a1, newString1	#the string what will be written
	la 	$a2, 1		#length of the toWrite string
	syscall
	
	li $v0 ,15
	move $a0 ,$v1
	la 	$a1, newLine	#the string what will be written
	la 	$a2, 1		#length of the toWrite string
	syscall
	
	li $s2 , 0 #count value for loop
	li $t6,32
	
loop100:#make string empty
	beq $s2,20 ,loop100exit 
	sb $t6,newString($s2) #save to the string
	addi $s2,$s2,1 #increment count alue
	j loop100
loop100exit:
sb $t6,newString($s2) #save to the string	
	jr $ra 
