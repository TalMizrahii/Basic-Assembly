#123456789 Tal Mizrahi
	#This is the second assignment for Computer Systems course, Bar Ilan University.
	.section	.rodata				#read only data section
format1:	   .string	"%d\n"
format2:	   .string	"True\n"
format3:	   .string	"False\n"
id:        .quad        123456789
	########
	.text							# The beginnig of the code.
.globl	main						# The label "main" is used to state the initial point of this program.
	.type	main, @function			# The label "main" representing the beginning of a function.
# The main function:
main:                               
	movq %rsp, %rbp                # For correct debugging.
	pushq	%rbp	               # Save the old frame pointer.
	movq	%rsp,	%rbp           # Create the new frame pointer.

        # First assignment, Print my id.
	movq	$format1,%rdi	       # Setting the string format1 in %rdi as first parameter to printf.
    movq     id, %rsi              # Moving the ID label into %rsi.
	xorq	%rax, %rax             # Resetting %rax.
	call	printf		      	   # Calling to printf AFTER we passed its parameters.

	# Second assignment: If the second byte in id is even, multiply id by 3 and print the result.
	# If its odd, divide by 3 and print the reminder.
	movq     id, %rcx                # Moving the ID label into %rcx.
	movq	$format1, %rdi           # Setting the string format1 in %rdi as first parameter to printf.
	test    $0x0100, %rcx            # Using "tSest" to check if id's second byte is even or odd.
	je  	.L1     # Multiply by 3
	leaq    (%rcx,%rcx,2), %rsi 
	jmp     .L2
  .L1:          # Divide and print the reminder.    
	movq     id, %rax               # Setting id into %rax.
	movq     $3, %rsi               # Setting %rsi to the number 3.
	xorq     %rdx, %rdx             # Resetting %rdx.
	idivq    %rsi                   # Dividing %rax (id) by 3.
	movq     %rdx, %rsi             # Moving %rdx into %rsi.
  .L2:
	xorq	%rax, %rax        		# Resetting %rax.
	call    printf             	    # Calling to printf AFTER we passed its parameters.

	# Third assignment: xoring the first and third byte of id. if the unsigned result is larger then 127 print True, else print false.
	movq     id, %rsi               # Moving the ID label into %rsi.
	xorq     %rdx, %rdx             # Resetting %rdx.
	movq     %rsi, %rdx             # Creating a copy of id in %rdx.
	andq     $0xff0000, %rdx        # Isolating the third byte.
	sarq     $16, %rdx              # Shifting the third byte to be the first byte.
	xorb     %sil, %dl              # Xoring the first and third bytes. The result is saved in %dl.
	cmpb     $0x80, %dl             # Comparing the result to 128.
	
	jae     .L3                     # Checking if result is greater or equal to 128. If so, jump to L3, otherwise continue.
	#False (x <= 127)
	movq	$format3, %rdi          # Setting the string format3 in %rdi as first parameter to printf.
	jmp     .L4
	
  .L3: 
    #True (x > 127)
	movq	$format2, %rdi          # Setting the string format2 in %rdi as first parameter to printf.
  .L4:        
	xorq	%rax, %rax              # Resetting %rax.
	call    printf                  # Calling to printf AFTER we passed its parameters.
	
	# Fourth assignment: Printing the number of bytes in the fourth byte of id.
	xorq     %rdx, %rdx             # Resetting %rdx.
	movq     id, %rdx               # Moving the ID label into %rdx.
	sarq     $24, %rdx              # Shifting 24 times to the right to get the 4th byte.
	andq     $0xff, %rdx            # bitwise and with 0xff to receive only the 4th byte and set all other bits to 0.    
	
	xorq     %rsi, %rsi             # Creating mask byte in %rsi.
	movq     $1, %rsi               # Setting it to 1.  
	xorq     %rcx, %rcx             # Creating result byte in %rcx initiated to 0.
	xorq     %rbx, %rbx             # Creating loop counter in %rbx.
	movq     $8, %rbx               # Setting it to 8.
	
.L6:
	decq     %rbx                   # Decrementing the loop counter by 1.
	js       .L5                    # Checking if the loop counter in %rbx is negative. If so, exit the loop.
	testq    %rsi, %rdx             # Testing the number with the mask.
	je      .L7                     # If the result is zero, dont increment the counter, jump to the next label.
	incq     %rcx                   # If the result is not zero, increment to counter.
	
.L7:
	shl      $1, %rsi               # Increment the mask by shifting it to the next position.
	jmp     .L6                     # Go back to the beginning of the loop.
	
.L5:
	movq	$format1, %rdi	       # Setting the string format1 in %rdi as first parameter to printf.
	movq     %rcx, %rsi            # Move the result to %rsi as the second argument of printf.
	xorq	%rax, %rax             # Resetting %rax.
	call	printf		      	   # Calling to printf AFTER we passed its parameters.
									
	 #return from printf:
    movq	$0, %rax	           #return value is zero (just like in c - we tell the OS that this program finished seccessfully)
	movq	%rbp, %rsp			   #restore the old stack pointer - release all used memory.
	popq	%rbp				   #restore old frame pointer (the caller function frame)
	ret							   #return to caller function (OS)
