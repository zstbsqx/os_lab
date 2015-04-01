# lab1
## ex1
### 1.create ucore.img部分代码
	UCOREIMG  := $(call totarget,ucore.img)

	$(UCOREIMG): $(kernel) $(bootblock)
    $(V)dd if=/dev/zero of=$@ count=10000
    $(V)dd if=$(bootblock) of=$@ conv=notrunc
    $(V)dd if=$(kernel) of=$@ seek=1 conv=notrunc

	$(call create_target,ucore.img)
### 2.主扇区特征
	大小为512字节，其中466字节启动代码，64字节硬盘分区表，最后两字节为0x55AA，作为结束标志

## ex2
### 1
    输入s进行进入函数的单步调试，n进行不进入函数的单步调试
### 2
    输入b *0x7c00在0x7c00设置断点
### 3
    输入c让程序继续执行，在断点处停止，但是显示no source available。
    使用x /(n)i $PC查看pc处指令，得到当前位置汇编指令。经过初步比对，与bootasm.S中代码基本相同
### 4
    使用b测试，i r查看寄存器

## ex3
### 设置flag
    .code16                                             # Assemble for 16-bit mode
        cli                                             # Disable interrupts
        cld                                             # String operations increment
### 寄存器清零
        # Set up the important data segment registers (DS, ES, SS).
        xorw %ax, %ax                                   # Segment number zero
        movw %ax, %ds                                   # -> Data Segment
        movw %ax, %es                                   # -> Extra Segment
        movw %ax, %ss                                   # -> Stack Segment
###  *下面是进入A20的过程:*
### 循环等待8042不忙（输入缓存为空）
        # Enable A20:
        #  For backwards compatibility with the earliest PCs, physical
        #  address line 20 is tied low, so that addresses higher than
        #  1MB wrap around to zero by default. This code undoes this.
    seta20.1:
        inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty).
        testb $0x2, %al
        jnz seta20.1
### 向8042端口写指令
        movb $0xd1, %al                                 # 0xd1 -> port 0x64
        outb %al, $0x64                                 # 0xd1 means: write data to 8042's P2 port
### 循环等待8042不忙（输入缓存为空）
    seta20.2:
        inb $0x64, %al                                  # Wait for not busy(8042 input buffer empty).
        testb $0x2, %al
        jnz seta20.2
### 循环等待8042不忙（输入缓存为空）
        movb $0xdf, %al                                 # 0xdf -> port 0x60
        outb %al, $0x60                                 # 0xdf = 11011111, means set P2's A20 bit(the 1 bit) to 1
### 初始化GDT表，将cr0的PE位置为1
        # Switch from real to protected mode, using a bootstrap GDT
        # and segment translation that makes virtual addresses
        # identical to physical addresses, so that the
        # effective memory map does not change during the switch.
        lgdt gdtdesc
        movl %cr0, %eax
        orl $CR0_PE_ON, %eax
        movl %eax, %cr0
### 通过长跳转更新cs的基地址，使处理器进入32位模式
        # Jump to next instruction, but in 32-bit code segment.
        # Switches processor into 32-bit mode.
        ljmp $PROT_MODE_CSEG, $protcseg
### 设置保护模式的段寄存器
    .code32                                             # Assemble for 32-bit mode
    protcseg:
        # Set up the protected-mode data segment registers
        movw $PROT_MODE_DSEG, %ax                       # Our data segment selector
        movw %ax, %ds                                   # -> DS: Data Segment
        movw %ax, %es                                   # -> ES: Extra Segment
        movw %ax, %fs                                   # -> FS
        movw %ax, %gs                                   # -> GS
        movw %ax, %ss                                   # -> SS: Stack Segment
### 建立堆栈
        # Set up the stack pointer and call into C. The stack region is from 0--start(0x7c00)
        movl $0x0, %ebp
        movl $start, %esp
        call bootmain

## ex4
    readsect和readseg都是读取磁盘的函数，bootloader用这两个函数读取ELF
### bootmain函数
    bootmain(void) {
#### 读取ELF头
        readseg((uintptr_t)ELFHDR, SECTSIZE * 8, 0);
#### 判断ELF合法标志
        // is this a valid ELF?
        if (ELFHDR->e_magic != ELF_MAGIC) {
            goto bad;
        }
#### 读取整个ELF到内存
        struct proghdr *ph, *eph;
        // load each program segment (ignores ph flags)
        ph = (struct proghdr *)((uintptr_t)ELFHDR + ELFHDR->e_phoff);
        eph = ph + ELFHDR->e_phnum;
        for (; ph < eph; ph ++) {
            readseg(ph->p_va & 0xFFFFFF, ph->p_memsz, ph->p_offset);
        }
#### 从ELF头中找到内核入口
        // call the entry point from the ELF header
        // note: does not return
        ((void (*)(void))(ELFHDR->e_entry & 0xFFFFFF))();
#### 不合法，输出、死循环
    bad:
        outw(0x8A00, 0x8A00);
        outw(0x8A00, 0x8E00);
        /* do nothing */
        while (1);
    }

## ex5
    输出与说明中基本一致
    最后一行代表堆栈中最深的一层，也就是bootmain的堆栈。
    再向下都是汇编代码，所以没有对应函数信息。

## ex6
### 1
    中断向量表一个表项占用8字节，其中2-3字节是段选择子，0-1字节和6-7字节拼成位移，两者联合便是中断处理程序的入口地址。
### 2、3
    见程序
