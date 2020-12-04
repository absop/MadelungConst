; Function MadelungFFC48 {
; Location: REPL[1]:2
        pushq   %rbp
        movq    %rsp, %rbp
        pushq   %r15
        pushq   %r14
        pushq   %r13
        pushq   %r12
        pushq   %rsi
        pushq   %rdi
        pushq   %rbx
        subq    $168, %rsp
        vmovapd %xmm10, -80(%rbp)
        vmovapd %xmm9, -96(%rbp)
        vmovapd %xmm8, -112(%rbp)
        vmovapd %xmm7, -128(%rbp)
        vmovapd %xmm6, -144(%rbp)
        movq    %rcx, %r14
; Location: REPL[1]:4
; Function Colon; {
; Location: range.jl:5
; Function Type; {
; Location: range.jl:255
; Function unitrange_last; {
; Location: range.jl:260
; Function >=; {
; Location: operators.jl:333
; Function <=; {
; Location: int.jl:428
        testq   %r14, %r14
;}}}}}
        jle     L959
        movq    %r14, %rdi
        negq    %rdi
        vxorpd  %xmm8, %xmm8, %xmm8
        vxorpd  %xmm9, %xmm9, %xmm9
        movl    $1, %esi
        movabsq $power_by_squaring, %r12
        movabsq $498087280, %rax        # imm = 0x1DB03570
        vmovapd (%rax), %xmm10
        movabsq $498087296, %rax        # imm = 0x1DB03580
        vmovapd (%rax), %xmm7
        nopl    (%rax)
; Location: REPL[1]:5
; Function ^; {
; Location: intfuncs.jl:220
L128:
        movq    $-1, %rcx
        movq    %rsi, %rdx
        callq   *%r12
;}
; Function /; {
; Location: int.jl:59
; Function float; {
; Location: float.jl:269
; Function Type; {
; Location: float.jl:254
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rax, %xmm2, %xmm0
        vcvtsi2sdq      %rsi, %xmm2, %xmm6
;}}}
; Function /; {
; Location: float.jl:401
        vdivsd  %xmm6, %xmm0, %xmm0
;}}
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm0, %xmm9, %xmm9
;}
; Location: REPL[1]:6
; Function ^; {
; Location: intfuncs.jl:220
        movq    $-1, %rcx
        movq    %rsi, %rdx
        callq   *%r12
;}
; Function *; {
; Location: promotion.jl:314
; Function *; {
; Location: float.jl:399
        vmovddup        %xmm6, %xmm0    # xmm0 = xmm6[0,0]
;}}
; Function /; {
; Location: promotion.jl:316
; Function /; {
; Location: float.jl:401
        vcvtsi2sdq      %rax, %xmm7, %xmm1
;}}
; Function *; {
; Location: promotion.jl:314
; Function *; {
; Location: float.jl:399
        vmulpd  %xmm10, %xmm0, %xmm0
;}}
; Function /; {
; Location: promotion.jl:316
; Function /; {
; Location: float.jl:401
        vdivpd  %xmm0, %xmm1, %xmm0
;}}
; Function +; {
; Location: float.jl:395
        vaddpd  %xmm0, %xmm8, %xmm8
;}
; Location: REPL[1]:7
; Function iterate; {
; Location: range.jl:575
; Function ==; {
; Location: promotion.jl:425
        leaq    (%rdi,%rsi), %rax
        addq    $1, %rax
;}
; Location: range.jl:576
; Function +; {
; Location: int.jl:53
        addq    $1, %rsi
;}
; Location: range.jl:575
; Function ==; {
; Location: promotion.jl:425
        cmpq    $1, %rax
;}}
        jne     L128
        vxorpd  %xmm10, %xmm10, %xmm10
; Location: REPL[1]:10
; Function Colon; {
; Location: range.jl:5
; Function Type; {
; Location: range.jl:255
; Function unitrange_last; {
; Location: range.jl:260
; Function >=; {
; Location: operators.jl:333
; Function <=; {
; Location: int.jl:428
        cmpq    $2, %r14
;}}}}}
        jl      L980
        vxorpd  %xmm10, %xmm10, %xmm10
        movl    $2, %edi
        movl    $1, %ebx
        movl    $3, %eax
        movq    %rax, -160(%rbp)
        movq    %r14, -184(%rbp)
        nopw    %cs:(%rax,%rax)
