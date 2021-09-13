	.file	"fibo.c"
	.text
	.p2align 4
	.globl	fibo
	.def	fibo;	.scl	2;	.type	32;	.endef
	.seh_proc	fibo
fibo:
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	testl	%ecx, %ecx
	jle	.L6
	cmpl	$1, %ecx
	je	.L12
	leal	-2(%rcx), %ebx
	decl	%ecx
	xorl	%r12d, %r12d
	movl	%ecx, %eax
	movl	%ebx, %esi
	andl	$-2, %eax
	subl	%eax, %esi
	call	fibo
	movl	%ebx, %ecx
	addl	%eax, %r12d
	cmpl	%esi, %ebx
	je	.L1
.L5:
	cmpl	$1, %ebx
	je	.L10
	decl	%ecx
	subl	$2, %ebx
	call	fibo
	movl	%ebx, %ecx
	addl	%eax, %r12d
	cmpl	%esi, %ebx
	jne	.L5
.L1:
	movl	%r12d, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	incl	%r12d
	movl	%r12d, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	xorl	%r12d, %r12d
	movl	%r12d, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%r12
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	movl	$1, %r12d
	jmp	.L1
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "fibo of %ld is %ld\12\0"
.LC2:
	.ascii "Total CPU Time: %lf\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	movl	$1, %ebx
	leaq	.LC0(%rip), %rsi
	call	__main
	call	clock
	movl	%eax, %edi
	.p2align 4,,10
	.p2align 3
.L14:
	movl	%ebx, %edx
	xorl	%r8d, %r8d
.L17:
	cmpl	$1, %edx
	je	.L20
	leal	-1(%rdx), %ecx
	call	fibo
	addl	%eax, %r8d
	subl	$2, %edx
	jne	.L17
.L16:
	movl	%ebx, %edx
	movq	%rsi, %rcx
	incl	%ebx
	call	printf
	cmpl	$45, %ebx
	jne	.L14
	call	clock
	pxor	%xmm1, %xmm1
	leaq	.LC2(%rip), %rcx
	subl	%edi, %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	.LC1(%rip), %xmm1
	movq	%xmm1, %rdx
	call	printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.p2align 4,,10
	.p2align 3
.L20:
	incl	%r8d
	jmp	.L16
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1083129856
	.ident	"GCC: (GNU) 9.2.0"
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
