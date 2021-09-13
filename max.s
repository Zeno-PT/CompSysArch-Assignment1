	.file	"max.c"
	.text
	.globl	max1
	.def	max1;	.scl	2;	.type	32;	.endef
	.seh_proc	max1
max1:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	16(%rbp), %eax
	cmpl	%eax, 24(%rbp)
	cmovge	24(%rbp), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	max2
	.def	max2;	.scl	2;	.type	32;	.endef
	.seh_proc	max2
max2:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	16(%rbp), %eax
	cmpl	24(%rbp), %eax
	setg	%al
	movzbl	%al, %eax
	movl	%eax, -8(%rbp)
	cmpl	$0, -8(%rbp)
	je	.L4
	movl	16(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.L5
.L4:
	movl	24(%rbp), %eax
	movl	%eax, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	testMax
	.def	testMax;	.scl	2;	.type	32;	.endef
	.seh_proc	testMax
testMax:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$48, %rsp
	.seh_stackalloc	48
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movl	24(%rbp), %eax
	movl	%eax, %edx
	movl	16(%rbp), %ecx
	call	max1
	movl	%eax, -4(%rbp)
	movl	32(%rbp), %eax
	movl	%eax, %edx
	movl	16(%rbp), %ecx
	call	max1
	movl	%eax, -8(%rbp)
	movl	-4(%rbp), %eax
	subl	-8(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.globl	sub
	.def	sub;	.scl	2;	.type	32;	.endef
	.seh_proc	sub
sub:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	16(%rbp), %eax
	subl	24(%rbp), %eax
	popq	%rbp
	ret
	.seh_endproc
	.globl	restricted
	.def	restricted;	.scl	2;	.type	32;	.endef
	.seh_proc	restricted
restricted:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	$10, -4(%rbp)
	movb	$97, -5(%rbp)
	movb	$99, -6(%rbp)
	movl	$8, -12(%rbp)
	nop
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "Total CPU time: %lf\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	call	__main
	movl	$3, -8(%rbp)
	movl	$5, -12(%rbp)
	movl	$216000000, -16(%rbp)
	call	clock
	movl	%eax, -20(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L13
.L14:
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %ecx
	call	max1
	movl	%eax, -36(%rbp)
	incl	-4(%rbp)
.L13:
	movl	-4(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jl	.L14
	call	clock
	movl	%eax, -24(%rbp)
	movl	-24(%rbp), %eax
	subl	-20(%rbp), %eax
	cvtsi2sdl	%eax, %xmm0
	movsd	.LC0(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-32(%rbp), %xmm0
	movq	-32(%rbp), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.ident	"GCC: (GNU) 9.2.0"
	.def	clock;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