; Location: REPL[1]:11
; Function -; {
; Location: int.jl:52
L272:
        leaq    -1(%rdi), %rax
;}
; Function Colon; {
; Location: range.jl:5
; Function Type; {
; Location: range.jl:255
; Function unitrange_last; {
; Location: range.jl:260
; Function >=; {
; Location: operators.jl:333
; Function <=; {
; Location: int.jl:428
        testq   %rax, %rax
;}}}}}
        jle     L597
; Location: REPL[1]:12
; Function literal_pow; {
; Location: intfuncs.jl:243
; Function *; {
; Location: int.jl:54
        movq    %rdi, %r15
        imulq   %r15, %r15
;}}
; Location: REPL[1]:13
; Function ^; {
; Location: intfuncs.jl:220
        movq    $-1, %rcx
        movq    %rdi, %rdx
        callq   *%r12
        movq    %rax, %rsi
;}
; Function +; {
; Location: int.jl:53
        movq    %r15, %rax
        addq    $2, %rax
;}
; Function sqrt; {
; Location: math.jl:505
; Function float; {
; Location: float.jl:269
; Function Type; {
; Location: float.jl:254
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rax, %xmm4, %xmm6
;}}}
; Location: math.jl:479
        js      L1185
;}}
; Function MadelungFFC48 {
; Location: math.jl
        movq    %rdi, -152(%rbp)
        movq    %rbx, %rax
        sarq    $63, %rax
        movq    %rbx, -168(%rbp)
        andnq   %rbx, %rax, %rax
        movq    %rax, -176(%rbp)
        leaq    (%r15,%r15), %r13
        movl    $1, %ebx
        movl    $1, %r14d
        nopw    %cs:(%rax,%rax)
;}
; Function MadelungFFC48 {
; Location: REPL[1]:14
; Function ^; {
; Location: intfuncs.jl:220
L384:
        movq    $-1, %rcx
        movq    %r14, %rdx
        callq   *%r12
        movq    %rax, %rdi
;}
; Function +; {
; Location: int.jl:53
        movq    %rbx, %rax
        addq    %r13, %rax
;}
; Function sqrt; {
; Location: math.jl:505
; Function float; {
; Location: float.jl:269
; Function Type; {
; Location: float.jl:254
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rax, %xmm4, %xmm7
;}}}
; Location: math.jl:479
        js      L1143
;}
; Location: REPL[1]:15
; Function ^; {
; Location: intfuncs.jl:220
        movq    -160(%rbp), %rax
        leaq    (%rax,%r14), %rdx
        addq    $-1, %rdx
        movq    $-1, %rcx
        callq   *%r12
;}
; Function +; {
; Location: int.jl:53
        addq    %r15, %rbx
;}
; Function sqrt; {
; Location: math.jl:505
; Function float; {
; Location: float.jl:269
; Function Type; {
; Location: float.jl:254
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rbx, %xmm4, %xmm1
;}}}
; Function sqrt; {
; Location: math.jl:479
        js      L1166
;}}
; Location: REPL[1]:13
; Function /; {
; Location: promotion.jl:316
; Function promote; {
; Location: promotion.jl:284
; Function _promote; {
; Location: promotion.jl:261
; Function convert; {
; Location: number.jl:7
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rsi, %xmm4, %xmm0
;}}}}}
; Function sqrt; {
; Location: math.jl:505
; Function sqrt; {
; Location: math.jl:480
        vsqrtsd %xmm6, %xmm6, %xmm2
;}}
; Function /; {
; Location: promotion.jl:316
; Function /; {
; Location: float.jl:401
        vdivsd  %xmm2, %xmm0, %xmm0
;}}
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm0, %xmm10, %xmm0
;}
; Location: REPL[1]:14
; Function /; {
; Location: promotion.jl:316
; Function promote; {
; Location: promotion.jl:284
; Function _promote; {
; Location: promotion.jl:261
; Function convert; {
; Location: number.jl:7
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rdi, %xmm4, %xmm2
;}}}}}
; Function sqrt; {
; Location: math.jl:505
; Function sqrt; {
; Location: math.jl:480
        vsqrtsd %xmm7, %xmm7, %xmm3
;}}
; Function /; {
; Location: promotion.jl:316
; Function /; {
; Location: float.jl:401
        vdivsd  %xmm3, %xmm2, %xmm2
;}}
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm2, %xmm0, %xmm0
;}
; Location: REPL[1]:15
; Function sqrt; {
; Location: math.jl:505
; Function sqrt; {
; Location: math.jl:480
        vsqrtsd %xmm1, %xmm1, %xmm1
;}}
; Function /; {
; Location: promotion.jl:316
; Function promote; {
; Location: promotion.jl:284
; Function _promote; {
; Location: promotion.jl:261
; Function convert; {
; Location: number.jl:7
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rax, %xmm4, %xmm2
;}}}}}
; Function /; {
; Location: float.jl:401
        vdivsd  %xmm1, %xmm2, %xmm1
;}
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm1, %xmm0, %xmm10
;}
; Function iterate; {
; Location: range.jl:575
; Function ==; {
; Location: promotion.jl:425
        cmpq    %r14, -176(%rbp)
;}}
        je      L576
