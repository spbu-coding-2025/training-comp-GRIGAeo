	.file	"main.c"
	.text
	.globl	rectangle_rule
	.type	rectangle_rule, @function
rectangle_rule:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movsd	-8(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	movapd	%xmm0, %xmm3
	divsd	%xmm1, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sin@PLT
	mulsd	-24(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	rectangle_rule, .-rectangle_rule
	.globl	simpsons_rule
	.type	simpsons_rule, @function
simpsons_rule:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-16(%rbp), %xmm0
	subsd	-8(%rbp), %xmm0
	movsd	.LC1(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movsd	%xmm0, -32(%rbp)
	movsd	-8(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	movsd	.LC0(%rip), %xmm1
	movapd	%xmm0, %xmm3
	divsd	%xmm1, %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	call	sin@PLT
	movsd	.LC2(%rip), %xmm1
	mulsd	%xmm1, %xmm0
	movapd	%xmm0, %xmm4
	addsd	-32(%rbp), %xmm4
	movsd	%xmm4, -32(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	sin@PLT
	addsd	-32(%rbp), %xmm0
	mulsd	-24(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	simpsons_rule, .-simpsons_rule
	.globl	integrate
	.type	integrate, @function
integrate:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movl	$0, %eax
	movl	$0, %edx
	movq	%xmm0, %rax
	movq	%xmm1, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-56(%rbp), %xmm0
	movsd	-64(%rbp), %xmm2
	movapd	%xmm0, %xmm1
	subsd	%xmm2, %xmm1
	movl	-68(%rbp), %eax
	testq	%rax, %rax
	js	.L6
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	jmp	.L7
.L6:
	movq	%rax, %rdx
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
.L7:
	divsd	%xmm0, %xmm1
	movsd	%xmm1, -16(%rbp)
	movsd	-64(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L8
.L9:
	movsd	-24(%rbp), %xmm0
	addsd	-16(%rbp), %xmm0
	movsd	%xmm0, -8(%rbp)
	movsd	-8(%rbp), %xmm0
	movq	-24(%rbp), %rax
	movq	-80(%rbp), %rdx
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	*%rdx
	movsd	-32(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -32(%rbp)
	movsd	-8(%rbp), %xmm0
	movsd	%xmm0, -24(%rbp)
	addl	$1, -36(%rbp)
.L8:
	movl	-36(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jb	.L9
	movsd	-32(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	integrate, .-integrate
	.section	.rodata
	.align 8
.LC4:
	.string	"Cannot allocate memory for result string in %d experiment\n"
.LC5:
	.string	"%d %.5f %.5f"
	.align 8
.LC6:
	.string	"Cannot write results to string in %d experiment\n"
	.text
	.globl	calculate_integrals
	.type	calculate_integrals, @function
calculate_integrals:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	.cfi_offset 3, -24
	movl	$0, %eax
	movl	$0, %edx
	movq	%xmm0, %rax
	movq	%xmm1, %rdx
	movq	%rax, -64(%rbp)
	movq	%rdx, -56(%rbp)
	movl	%edi, -68(%rbp)
	movq	%rsi, -80(%rbp)
	movl	-68(%rbp), %eax
	salq	$3, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, -40(%rbp)
	cmpq	$0, -40(%rbp)
	jne	.L12
	movl	$0, %eax
	jmp	.L13
.L12:
	movl	$0, -44(%rbp)
	jmp	.L14
.L17:
	movl	-44(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-64(%rbp), %rax
	movsd	-56(%rbp), %xmm1
	leaq	rectangle_rule(%rip), %rcx
	movq	%rcx, %rsi
	movl	%edx, %edi
	movq	%rax, %xmm0
	call	integrate
	movq	%xmm0, %rax
	movq	%rax, -32(%rbp)
	movl	-44(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movq	-64(%rbp), %rax
	movsd	-56(%rbp), %xmm1
	leaq	simpsons_rule(%rip), %rcx
	movq	%rcx, %rsi
	movl	%edx, %edi
	movq	%rax, %xmm0
	call	integrate
	movq	%xmm0, %rax
	movq	%rax, -24(%rbp)
	movl	-44(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	$32, %edi
	call	malloc@PLT
	movq	%rax, (%rbx)
	movl	-44(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-40(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L15
	movl	-44(%rbp), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	free_results
	movq	stderr(%rip), %rax
	movl	-44(%rbp), %edx
	leaq	.LC4(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L13
.L15:
	movl	-44(%rbp), %eax
	leaq	0(,%rax,4), %rdx
	movq	-80(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-44(%rbp), %eax
	leaq	0(,%rax,8), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movq	(%rax), %rax
	movsd	-24(%rbp), %xmm0
	movq	-32(%rbp), %rcx
	movapd	%xmm0, %xmm1
	movq	%rcx, %xmm0
	leaq	.LC5(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$2, %eax
	call	sprintf@PLT
	testl	%eax, %eax
	jne	.L16
	movl	-44(%rbp), %eax
	leal	1(%rax), %edx
	movq	-40(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	free_results
	movq	stderr(%rip), %rax
	movl	-44(%rbp), %edx
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	movl	$0, %eax
	jmp	.L13
.L16:
	addl	$1, -44(%rbp)
.L14:
	movl	-44(%rbp), %eax
	cmpl	-68(%rbp), %eax
	jb	.L17
	movq	-40(%rbp), %rax
.L13:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	calculate_integrals, .-calculate_integrals
	.globl	free_results
	.type	free_results, @function
free_results:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L19
.L20:
	movl	-4(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	free@PLT
	addl	$1, -4(%rbp)
.L19:
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jb	.L20
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	free_results, .-free_results
	.section	.rodata
.LC8:
	.string	"%s\n"
	.align 8
.LC9:
	.string	"Cannot wtite %d result to stdout"
	.text
	.globl	main
	.type	main, @function
main:
.LFB11:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	pxor	%xmm0, %xmm0
	movsd	%xmm0, -48(%rbp)
	movsd	.LC7(%rip), %xmm0
	movsd	%xmm0, -40(%rbp)
	movl	$5, -32(%rbp)
	movl	$10, -28(%rbp)
	movl	$20, -24(%rbp)
	movl	$100, -20(%rbp)
	movl	$500, -16(%rbp)
	movl	$1000, -12(%rbp)
	movq	$6, -64(%rbp)
	movq	-64(%rbp), %rax
	movl	%eax, %ecx
	leaq	-32(%rbp), %rdx
	movq	-48(%rbp), %rax
	movsd	-40(%rbp), %xmm1
	movq	%rdx, %rsi
	movl	%ecx, %edi
	movq	%rax, %xmm0
	call	calculate_integrals
	movq	%rax, -56(%rbp)
	cmpq	$0, -56(%rbp)
	jne	.L22
	movl	$1, %eax
	jmp	.L28
.L22:
	movl	$0, -68(%rbp)
	jmp	.L24
.L27:
	movl	-68(%rbp), %eax
	leaq	0(,%rax,8), %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	testl	%eax, %eax
	jns	.L25
	movq	stderr(%rip), %rax
	movl	-68(%rbp), %edx
	leaq	.LC9(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	jmp	.L26
.L25:
	addl	$1, -68(%rbp)
.L24:
	movl	-68(%rbp), %eax
	cmpq	-64(%rbp), %rax
	jb	.L27
.L26:
	movq	-64(%rbp), %rax
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	free_results
	movl	$0, %eax
.L28:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1073741824
	.align 8
.LC1:
	.long	0
	.long	1075314688
	.align 8
.LC2:
	.long	0
	.long	1074790400
	.align 8
.LC7:
	.long	1413754136
	.long	1074340347
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
