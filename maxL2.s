	.file	"max.c"
	.text
	.p2align 4
	.globl	max1
	.def	max1;	.scl	2;	.type	32;	.endef
	.seh_proc	max1
max1:
	.seh_endprologue
	cmpl	%ecx, %edx
	movl	%ecx, %eax
	cmovge	%edx, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	max2
	.def	max2;	.scl	2;	.type	32;	.endef
	.seh_proc	max2
max2:
	.seh_endprologue
	cmpl	%edx, %ecx
	movl	%edx, %eax
	cmovge	%ecx, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	testMax
	.def	testMax;	.scl	2;	.type	32;	.endef
	.seh_proc	testMax
testMax:
	.seh_endprologue
	ret
	.seh_endproc
	.p2align 4
	.globl	sub
	.def	sub;	.scl	2;	.type	32;	.endef
	.seh_proc	sub
sub:
	.seh_endprologue
	movl	%ecx, %eax
	subl	%edx, %eax
	ret
	.seh_endproc
	.p2align 4
	.globl	restricted
	.def	restricted;	.scl	2;	.type	32;	.endef
	.seh_proc	restricted
restricted:
	.seh_endprologue
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "Total CPU time: %lf\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	call	__main
	call	clock
	movl	%eax, %ebx
	call	clock
	pxor	%xmm1, %xmm1
	leaq	.LC1(%rip), %rcx
	subl	%ebx, %eax
	cvtsi2sdl	%eax, %xmm1
	divsd	.LC0(%rip), %xmm1
	movq	%xmm1, %rdx
	call	printf
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbx
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