; Function iterate; {
; Location: range.jl:576
; Function +; {
; Location: int.jl:53
        addq    $1, %r14
;}}
; Location: REPL[1]:12
; Function literal_pow; {
; Location: intfuncs.jl:243
; Function *; {
; Location: int.jl:54
        movq    %r14, %rbx
        imulq   %rbx, %rbx
;}}
; Location: REPL[1]:13
; Function ^; {
; Location: intfuncs.jl:220
        movq    $-1, %rcx
        movq    -152(%rbp), %rdx
        callq   *%r12
        movq    %rax, %rsi
;}
; Function +; {
; Location: int.jl:53
        leaq    (%r15,%rbx,2), %rax
;}
; Function sqrt; {
; Location: math.jl:505
; Function float; {
; Location: float.jl:269
; Function Type; {
; Location: float.jl:254
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rax, %xmm4, %xmm6
;}}}}
; Function sqrt; {
; Location: float.jl:452
        testq   %rax, %rax
        jns     L384
        jmp     L1185
        nopw    (%rax,%rax)
;}}
; Function MadelungFFC48 {
; Location: float.jl
L576:
        movq    -184(%rbp), %r14
        movq    -152(%rbp), %rdi
        movq    -168(%rbp), %rbx
;}
; Function MadelungFFC48 {
; Location: REPL[1]:15
L597:
        addq    $1, %rbx
        addq    $1, -160(%rbp)
; Function iterate; {
; Location: range.jl:575
; Function ==; {
; Location: promotion.jl:425
        cmpq    %r14, %rdi
;}
; Location: range.jl:576
; Function +; {
; Location: int.jl:53
        leaq    1(%rdi), %rdi
;}}
        jne     L272
        vxorpd  %xmm6, %xmm6, %xmm6
; Location: REPL[1]:19
; Function Colon; {
; Location: range.jl:5
; Function Type; {
; Location: range.jl:255
; Function unitrange_last; {
; Location: range.jl:260
; Function >=; {
; Location: operators.jl:333
; Function <=; {
; Location: int.jl:428
        cmpq    $3, %r14
;}}}}}
        jl      L984
        vxorpd  %xmm6, %xmm6, %xmm6
        movl    $3, %eax
        movl    $6, %r14d
        nopl    (%rax,%rax)
; Location: REPL[1]:19
; Function -; {
; Location: int.jl:52
L656:
        leaq    -1(%rax), %rdx
        movq    %rdx, -152(%rbp)
;}
; Function Colon; {
; Location: range.jl:5
; Function Type; {
; Location: range.jl:255
; Function unitrange_last; {
; Location: range.jl:260
; Function >=; {
; Location: operators.jl:333
; Function <=; {
; Location: int.jl:428
        testq   %rdx, %rdx
;}}}}}
        movq    %r14, -192(%rbp)
        jle     L929
        movq    %rax, %rsi
        imulq   %rsi, %rsi
        movq    $-1, %rbx
        movl    $1, %r13d
        movq    %rax, -176(%rbp)
        movq    %rsi, -168(%rbp)
        nopl    (%rax)
; Location: REPL[1]:19
; Function Colon; {
; Location: range.jl:5
; Function Type; {
; Location: range.jl:255
; Function unitrange_last; {
; Location: range.jl:260
; Function >=; {
; Location: operators.jl:333
; Function <=; {
; Location: int.jl:428
L720:
        cmpq    $1, %r13
;}}}}}
        je      L904
; Location: REPL[1]:20
; Function +; {
; Location: operators.jl:502
; Function +; {
; Location: int.jl:53
        leaq    (%rax,%r13), %rdx
        addq    $1, %rdx
;}}
; Function ^; {
; Location: intfuncs.jl:220
        movq    $-1, %rcx
        movq    %r12, %rdi
        callq   *%r12
;}
; Location: REPL[1]:21
; Function literal_pow; {
; Location: intfuncs.jl:243
; Function *; {
; Location: int.jl:54
        movq    %r13, %r15
        imulq   %r15, %r15
;}}
; Function +; {
; Location: operators.jl:502
; Function +; {
; Location: int.jl:53
        leaq    (%r15,%rsi), %rcx
        addq    $1, %rcx
;}}
; Function sqrt; {
; Location: math.jl:505
; Function float; {
; Location: float.jl:269
; Function Type; {
; Location: float.jl:254
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rcx, %xmm4, %xmm1
;}}}
; Function sqrt; {
; Location: math.jl:479
; Function <; {
; Location: float.jl:452
        testq   %rcx, %rcx
;}
        js      L1124
        addq    %rsi, %r15
        movq    %rbx, -160(%rbp)
        movl    $2, %r12d
        movq    %r14, %rsi
        nop
; Location: math.jl:480
L800:
        vsqrtsd %xmm1, %xmm1, %xmm0
;}}
; Function /; {
; Location: promotion.jl:316
; Function promote; {
; Location: promotion.jl:284
; Function _promote; {
; Location: promotion.jl:261
; Function convert; {
; Location: number.jl:7
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rax, %xmm4, %xmm1
;}}}}}
; Function /; {
; Location: float.jl:401
        vdivsd  %xmm0, %xmm1, %xmm0
;}
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm0, %xmm6, %xmm6
;}
; Function iterate; {
; Location: range.jl:575
; Function ==; {
; Location: promotion.jl:425
        testq   %rbx, %rbx
;}}
        je      L880
