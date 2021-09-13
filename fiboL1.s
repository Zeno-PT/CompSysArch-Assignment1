	.file	"fibo.c"
	.text
	.globl	fibo
	.def	fibo;	.scl	2;	.type	32;	.endef
	.seh_proc	fibo
fibo:
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$40, %rsp
	.seh_stackalloc	40
	.seh_endprologue
	movl	%ecx, %ebx
	movl	$0, %eax
	testl	%ecx, %ecx
	jle	.L1
	movl	%ecx, %eax
	cmpl	$1, %ecx
	je	.L1
	leal	-1(%rcx), %ecx
	call	fibo
	movl	%eax, %esi
	leal	-2(%rbx), %ecx
	call	fibo
	addl	%esi, %eax
.L1:
	addq	$40, %rsp
	popq	%rbx
	popq	%rsi
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "fibo of %ld is %ld\12\0"
.LC2:
	.ascii "Total CPU Time: %lf\0"
	.text
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
	call	__main
	call	clock
	movl	%eax, %edi
	movl	$1, %ebx
	leaq	.LC0(%rip), %rsi
.L6:
	movl	%ebx, %ecx
	call	fibo
	movl	%eax, %r8d
	movl	%ebx, %edx
	movq	%rsi, %rcx
	call	printf
	incl	%ebx
	cmpl	$45, %ebx
	jne	.L6
	call	clock
	subl	%edi, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	divsd	.LC1(%rip), %xmm1
	movq	%xmm1, %rdx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$32, %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC1:
	.long	0
	.long	1083129856
	.ident	"GCC: (GNU) 9.2.0"
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
