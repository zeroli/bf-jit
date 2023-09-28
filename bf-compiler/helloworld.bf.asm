
.text
.globl _main
_main:
	pushq %rbp
	movq %rsp, %rbp
	pushq %r12
	subq $30008, %rsp
	leaq (%rsp), %rdi
	movl $0, %esi
	movq $30000, %rdx
	call memset
	movq %rsp, %r12
	inc %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	cmpb $0, (%r12)
	je bracket_0_end
bracket_0_start:
	dec %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	inc %r12
	decb (%r12)
	cmpb $0, (%r12)
	jne bracket_0_start
bracket_0_end:
	dec %r12
	movzbl (%r12), %ecx
	call putchar
	inc %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	cmpb $0, (%r12)
	je bracket_1_end
bracket_1_start:
	dec %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	inc %r12
	decb (%r12)
	cmpb $0, (%r12)
	jne bracket_1_start
bracket_1_end:
	dec %r12
	incb (%r12)
	movzbl (%r12), %ecx
	call putchar
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	movzbl (%r12), %ecx
	call putchar
	movzbl (%r12), %ecx
	call putchar
	incb (%r12)
	incb (%r12)
	incb (%r12)
	movzbl (%r12), %ecx
	call putchar
	inc %r12
	inc %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	cmpb $0, (%r12)
	je bracket_2_end
bracket_2_start:
	dec %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	inc %r12
	decb (%r12)
	cmpb $0, (%r12)
	jne bracket_2_start
bracket_2_end:
	dec %r12
	incb (%r12)
	incb (%r12)
	movzbl (%r12), %ecx
	call putchar
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	movzbl (%r12), %ecx
	call putchar
	inc %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	cmpb $0, (%r12)
	je bracket_3_end
bracket_3_start:
	dec %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	inc %r12
	decb (%r12)
	cmpb $0, (%r12)
	jne bracket_3_start
bracket_3_end:
	dec %r12
	incb (%r12)
	movzbl (%r12), %ecx
	call putchar
	dec %r12
	movzbl (%r12), %ecx
	call putchar
	incb (%r12)
	incb (%r12)
	incb (%r12)
	movzbl (%r12), %ecx
	call putchar
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	movzbl (%r12), %ecx
	call putchar
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	decb (%r12)
	movzbl (%r12), %ecx
	call putchar
	inc %r12
	inc %r12
	inc %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	cmpb $0, (%r12)
	je bracket_4_end
bracket_4_start:
	dec %r12
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	incb (%r12)
	inc %r12
	decb (%r12)
	cmpb $0, (%r12)
	jne bracket_4_start
bracket_4_end:
	dec %r12
	incb (%r12)
	movzbl (%r12), %ecx
	call putchar

	leave
	ret
	