; Location: REPL[1]:20
; Function ^; {
; Location: intfuncs.jl:220
        movq    $-1, %rcx
        movq    %rsi, %rdx
        callq   *%rdi
;}
; Location: REPL[1]:21
; Function literal_pow; {
; Location: intfuncs.jl:243
; Function *; {
; Location: int.jl:54
        movq    %r12, %rcx
        imulq   %rcx, %rcx
;}}
; Function +; {
; Location: operators.jl:502
; Function +; {
; Location: int.jl:53
        addq    %r15, %rcx
;}}
; Function sqrt; {
; Location: math.jl:505
; Function float; {
; Location: float.jl:269
; Function Type; {
; Location: float.jl:254
; Function Type; {
; Location: float.jl:60
        vcvtsi2sdq      %rcx, %xmm4, %xmm1
;}}}
; Function sqrt; {
; Location: math.jl:479
        addq    $1, %rsi
        addq    $1, %r12
        addq    $-1, %rbx
; Function <; {
; Location: float.jl:452
        testq   %rcx, %rcx
        jns     L800
        jmp     L1124
        nopw    (%rax,%rax)
;}}}}
; Function MadelungFFC48 {
; Location: float.jl
L880:
        movq    %rdi, %r12
        movq    -176(%rbp), %rax
        movq    -168(%rbp), %rsi
        movq    -160(%rbp), %rbx
;}
; Function MadelungFFC48 {
; Location: REPL[1]:21
L904:
        addq    $1, %r14
        addq    $1, %rbx
; Function iterate; {
; Location: range.jl:575
; Function ==; {
; Location: promotion.jl:425
        cmpq    -152(%rbp), %r13
;}
; Location: range.jl:576
; Function +; {
; Location: int.jl:53
        leaq    1(%r13), %r13
;}}
        jne     L720
L929:
        movq    -192(%rbp), %r14
; Location: REPL[1]:21
        addq    $1, %r14
; Function iterate; {
; Location: range.jl:575
; Function ==; {
; Location: promotion.jl:425
        cmpq    -184(%rbp), %rax
;}
; Location: range.jl:576
; Function +; {
; Location: int.jl:53
        leaq    1(%rax), %rax
;}}
        jne     L656
        jmp     L984
L959:
        vxorpd  %xmm8, %xmm8, %xmm8
        vxorpd  %xmm10, %xmm10, %xmm10
        vxorpd  %xmm9, %xmm9, %xmm9
        vxorpd  %xmm6, %xmm6, %xmm6
        jmp     L984
L980:
        vxorpd  %xmm6, %xmm6, %xmm6
L984:
        movabsq $498087312, %rax        # imm = 0x1DB03590
; Location: REPL[1]:23
; Function *; {
; Location: float.jl:399
        vmulsd  (%rax), %xmm9, %xmm0
        movabsq $498087320, %rax        # imm = 0x1DB03598
        vmulsd  (%rax), %xmm8, %xmm1
;}
; Function +; {
; Location: operators.jl:502
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm1, %xmm0, %xmm0
;}}
; Function *; {
; Location: float.jl:399
        vpermilpd       $1, %xmm8, %xmm1 # xmm1 = xmm8[1,0]
        movabsq $498087328, %rax        # imm = 0x1DB035A0
        vmulsd  (%rax), %xmm1, %xmm1
        movabsq $498087336, %rax        # imm = 0x1DB035A8
        vmulsd  (%rax), %xmm10, %xmm2
;}
; Function +; {
; Location: operators.jl:502
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm1, %xmm0, %xmm0
;}
; Function afoldl; {
; Location: operators.jl:490
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm0, %xmm2, %xmm0
;}
; Function afoldl; {
; Location: operators.jl:489
; Function +; {
; Location: float.jl:395
        vaddsd  %xmm0, %xmm6, %xmm0
        movabsq $498087344, %rax        # imm = 0x1DB035B0
;}}}}
; Function *; {
; Location: promotion.jl:314
; Function *; {
; Location: float.jl:399
        vmulsd  (%rax), %xmm0, %xmm0
;}}
        vmovaps -144(%rbp), %xmm6
        vmovaps -128(%rbp), %xmm7
        vmovaps -112(%rbp), %xmm8
        vmovaps -96(%rbp), %xmm9
        vmovaps -80(%rbp), %xmm10
        addq    $168, %rsp
        popq    %rbx
        popq    %rdi
        popq    %rsi
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        popq    %rbp
        retq
; Location: REPL[1]:21
; Function sqrt; {
; Location: math.jl:505
; Function sqrt; {
; Location: math.jl:479
L1124:
        movabsq $julia_throw_complex_domainerror_34382, %rax
        movl    $308168336, %ecx        # imm = 0x125E4690
        callq   *%rax
        ud2
;}}
; Location: REPL[1]:14
; Function sqrt; {
; Location: math.jl:505
; Function sqrt; {
; Location: math.jl:479
L1143:
        movabsq $julia_throw_complex_domainerror_34382, %rax
        movl    $308168336, %ecx        # imm = 0x125E4690
        vmovaps %xmm7, %xmm1
        callq   *%rax
        ud2
;}}
; Location: REPL[1]:15
; Function sqrt; {
; Location: math.jl:505
; Function sqrt; {
; Location: math.jl:479
L1166:
        movabsq $julia_throw_complex_domainerror_34382, %rax
        movl    $308168336, %ecx        # imm = 0x125E4690
        callq   *%rax
        ud2
;}}
; Location: REPL[1]:13
; Function sqrt; {
; Location: math.jl:505
; Function sqrt; {
; Location: math.jl:479
L1185:
        movabsq $julia_throw_complex_domainerror_34382, %rax
        movl    $308168336, %ecx        # imm = 0x125E4690
        vmovaps %xmm6, %xmm1
        callq   *%rax
        ud2
        nopl    (%rax,%rax)
;}}}