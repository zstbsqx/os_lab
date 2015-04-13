
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 a4 32 00 00       	call   1032d0 <memset>

    cons_init();                // init the console
  10002c:	e8 2e 15 00 00       	call   10155f <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 60 34 10 00 	movl   $0x103460,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 7c 34 10 00 	movl   $0x10347c,(%esp)
  100046:	e8 c7 02 00 00       	call   100312 <cprintf>

    print_kerninfo();
  10004b:	e8 f6 07 00 00       	call   100846 <print_kerninfo>

    grade_backtrace();
  100050:	e8 86 00 00 00       	call   1000db <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 bc 28 00 00       	call   102916 <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 43 16 00 00       	call   1016a2 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 95 17 00 00       	call   1017f9 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 e9 0c 00 00       	call   100d52 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 a2 15 00 00       	call   101610 <intr_enable>
    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    //lab1_switch_test();

    /* do nothing */
    while (1);
  10006e:	eb fe                	jmp    10006e <kern_init+0x6e>

00100070 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100070:	55                   	push   %ebp
  100071:	89 e5                	mov    %esp,%ebp
  100073:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  100076:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  10007d:	00 
  10007e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  100085:	00 
  100086:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10008d:	e8 f2 0b 00 00       	call   100c84 <mon_backtrace>
}
  100092:	c9                   	leave  
  100093:	c3                   	ret    

00100094 <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  100094:	55                   	push   %ebp
  100095:	89 e5                	mov    %esp,%ebp
  100097:	53                   	push   %ebx
  100098:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  10009b:	8d 5d 0c             	lea    0xc(%ebp),%ebx
  10009e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1000a1:	8d 55 08             	lea    0x8(%ebp),%edx
  1000a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1000ab:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1000af:	89 54 24 04          	mov    %edx,0x4(%esp)
  1000b3:	89 04 24             	mov    %eax,(%esp)
  1000b6:	e8 b5 ff ff ff       	call   100070 <grade_backtrace2>
}
  1000bb:	83 c4 14             	add    $0x14,%esp
  1000be:	5b                   	pop    %ebx
  1000bf:	5d                   	pop    %ebp
  1000c0:	c3                   	ret    

001000c1 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c1:	55                   	push   %ebp
  1000c2:	89 e5                	mov    %esp,%ebp
  1000c4:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000c7:	8b 45 10             	mov    0x10(%ebp),%eax
  1000ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d1:	89 04 24             	mov    %eax,(%esp)
  1000d4:	e8 bb ff ff ff       	call   100094 <grade_backtrace1>
}
  1000d9:	c9                   	leave  
  1000da:	c3                   	ret    

001000db <grade_backtrace>:

void
grade_backtrace(void) {
  1000db:	55                   	push   %ebp
  1000dc:	89 e5                	mov    %esp,%ebp
  1000de:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e1:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000e6:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000ed:	ff 
  1000ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1000f9:	e8 c3 ff ff ff       	call   1000c1 <grade_backtrace0>
}
  1000fe:	c9                   	leave  
  1000ff:	c3                   	ret    

00100100 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100100:	55                   	push   %ebp
  100101:	89 e5                	mov    %esp,%ebp
  100103:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100106:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100109:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  10010c:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10010f:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  100112:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100116:	0f b7 c0             	movzwl %ax,%eax
  100119:	83 e0 03             	and    $0x3,%eax
  10011c:	89 c2                	mov    %eax,%edx
  10011e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100123:	89 54 24 08          	mov    %edx,0x8(%esp)
  100127:	89 44 24 04          	mov    %eax,0x4(%esp)
  10012b:	c7 04 24 81 34 10 00 	movl   $0x103481,(%esp)
  100132:	e8 db 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100137:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10013b:	0f b7 d0             	movzwl %ax,%edx
  10013e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100143:	89 54 24 08          	mov    %edx,0x8(%esp)
  100147:	89 44 24 04          	mov    %eax,0x4(%esp)
  10014b:	c7 04 24 8f 34 10 00 	movl   $0x10348f,(%esp)
  100152:	e8 bb 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100157:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  10015b:	0f b7 d0             	movzwl %ax,%edx
  10015e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100163:	89 54 24 08          	mov    %edx,0x8(%esp)
  100167:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016b:	c7 04 24 9d 34 10 00 	movl   $0x10349d,(%esp)
  100172:	e8 9b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  100177:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017b:	0f b7 d0             	movzwl %ax,%edx
  10017e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100183:	89 54 24 08          	mov    %edx,0x8(%esp)
  100187:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018b:	c7 04 24 ab 34 10 00 	movl   $0x1034ab,(%esp)
  100192:	e8 7b 01 00 00       	call   100312 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  100197:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019b:	0f b7 d0             	movzwl %ax,%edx
  10019e:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a3:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a7:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ab:	c7 04 24 b9 34 10 00 	movl   $0x1034b9,(%esp)
  1001b2:	e8 5b 01 00 00       	call   100312 <cprintf>
    round ++;
  1001b7:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001bc:	83 c0 01             	add    $0x1,%eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	c9                   	leave  
  1001c5:	c3                   	ret    

001001c6 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c6:	55                   	push   %ebp
  1001c7:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
}
  1001c9:	5d                   	pop    %ebp
  1001ca:	c3                   	ret    

001001cb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001cb:	55                   	push   %ebp
  1001cc:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
}
  1001ce:	5d                   	pop    %ebp
  1001cf:	c3                   	ret    

001001d0 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001d0:	55                   	push   %ebp
  1001d1:	89 e5                	mov    %esp,%ebp
  1001d3:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001d6:	e8 25 ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001db:	c7 04 24 c8 34 10 00 	movl   $0x1034c8,(%esp)
  1001e2:	e8 2b 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_user();
  1001e7:	e8 da ff ff ff       	call   1001c6 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001ec:	e8 0f ff ff ff       	call   100100 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001f1:	c7 04 24 e8 34 10 00 	movl   $0x1034e8,(%esp)
  1001f8:	e8 15 01 00 00       	call   100312 <cprintf>
    lab1_switch_to_kernel();
  1001fd:	e8 c9 ff ff ff       	call   1001cb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100202:	e8 f9 fe ff ff       	call   100100 <lab1_print_cur_status>
}
  100207:	c9                   	leave  
  100208:	c3                   	ret    

00100209 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100209:	55                   	push   %ebp
  10020a:	89 e5                	mov    %esp,%ebp
  10020c:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  10020f:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100213:	74 13                	je     100228 <readline+0x1f>
        cprintf("%s", prompt);
  100215:	8b 45 08             	mov    0x8(%ebp),%eax
  100218:	89 44 24 04          	mov    %eax,0x4(%esp)
  10021c:	c7 04 24 07 35 10 00 	movl   $0x103507,(%esp)
  100223:	e8 ea 00 00 00       	call   100312 <cprintf>
    }
    int i = 0, c;
  100228:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  10022f:	e8 66 01 00 00       	call   10039a <getchar>
  100234:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100237:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10023b:	79 07                	jns    100244 <readline+0x3b>
            return NULL;
  10023d:	b8 00 00 00 00       	mov    $0x0,%eax
  100242:	eb 79                	jmp    1002bd <readline+0xb4>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100244:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100248:	7e 28                	jle    100272 <readline+0x69>
  10024a:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100251:	7f 1f                	jg     100272 <readline+0x69>
            cputchar(c);
  100253:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100256:	89 04 24             	mov    %eax,(%esp)
  100259:	e8 da 00 00 00       	call   100338 <cputchar>
            buf[i ++] = c;
  10025e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100261:	8d 50 01             	lea    0x1(%eax),%edx
  100264:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100267:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10026a:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100270:	eb 46                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\b' && i > 0) {
  100272:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  100276:	75 17                	jne    10028f <readline+0x86>
  100278:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10027c:	7e 11                	jle    10028f <readline+0x86>
            cputchar(c);
  10027e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100281:	89 04 24             	mov    %eax,(%esp)
  100284:	e8 af 00 00 00       	call   100338 <cputchar>
            i --;
  100289:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  10028d:	eb 29                	jmp    1002b8 <readline+0xaf>
        }
        else if (c == '\n' || c == '\r') {
  10028f:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100293:	74 06                	je     10029b <readline+0x92>
  100295:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  100299:	75 1d                	jne    1002b8 <readline+0xaf>
            cputchar(c);
  10029b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10029e:	89 04 24             	mov    %eax,(%esp)
  1002a1:	e8 92 00 00 00       	call   100338 <cputchar>
            buf[i] = '\0';
  1002a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1002a9:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1002ae:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1002b1:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1002b6:	eb 05                	jmp    1002bd <readline+0xb4>
        }
    }
  1002b8:	e9 72 ff ff ff       	jmp    10022f <readline+0x26>
}
  1002bd:	c9                   	leave  
  1002be:	c3                   	ret    

001002bf <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  1002bf:	55                   	push   %ebp
  1002c0:	89 e5                	mov    %esp,%ebp
  1002c2:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c8:	89 04 24             	mov    %eax,(%esp)
  1002cb:	e8 bb 12 00 00       	call   10158b <cons_putc>
    (*cnt) ++;
  1002d0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002d3:	8b 00                	mov    (%eax),%eax
  1002d5:	8d 50 01             	lea    0x1(%eax),%edx
  1002d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002db:	89 10                	mov    %edx,(%eax)
}
  1002dd:	c9                   	leave  
  1002de:	c3                   	ret    

001002df <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  1002df:	55                   	push   %ebp
  1002e0:	89 e5                	mov    %esp,%ebp
  1002e2:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  1002ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ef:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1002f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1002f6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1002fa:	8d 45 f4             	lea    -0xc(%ebp),%eax
  1002fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  100301:	c7 04 24 bf 02 10 00 	movl   $0x1002bf,(%esp)
  100308:	e8 dc 27 00 00       	call   102ae9 <vprintfmt>
    return cnt;
  10030d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100310:	c9                   	leave  
  100311:	c3                   	ret    

00100312 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100312:	55                   	push   %ebp
  100313:	89 e5                	mov    %esp,%ebp
  100315:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100318:	8d 45 0c             	lea    0xc(%ebp),%eax
  10031b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  10031e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100321:	89 44 24 04          	mov    %eax,0x4(%esp)
  100325:	8b 45 08             	mov    0x8(%ebp),%eax
  100328:	89 04 24             	mov    %eax,(%esp)
  10032b:	e8 af ff ff ff       	call   1002df <vcprintf>
  100330:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  100333:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100336:	c9                   	leave  
  100337:	c3                   	ret    

00100338 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100338:	55                   	push   %ebp
  100339:	89 e5                	mov    %esp,%ebp
  10033b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10033e:	8b 45 08             	mov    0x8(%ebp),%eax
  100341:	89 04 24             	mov    %eax,(%esp)
  100344:	e8 42 12 00 00       	call   10158b <cons_putc>
}
  100349:	c9                   	leave  
  10034a:	c3                   	ret    

0010034b <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  10034b:	55                   	push   %ebp
  10034c:	89 e5                	mov    %esp,%ebp
  10034e:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100351:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  100358:	eb 13                	jmp    10036d <cputs+0x22>
        cputch(c, &cnt);
  10035a:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  10035e:	8d 55 f0             	lea    -0x10(%ebp),%edx
  100361:	89 54 24 04          	mov    %edx,0x4(%esp)
  100365:	89 04 24             	mov    %eax,(%esp)
  100368:	e8 52 ff ff ff       	call   1002bf <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  10036d:	8b 45 08             	mov    0x8(%ebp),%eax
  100370:	8d 50 01             	lea    0x1(%eax),%edx
  100373:	89 55 08             	mov    %edx,0x8(%ebp)
  100376:	0f b6 00             	movzbl (%eax),%eax
  100379:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037c:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  100380:	75 d8                	jne    10035a <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  100382:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100385:	89 44 24 04          	mov    %eax,0x4(%esp)
  100389:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  100390:	e8 2a ff ff ff       	call   1002bf <cputch>
    return cnt;
  100395:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100398:	c9                   	leave  
  100399:	c3                   	ret    

0010039a <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  10039a:	55                   	push   %ebp
  10039b:	89 e5                	mov    %esp,%ebp
  10039d:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1003a0:	e8 0f 12 00 00       	call   1015b4 <cons_getc>
  1003a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1003a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003ac:	74 f2                	je     1003a0 <getchar+0x6>
        /* do nothing */;
    return c;
  1003ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1003b1:	c9                   	leave  
  1003b2:	c3                   	ret    

001003b3 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1003b3:	55                   	push   %ebp
  1003b4:	89 e5                	mov    %esp,%ebp
  1003b6:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1003b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bc:	8b 00                	mov    (%eax),%eax
  1003be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1003c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1003c4:	8b 00                	mov    (%eax),%eax
  1003c6:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1003c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1003d0:	e9 d2 00 00 00       	jmp    1004a7 <stab_binsearch+0xf4>
        int true_m = (l + r) / 2, m = true_m;
  1003d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1003db:	01 d0                	add    %edx,%eax
  1003dd:	89 c2                	mov    %eax,%edx
  1003df:	c1 ea 1f             	shr    $0x1f,%edx
  1003e2:	01 d0                	add    %edx,%eax
  1003e4:	d1 f8                	sar    %eax
  1003e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1003e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003ec:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003ef:	eb 04                	jmp    1003f5 <stab_binsearch+0x42>
            m --;
  1003f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1003f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1003fb:	7c 1f                	jl     10041c <stab_binsearch+0x69>
  1003fd:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100400:	89 d0                	mov    %edx,%eax
  100402:	01 c0                	add    %eax,%eax
  100404:	01 d0                	add    %edx,%eax
  100406:	c1 e0 02             	shl    $0x2,%eax
  100409:	89 c2                	mov    %eax,%edx
  10040b:	8b 45 08             	mov    0x8(%ebp),%eax
  10040e:	01 d0                	add    %edx,%eax
  100410:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100414:	0f b6 c0             	movzbl %al,%eax
  100417:	3b 45 14             	cmp    0x14(%ebp),%eax
  10041a:	75 d5                	jne    1003f1 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  10041c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10041f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100422:	7d 0b                	jge    10042f <stab_binsearch+0x7c>
            l = true_m + 1;
  100424:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100427:	83 c0 01             	add    $0x1,%eax
  10042a:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  10042d:	eb 78                	jmp    1004a7 <stab_binsearch+0xf4>
        }

        // actual binary search
        any_matches = 1;
  10042f:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100436:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100439:	89 d0                	mov    %edx,%eax
  10043b:	01 c0                	add    %eax,%eax
  10043d:	01 d0                	add    %edx,%eax
  10043f:	c1 e0 02             	shl    $0x2,%eax
  100442:	89 c2                	mov    %eax,%edx
  100444:	8b 45 08             	mov    0x8(%ebp),%eax
  100447:	01 d0                	add    %edx,%eax
  100449:	8b 40 08             	mov    0x8(%eax),%eax
  10044c:	3b 45 18             	cmp    0x18(%ebp),%eax
  10044f:	73 13                	jae    100464 <stab_binsearch+0xb1>
            *region_left = m;
  100451:	8b 45 0c             	mov    0xc(%ebp),%eax
  100454:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100457:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100459:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10045c:	83 c0 01             	add    $0x1,%eax
  10045f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100462:	eb 43                	jmp    1004a7 <stab_binsearch+0xf4>
        } else if (stabs[m].n_value > addr) {
  100464:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100467:	89 d0                	mov    %edx,%eax
  100469:	01 c0                	add    %eax,%eax
  10046b:	01 d0                	add    %edx,%eax
  10046d:	c1 e0 02             	shl    $0x2,%eax
  100470:	89 c2                	mov    %eax,%edx
  100472:	8b 45 08             	mov    0x8(%ebp),%eax
  100475:	01 d0                	add    %edx,%eax
  100477:	8b 40 08             	mov    0x8(%eax),%eax
  10047a:	3b 45 18             	cmp    0x18(%ebp),%eax
  10047d:	76 16                	jbe    100495 <stab_binsearch+0xe2>
            *region_right = m - 1;
  10047f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100482:	8d 50 ff             	lea    -0x1(%eax),%edx
  100485:	8b 45 10             	mov    0x10(%ebp),%eax
  100488:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  10048a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10048d:	83 e8 01             	sub    $0x1,%eax
  100490:	89 45 f8             	mov    %eax,-0x8(%ebp)
  100493:	eb 12                	jmp    1004a7 <stab_binsearch+0xf4>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  100495:	8b 45 0c             	mov    0xc(%ebp),%eax
  100498:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10049b:	89 10                	mov    %edx,(%eax)
            l = m;
  10049d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004a0:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1004a3:	83 45 18 01          	addl   $0x1,0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  1004a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1004aa:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1004ad:	0f 8e 22 ff ff ff    	jle    1003d5 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  1004b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1004b7:	75 0f                	jne    1004c8 <stab_binsearch+0x115>
        *region_right = *region_left - 1;
  1004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004bc:	8b 00                	mov    (%eax),%eax
  1004be:	8d 50 ff             	lea    -0x1(%eax),%edx
  1004c1:	8b 45 10             	mov    0x10(%ebp),%eax
  1004c4:	89 10                	mov    %edx,(%eax)
  1004c6:	eb 3f                	jmp    100507 <stab_binsearch+0x154>
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  1004c8:	8b 45 10             	mov    0x10(%ebp),%eax
  1004cb:	8b 00                	mov    (%eax),%eax
  1004cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1004d0:	eb 04                	jmp    1004d6 <stab_binsearch+0x123>
  1004d2:	83 6d fc 01          	subl   $0x1,-0x4(%ebp)
  1004d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004d9:	8b 00                	mov    (%eax),%eax
  1004db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004de:	7d 1f                	jge    1004ff <stab_binsearch+0x14c>
  1004e0:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004e3:	89 d0                	mov    %edx,%eax
  1004e5:	01 c0                	add    %eax,%eax
  1004e7:	01 d0                	add    %edx,%eax
  1004e9:	c1 e0 02             	shl    $0x2,%eax
  1004ec:	89 c2                	mov    %eax,%edx
  1004ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f1:	01 d0                	add    %edx,%eax
  1004f3:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f7:	0f b6 c0             	movzbl %al,%eax
  1004fa:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004fd:	75 d3                	jne    1004d2 <stab_binsearch+0x11f>
            /* do nothing */;
        *region_left = l;
  1004ff:	8b 45 0c             	mov    0xc(%ebp),%eax
  100502:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100505:	89 10                	mov    %edx,(%eax)
    }
}
  100507:	c9                   	leave  
  100508:	c3                   	ret    

00100509 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  100509:	55                   	push   %ebp
  10050a:	89 e5                	mov    %esp,%ebp
  10050c:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  10050f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100512:	c7 00 0c 35 10 00    	movl   $0x10350c,(%eax)
    info->eip_line = 0;
  100518:	8b 45 0c             	mov    0xc(%ebp),%eax
  10051b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100522:	8b 45 0c             	mov    0xc(%ebp),%eax
  100525:	c7 40 08 0c 35 10 00 	movl   $0x10350c,0x8(%eax)
    info->eip_fn_namelen = 9;
  10052c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10052f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  100536:	8b 45 0c             	mov    0xc(%ebp),%eax
  100539:	8b 55 08             	mov    0x8(%ebp),%edx
  10053c:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  10053f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100542:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100549:	c7 45 f4 6c 3d 10 00 	movl   $0x103d6c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100550:	c7 45 f0 7c b4 10 00 	movl   $0x10b47c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  100557:	c7 45 ec 7d b4 10 00 	movl   $0x10b47d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  10055e:	c7 45 e8 65 d4 10 00 	movl   $0x10d465,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  100565:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100568:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  10056b:	76 0d                	jbe    10057a <debuginfo_eip+0x71>
  10056d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100570:	83 e8 01             	sub    $0x1,%eax
  100573:	0f b6 00             	movzbl (%eax),%eax
  100576:	84 c0                	test   %al,%al
  100578:	74 0a                	je     100584 <debuginfo_eip+0x7b>
        return -1;
  10057a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10057f:	e9 c0 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100584:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  10058b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100591:	29 c2                	sub    %eax,%edx
  100593:	89 d0                	mov    %edx,%eax
  100595:	c1 f8 02             	sar    $0x2,%eax
  100598:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  10059e:	83 e8 01             	sub    $0x1,%eax
  1005a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1005a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005a7:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005ab:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1005b2:	00 
  1005b3:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1005b6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ba:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1005bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1005c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005c4:	89 04 24             	mov    %eax,(%esp)
  1005c7:	e8 e7 fd ff ff       	call   1003b3 <stab_binsearch>
    if (lfile == 0)
  1005cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005cf:	85 c0                	test   %eax,%eax
  1005d1:	75 0a                	jne    1005dd <debuginfo_eip+0xd4>
        return -1;
  1005d3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1005d8:	e9 67 02 00 00       	jmp    100844 <debuginfo_eip+0x33b>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1005dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1005e0:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1005e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1005e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1005e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ec:	89 44 24 10          	mov    %eax,0x10(%esp)
  1005f0:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1005f7:	00 
  1005f8:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1005fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  1005ff:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100602:	89 44 24 04          	mov    %eax,0x4(%esp)
  100606:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100609:	89 04 24             	mov    %eax,(%esp)
  10060c:	e8 a2 fd ff ff       	call   1003b3 <stab_binsearch>

    if (lfun <= rfun) {
  100611:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100614:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100617:	39 c2                	cmp    %eax,%edx
  100619:	7f 7c                	jg     100697 <debuginfo_eip+0x18e>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10061b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10061e:	89 c2                	mov    %eax,%edx
  100620:	89 d0                	mov    %edx,%eax
  100622:	01 c0                	add    %eax,%eax
  100624:	01 d0                	add    %edx,%eax
  100626:	c1 e0 02             	shl    $0x2,%eax
  100629:	89 c2                	mov    %eax,%edx
  10062b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062e:	01 d0                	add    %edx,%eax
  100630:	8b 10                	mov    (%eax),%edx
  100632:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100635:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100638:	29 c1                	sub    %eax,%ecx
  10063a:	89 c8                	mov    %ecx,%eax
  10063c:	39 c2                	cmp    %eax,%edx
  10063e:	73 22                	jae    100662 <debuginfo_eip+0x159>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100640:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100643:	89 c2                	mov    %eax,%edx
  100645:	89 d0                	mov    %edx,%eax
  100647:	01 c0                	add    %eax,%eax
  100649:	01 d0                	add    %edx,%eax
  10064b:	c1 e0 02             	shl    $0x2,%eax
  10064e:	89 c2                	mov    %eax,%edx
  100650:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100653:	01 d0                	add    %edx,%eax
  100655:	8b 10                	mov    (%eax),%edx
  100657:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10065a:	01 c2                	add    %eax,%edx
  10065c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10065f:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100662:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100665:	89 c2                	mov    %eax,%edx
  100667:	89 d0                	mov    %edx,%eax
  100669:	01 c0                	add    %eax,%eax
  10066b:	01 d0                	add    %edx,%eax
  10066d:	c1 e0 02             	shl    $0x2,%eax
  100670:	89 c2                	mov    %eax,%edx
  100672:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100675:	01 d0                	add    %edx,%eax
  100677:	8b 50 08             	mov    0x8(%eax),%edx
  10067a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10067d:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100680:	8b 45 0c             	mov    0xc(%ebp),%eax
  100683:	8b 40 10             	mov    0x10(%eax),%eax
  100686:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  100689:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10068c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  10068f:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100692:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100695:	eb 15                	jmp    1006ac <debuginfo_eip+0x1a3>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  100697:	8b 45 0c             	mov    0xc(%ebp),%eax
  10069a:	8b 55 08             	mov    0x8(%ebp),%edx
  10069d:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1006a0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a3:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1006a6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006a9:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1006ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006af:	8b 40 08             	mov    0x8(%eax),%eax
  1006b2:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1006b9:	00 
  1006ba:	89 04 24             	mov    %eax,(%esp)
  1006bd:	e8 82 2a 00 00       	call   103144 <strfind>
  1006c2:	89 c2                	mov    %eax,%edx
  1006c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006c7:	8b 40 08             	mov    0x8(%eax),%eax
  1006ca:	29 c2                	sub    %eax,%edx
  1006cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1006cf:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1006d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006d5:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006d9:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1006e0:	00 
  1006e1:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1006e4:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006e8:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1006eb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006f2:	89 04 24             	mov    %eax,(%esp)
  1006f5:	e8 b9 fc ff ff       	call   1003b3 <stab_binsearch>
    if (lline <= rline) {
  1006fa:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1006fd:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100700:	39 c2                	cmp    %eax,%edx
  100702:	7f 24                	jg     100728 <debuginfo_eip+0x21f>
        info->eip_line = stabs[rline].n_desc;
  100704:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100707:	89 c2                	mov    %eax,%edx
  100709:	89 d0                	mov    %edx,%eax
  10070b:	01 c0                	add    %eax,%eax
  10070d:	01 d0                	add    %edx,%eax
  10070f:	c1 e0 02             	shl    $0x2,%eax
  100712:	89 c2                	mov    %eax,%edx
  100714:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100717:	01 d0                	add    %edx,%eax
  100719:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  10071d:	0f b7 d0             	movzwl %ax,%edx
  100720:	8b 45 0c             	mov    0xc(%ebp),%eax
  100723:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100726:	eb 13                	jmp    10073b <debuginfo_eip+0x232>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  100728:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10072d:	e9 12 01 00 00       	jmp    100844 <debuginfo_eip+0x33b>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100732:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100735:	83 e8 01             	sub    $0x1,%eax
  100738:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10073b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10073e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100741:	39 c2                	cmp    %eax,%edx
  100743:	7c 56                	jl     10079b <debuginfo_eip+0x292>
           && stabs[lline].n_type != N_SOL
  100745:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	89 d0                	mov    %edx,%eax
  10074c:	01 c0                	add    %eax,%eax
  10074e:	01 d0                	add    %edx,%eax
  100750:	c1 e0 02             	shl    $0x2,%eax
  100753:	89 c2                	mov    %eax,%edx
  100755:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100758:	01 d0                	add    %edx,%eax
  10075a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10075e:	3c 84                	cmp    $0x84,%al
  100760:	74 39                	je     10079b <debuginfo_eip+0x292>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100762:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100765:	89 c2                	mov    %eax,%edx
  100767:	89 d0                	mov    %edx,%eax
  100769:	01 c0                	add    %eax,%eax
  10076b:	01 d0                	add    %edx,%eax
  10076d:	c1 e0 02             	shl    $0x2,%eax
  100770:	89 c2                	mov    %eax,%edx
  100772:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100775:	01 d0                	add    %edx,%eax
  100777:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10077b:	3c 64                	cmp    $0x64,%al
  10077d:	75 b3                	jne    100732 <debuginfo_eip+0x229>
  10077f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100782:	89 c2                	mov    %eax,%edx
  100784:	89 d0                	mov    %edx,%eax
  100786:	01 c0                	add    %eax,%eax
  100788:	01 d0                	add    %edx,%eax
  10078a:	c1 e0 02             	shl    $0x2,%eax
  10078d:	89 c2                	mov    %eax,%edx
  10078f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100792:	01 d0                	add    %edx,%eax
  100794:	8b 40 08             	mov    0x8(%eax),%eax
  100797:	85 c0                	test   %eax,%eax
  100799:	74 97                	je     100732 <debuginfo_eip+0x229>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10079b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10079e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007a1:	39 c2                	cmp    %eax,%edx
  1007a3:	7c 46                	jl     1007eb <debuginfo_eip+0x2e2>
  1007a5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007a8:	89 c2                	mov    %eax,%edx
  1007aa:	89 d0                	mov    %edx,%eax
  1007ac:	01 c0                	add    %eax,%eax
  1007ae:	01 d0                	add    %edx,%eax
  1007b0:	c1 e0 02             	shl    $0x2,%eax
  1007b3:	89 c2                	mov    %eax,%edx
  1007b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007b8:	01 d0                	add    %edx,%eax
  1007ba:	8b 10                	mov    (%eax),%edx
  1007bc:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  1007bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007c2:	29 c1                	sub    %eax,%ecx
  1007c4:	89 c8                	mov    %ecx,%eax
  1007c6:	39 c2                	cmp    %eax,%edx
  1007c8:	73 21                	jae    1007eb <debuginfo_eip+0x2e2>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1007ca:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1007cd:	89 c2                	mov    %eax,%edx
  1007cf:	89 d0                	mov    %edx,%eax
  1007d1:	01 c0                	add    %eax,%eax
  1007d3:	01 d0                	add    %edx,%eax
  1007d5:	c1 e0 02             	shl    $0x2,%eax
  1007d8:	89 c2                	mov    %eax,%edx
  1007da:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007dd:	01 d0                	add    %edx,%eax
  1007df:	8b 10                	mov    (%eax),%edx
  1007e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1007e4:	01 c2                	add    %eax,%edx
  1007e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007e9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1007eb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1007ee:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007f1:	39 c2                	cmp    %eax,%edx
  1007f3:	7d 4a                	jge    10083f <debuginfo_eip+0x336>
        for (lline = lfun + 1;
  1007f5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007f8:	83 c0 01             	add    $0x1,%eax
  1007fb:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1007fe:	eb 18                	jmp    100818 <debuginfo_eip+0x30f>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100800:	8b 45 0c             	mov    0xc(%ebp),%eax
  100803:	8b 40 14             	mov    0x14(%eax),%eax
  100806:	8d 50 01             	lea    0x1(%eax),%edx
  100809:	8b 45 0c             	mov    0xc(%ebp),%eax
  10080c:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  10080f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100812:	83 c0 01             	add    $0x1,%eax
  100815:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100818:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10081b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  10081e:	39 c2                	cmp    %eax,%edx
  100820:	7d 1d                	jge    10083f <debuginfo_eip+0x336>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100822:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100825:	89 c2                	mov    %eax,%edx
  100827:	89 d0                	mov    %edx,%eax
  100829:	01 c0                	add    %eax,%eax
  10082b:	01 d0                	add    %edx,%eax
  10082d:	c1 e0 02             	shl    $0x2,%eax
  100830:	89 c2                	mov    %eax,%edx
  100832:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100835:	01 d0                	add    %edx,%eax
  100837:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10083b:	3c a0                	cmp    $0xa0,%al
  10083d:	74 c1                	je     100800 <debuginfo_eip+0x2f7>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10083f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100844:	c9                   	leave  
  100845:	c3                   	ret    

00100846 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100846:	55                   	push   %ebp
  100847:	89 e5                	mov    %esp,%ebp
  100849:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  10084c:	c7 04 24 16 35 10 00 	movl   $0x103516,(%esp)
  100853:	e8 ba fa ff ff       	call   100312 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100858:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10085f:	00 
  100860:	c7 04 24 2f 35 10 00 	movl   $0x10352f,(%esp)
  100867:	e8 a6 fa ff ff       	call   100312 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  10086c:	c7 44 24 04 59 34 10 	movl   $0x103459,0x4(%esp)
  100873:	00 
  100874:	c7 04 24 47 35 10 00 	movl   $0x103547,(%esp)
  10087b:	e8 92 fa ff ff       	call   100312 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100880:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100887:	00 
  100888:	c7 04 24 5f 35 10 00 	movl   $0x10355f,(%esp)
  10088f:	e8 7e fa ff ff       	call   100312 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100894:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  10089b:	00 
  10089c:	c7 04 24 77 35 10 00 	movl   $0x103577,(%esp)
  1008a3:	e8 6a fa ff ff       	call   100312 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1008a8:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  1008ad:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008b3:	b8 00 00 10 00       	mov    $0x100000,%eax
  1008b8:	29 c2                	sub    %eax,%edx
  1008ba:	89 d0                	mov    %edx,%eax
  1008bc:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1008c2:	85 c0                	test   %eax,%eax
  1008c4:	0f 48 c2             	cmovs  %edx,%eax
  1008c7:	c1 f8 0a             	sar    $0xa,%eax
  1008ca:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ce:	c7 04 24 90 35 10 00 	movl   $0x103590,(%esp)
  1008d5:	e8 38 fa ff ff       	call   100312 <cprintf>
}
  1008da:	c9                   	leave  
  1008db:	c3                   	ret    

001008dc <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1008dc:	55                   	push   %ebp
  1008dd:	89 e5                	mov    %esp,%ebp
  1008df:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1008e5:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1008e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1008ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1008ef:	89 04 24             	mov    %eax,(%esp)
  1008f2:	e8 12 fc ff ff       	call   100509 <debuginfo_eip>
  1008f7:	85 c0                	test   %eax,%eax
  1008f9:	74 15                	je     100910 <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1008fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1008fe:	89 44 24 04          	mov    %eax,0x4(%esp)
  100902:	c7 04 24 ba 35 10 00 	movl   $0x1035ba,(%esp)
  100909:	e8 04 fa ff ff       	call   100312 <cprintf>
  10090e:	eb 6d                	jmp    10097d <print_debuginfo+0xa1>
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100910:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100917:	eb 1c                	jmp    100935 <print_debuginfo+0x59>
            fnname[j] = info.eip_fn_name[j];
  100919:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10091c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10091f:	01 d0                	add    %edx,%eax
  100921:	0f b6 00             	movzbl (%eax),%eax
  100924:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  10092a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10092d:	01 ca                	add    %ecx,%edx
  10092f:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100931:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100935:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100938:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  10093b:	7f dc                	jg     100919 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  10093d:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100943:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100946:	01 d0                	add    %edx,%eax
  100948:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  10094b:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  10094e:	8b 55 08             	mov    0x8(%ebp),%edx
  100951:	89 d1                	mov    %edx,%ecx
  100953:	29 c1                	sub    %eax,%ecx
  100955:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100958:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10095b:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  10095f:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100965:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100969:	89 54 24 08          	mov    %edx,0x8(%esp)
  10096d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100971:	c7 04 24 d6 35 10 00 	movl   $0x1035d6,(%esp)
  100978:	e8 95 f9 ff ff       	call   100312 <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  10097d:	c9                   	leave  
  10097e:	c3                   	ret    

0010097f <read_eip>:

static __noinline uint32_t
read_eip(void) {
  10097f:	55                   	push   %ebp
  100980:	89 e5                	mov    %esp,%ebp
  100982:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100985:	8b 45 04             	mov    0x4(%ebp),%eax
  100988:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  10098b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10098e:	c9                   	leave  
  10098f:	c3                   	ret    

00100990 <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100990:	55                   	push   %ebp
  100991:	89 e5                	mov    %esp,%ebp
  100993:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100996:	89 e8                	mov    %ebp,%eax
  100998:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    return ebp;
  10099b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
	uint32_t ebp, eip;
	ebp = read_ebp();
  10099e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eip = read_eip();
  1009a1:	e8 d9 ff ff ff       	call   10097f <read_eip>
  1009a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
	unsigned int i, j;
	for(i = 0; i < STACKFRAME_DEPTH && ebp > 0; i++)
  1009a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  1009b0:	e9 82 00 00 00       	jmp    100a37 <print_stackframe+0xa7>
	{
		cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
  1009b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1009b8:	89 44 24 08          	mov    %eax,0x8(%esp)
  1009bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009bf:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009c3:	c7 04 24 e8 35 10 00 	movl   $0x1035e8,(%esp)
  1009ca:	e8 43 f9 ff ff       	call   100312 <cprintf>
		for(j = 0; j < 4; j++)
  1009cf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  1009d6:	eb 28                	jmp    100a00 <print_stackframe+0x70>
		{
			cprintf("0x%08x ", ((uint32_t*)ebp+2)[j]);
  1009d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1009db:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  1009e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009e5:	01 d0                	add    %edx,%eax
  1009e7:	83 c0 08             	add    $0x8,%eax
  1009ea:	8b 00                	mov    (%eax),%eax
  1009ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009f0:	c7 04 24 04 36 10 00 	movl   $0x103604,(%esp)
  1009f7:	e8 16 f9 ff ff       	call   100312 <cprintf>
	eip = read_eip();
	unsigned int i, j;
	for(i = 0; i < STACKFRAME_DEPTH && ebp > 0; i++)
	{
		cprintf("ebp:0x%08x eip:0x%08x args:", ebp, eip);
		for(j = 0; j < 4; j++)
  1009fc:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
  100a00:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100a04:	76 d2                	jbe    1009d8 <print_stackframe+0x48>
		{
			cprintf("0x%08x ", ((uint32_t*)ebp+2)[j]);
		}
		cprintf("\n");
  100a06:	c7 04 24 0c 36 10 00 	movl   $0x10360c,(%esp)
  100a0d:	e8 00 f9 ff ff       	call   100312 <cprintf>
		print_debuginfo(eip-1);
  100a12:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a15:	83 e8 01             	sub    $0x1,%eax
  100a18:	89 04 24             	mov    %eax,(%esp)
  100a1b:	e8 bc fe ff ff       	call   1008dc <print_debuginfo>
		eip = ((uint32_t*)ebp)[1];
  100a20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a23:	83 c0 04             	add    $0x4,%eax
  100a26:	8b 00                	mov    (%eax),%eax
  100a28:	89 45 f0             	mov    %eax,-0x10(%ebp)
		ebp = ((uint32_t*)ebp)[0];
  100a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a2e:	8b 00                	mov    (%eax),%eax
  100a30:	89 45 f4             	mov    %eax,-0xc(%ebp)
      */
	uint32_t ebp, eip;
	ebp = read_ebp();
	eip = read_eip();
	unsigned int i, j;
	for(i = 0; i < STACKFRAME_DEPTH && ebp > 0; i++)
  100a33:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  100a37:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100a3b:	77 0a                	ja     100a47 <print_stackframe+0xb7>
  100a3d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100a41:	0f 85 6e ff ff ff    	jne    1009b5 <print_stackframe+0x25>
		cprintf("\n");
		print_debuginfo(eip-1);
		eip = ((uint32_t*)ebp)[1];
		ebp = ((uint32_t*)ebp)[0];
	}
}
  100a47:	c9                   	leave  
  100a48:	c3                   	ret    

00100a49 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100a49:	55                   	push   %ebp
  100a4a:	89 e5                	mov    %esp,%ebp
  100a4c:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100a4f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a56:	eb 0c                	jmp    100a64 <parse+0x1b>
            *buf ++ = '\0';
  100a58:	8b 45 08             	mov    0x8(%ebp),%eax
  100a5b:	8d 50 01             	lea    0x1(%eax),%edx
  100a5e:	89 55 08             	mov    %edx,0x8(%ebp)
  100a61:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100a64:	8b 45 08             	mov    0x8(%ebp),%eax
  100a67:	0f b6 00             	movzbl (%eax),%eax
  100a6a:	84 c0                	test   %al,%al
  100a6c:	74 1d                	je     100a8b <parse+0x42>
  100a6e:	8b 45 08             	mov    0x8(%ebp),%eax
  100a71:	0f b6 00             	movzbl (%eax),%eax
  100a74:	0f be c0             	movsbl %al,%eax
  100a77:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a7b:	c7 04 24 90 36 10 00 	movl   $0x103690,(%esp)
  100a82:	e8 8a 26 00 00       	call   103111 <strchr>
  100a87:	85 c0                	test   %eax,%eax
  100a89:	75 cd                	jne    100a58 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100a8b:	8b 45 08             	mov    0x8(%ebp),%eax
  100a8e:	0f b6 00             	movzbl (%eax),%eax
  100a91:	84 c0                	test   %al,%al
  100a93:	75 02                	jne    100a97 <parse+0x4e>
            break;
  100a95:	eb 67                	jmp    100afe <parse+0xb5>
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100a97:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100a9b:	75 14                	jne    100ab1 <parse+0x68>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100a9d:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100aa4:	00 
  100aa5:	c7 04 24 95 36 10 00 	movl   $0x103695,(%esp)
  100aac:	e8 61 f8 ff ff       	call   100312 <cprintf>
        }
        argv[argc ++] = buf;
  100ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ab4:	8d 50 01             	lea    0x1(%eax),%edx
  100ab7:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100aba:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ac1:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ac4:	01 c2                	add    %eax,%edx
  100ac6:	8b 45 08             	mov    0x8(%ebp),%eax
  100ac9:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100acb:	eb 04                	jmp    100ad1 <parse+0x88>
            buf ++;
  100acd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  100ad4:	0f b6 00             	movzbl (%eax),%eax
  100ad7:	84 c0                	test   %al,%al
  100ad9:	74 1d                	je     100af8 <parse+0xaf>
  100adb:	8b 45 08             	mov    0x8(%ebp),%eax
  100ade:	0f b6 00             	movzbl (%eax),%eax
  100ae1:	0f be c0             	movsbl %al,%eax
  100ae4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ae8:	c7 04 24 90 36 10 00 	movl   $0x103690,(%esp)
  100aef:	e8 1d 26 00 00       	call   103111 <strchr>
  100af4:	85 c0                	test   %eax,%eax
  100af6:	74 d5                	je     100acd <parse+0x84>
            buf ++;
        }
    }
  100af8:	90                   	nop
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100af9:	e9 66 ff ff ff       	jmp    100a64 <parse+0x1b>
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100afe:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100b01:	c9                   	leave  
  100b02:	c3                   	ret    

00100b03 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100b03:	55                   	push   %ebp
  100b04:	89 e5                	mov    %esp,%ebp
  100b06:	83 ec 68             	sub    $0x68,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100b09:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100b0c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b10:	8b 45 08             	mov    0x8(%ebp),%eax
  100b13:	89 04 24             	mov    %eax,(%esp)
  100b16:	e8 2e ff ff ff       	call   100a49 <parse>
  100b1b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100b1e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b22:	75 0a                	jne    100b2e <runcmd+0x2b>
        return 0;
  100b24:	b8 00 00 00 00       	mov    $0x0,%eax
  100b29:	e9 85 00 00 00       	jmp    100bb3 <runcmd+0xb0>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b2e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100b35:	eb 5c                	jmp    100b93 <runcmd+0x90>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100b37:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100b3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b3d:	89 d0                	mov    %edx,%eax
  100b3f:	01 c0                	add    %eax,%eax
  100b41:	01 d0                	add    %edx,%eax
  100b43:	c1 e0 02             	shl    $0x2,%eax
  100b46:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b4b:	8b 00                	mov    (%eax),%eax
  100b4d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100b51:	89 04 24             	mov    %eax,(%esp)
  100b54:	e8 19 25 00 00       	call   103072 <strcmp>
  100b59:	85 c0                	test   %eax,%eax
  100b5b:	75 32                	jne    100b8f <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100b5d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b60:	89 d0                	mov    %edx,%eax
  100b62:	01 c0                	add    %eax,%eax
  100b64:	01 d0                	add    %edx,%eax
  100b66:	c1 e0 02             	shl    $0x2,%eax
  100b69:	05 00 e0 10 00       	add    $0x10e000,%eax
  100b6e:	8b 40 08             	mov    0x8(%eax),%eax
  100b71:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b74:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100b77:	8b 55 0c             	mov    0xc(%ebp),%edx
  100b7a:	89 54 24 08          	mov    %edx,0x8(%esp)
  100b7e:	8d 55 b0             	lea    -0x50(%ebp),%edx
  100b81:	83 c2 04             	add    $0x4,%edx
  100b84:	89 54 24 04          	mov    %edx,0x4(%esp)
  100b88:	89 0c 24             	mov    %ecx,(%esp)
  100b8b:	ff d0                	call   *%eax
  100b8d:	eb 24                	jmp    100bb3 <runcmd+0xb0>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100b8f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b96:	83 f8 02             	cmp    $0x2,%eax
  100b99:	76 9c                	jbe    100b37 <runcmd+0x34>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100b9b:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100b9e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba2:	c7 04 24 b3 36 10 00 	movl   $0x1036b3,(%esp)
  100ba9:	e8 64 f7 ff ff       	call   100312 <cprintf>
    return 0;
  100bae:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100bb3:	c9                   	leave  
  100bb4:	c3                   	ret    

00100bb5 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100bb5:	55                   	push   %ebp
  100bb6:	89 e5                	mov    %esp,%ebp
  100bb8:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100bbb:	c7 04 24 cc 36 10 00 	movl   $0x1036cc,(%esp)
  100bc2:	e8 4b f7 ff ff       	call   100312 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100bc7:	c7 04 24 f4 36 10 00 	movl   $0x1036f4,(%esp)
  100bce:	e8 3f f7 ff ff       	call   100312 <cprintf>

    if (tf != NULL) {
  100bd3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100bd7:	74 0b                	je     100be4 <kmonitor+0x2f>
        print_trapframe(tf);
  100bd9:	8b 45 08             	mov    0x8(%ebp),%eax
  100bdc:	89 04 24             	mov    %eax,(%esp)
  100bdf:	e8 cd 0d 00 00       	call   1019b1 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100be4:	c7 04 24 19 37 10 00 	movl   $0x103719,(%esp)
  100beb:	e8 19 f6 ff ff       	call   100209 <readline>
  100bf0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100bf3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100bf7:	74 18                	je     100c11 <kmonitor+0x5c>
            if (runcmd(buf, tf) < 0) {
  100bf9:	8b 45 08             	mov    0x8(%ebp),%eax
  100bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c00:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c03:	89 04 24             	mov    %eax,(%esp)
  100c06:	e8 f8 fe ff ff       	call   100b03 <runcmd>
  100c0b:	85 c0                	test   %eax,%eax
  100c0d:	79 02                	jns    100c11 <kmonitor+0x5c>
                break;
  100c0f:	eb 02                	jmp    100c13 <kmonitor+0x5e>
            }
        }
    }
  100c11:	eb d1                	jmp    100be4 <kmonitor+0x2f>
}
  100c13:	c9                   	leave  
  100c14:	c3                   	ret    

00100c15 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100c15:	55                   	push   %ebp
  100c16:	89 e5                	mov    %esp,%ebp
  100c18:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c1b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c22:	eb 3f                	jmp    100c63 <mon_help+0x4e>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100c24:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c27:	89 d0                	mov    %edx,%eax
  100c29:	01 c0                	add    %eax,%eax
  100c2b:	01 d0                	add    %edx,%eax
  100c2d:	c1 e0 02             	shl    $0x2,%eax
  100c30:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c35:	8b 48 04             	mov    0x4(%eax),%ecx
  100c38:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c3b:	89 d0                	mov    %edx,%eax
  100c3d:	01 c0                	add    %eax,%eax
  100c3f:	01 d0                	add    %edx,%eax
  100c41:	c1 e0 02             	shl    $0x2,%eax
  100c44:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c49:	8b 00                	mov    (%eax),%eax
  100c4b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c4f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c53:	c7 04 24 1d 37 10 00 	movl   $0x10371d,(%esp)
  100c5a:	e8 b3 f6 ff ff       	call   100312 <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c5f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  100c63:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c66:	83 f8 02             	cmp    $0x2,%eax
  100c69:	76 b9                	jbe    100c24 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100c6b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c70:	c9                   	leave  
  100c71:	c3                   	ret    

00100c72 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100c72:	55                   	push   %ebp
  100c73:	89 e5                	mov    %esp,%ebp
  100c75:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100c78:	e8 c9 fb ff ff       	call   100846 <print_kerninfo>
    return 0;
  100c7d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c82:	c9                   	leave  
  100c83:	c3                   	ret    

00100c84 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100c84:	55                   	push   %ebp
  100c85:	89 e5                	mov    %esp,%ebp
  100c87:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100c8a:	e8 01 fd ff ff       	call   100990 <print_stackframe>
    return 0;
  100c8f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100c94:	c9                   	leave  
  100c95:	c3                   	ret    

00100c96 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  100c96:	55                   	push   %ebp
  100c97:	89 e5                	mov    %esp,%ebp
  100c99:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100c9c:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  100ca1:	85 c0                	test   %eax,%eax
  100ca3:	74 02                	je     100ca7 <__panic+0x11>
        goto panic_dead;
  100ca5:	eb 48                	jmp    100cef <__panic+0x59>
    }
    is_panic = 1;
  100ca7:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  100cae:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  100cb1:	8d 45 14             	lea    0x14(%ebp),%eax
  100cb4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100cb7:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cba:	89 44 24 08          	mov    %eax,0x8(%esp)
  100cbe:	8b 45 08             	mov    0x8(%ebp),%eax
  100cc1:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc5:	c7 04 24 26 37 10 00 	movl   $0x103726,(%esp)
  100ccc:	e8 41 f6 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100cd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd4:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cd8:	8b 45 10             	mov    0x10(%ebp),%eax
  100cdb:	89 04 24             	mov    %eax,(%esp)
  100cde:	e8 fc f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100ce3:	c7 04 24 42 37 10 00 	movl   $0x103742,(%esp)
  100cea:	e8 23 f6 ff ff       	call   100312 <cprintf>
    va_end(ap);

panic_dead:
    intr_disable();
  100cef:	e8 22 09 00 00       	call   101616 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100cf4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100cfb:	e8 b5 fe ff ff       	call   100bb5 <kmonitor>
    }
  100d00:	eb f2                	jmp    100cf4 <__panic+0x5e>

00100d02 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100d02:	55                   	push   %ebp
  100d03:	89 e5                	mov    %esp,%ebp
  100d05:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100d08:	8d 45 14             	lea    0x14(%ebp),%eax
  100d0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100d0e:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d11:	89 44 24 08          	mov    %eax,0x8(%esp)
  100d15:	8b 45 08             	mov    0x8(%ebp),%eax
  100d18:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d1c:	c7 04 24 44 37 10 00 	movl   $0x103744,(%esp)
  100d23:	e8 ea f5 ff ff       	call   100312 <cprintf>
    vcprintf(fmt, ap);
  100d28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d2b:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d2f:	8b 45 10             	mov    0x10(%ebp),%eax
  100d32:	89 04 24             	mov    %eax,(%esp)
  100d35:	e8 a5 f5 ff ff       	call   1002df <vcprintf>
    cprintf("\n");
  100d3a:	c7 04 24 42 37 10 00 	movl   $0x103742,(%esp)
  100d41:	e8 cc f5 ff ff       	call   100312 <cprintf>
    va_end(ap);
}
  100d46:	c9                   	leave  
  100d47:	c3                   	ret    

00100d48 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100d48:	55                   	push   %ebp
  100d49:	89 e5                	mov    %esp,%ebp
    return is_panic;
  100d4b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100d50:	5d                   	pop    %ebp
  100d51:	c3                   	ret    

00100d52 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d52:	55                   	push   %ebp
  100d53:	89 e5                	mov    %esp,%ebp
  100d55:	83 ec 28             	sub    $0x28,%esp
  100d58:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d5e:	c6 45 f5 34          	movb   $0x34,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d62:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100d66:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d6a:	ee                   	out    %al,(%dx)
  100d6b:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100d71:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
  100d75:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100d79:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100d7d:	ee                   	out    %al,(%dx)
  100d7e:	66 c7 45 ee 40 00    	movw   $0x40,-0x12(%ebp)
  100d84:	c6 45 ed 2e          	movb   $0x2e,-0x13(%ebp)
  100d88:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100d8c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100d90:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100d91:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100d98:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100d9b:	c7 04 24 62 37 10 00 	movl   $0x103762,(%esp)
  100da2:	e8 6b f5 ff ff       	call   100312 <cprintf>
    pic_enable(IRQ_TIMER);
  100da7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100dae:	e8 c1 08 00 00       	call   101674 <pic_enable>
}
  100db3:	c9                   	leave  
  100db4:	c3                   	ret    

00100db5 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100db5:	55                   	push   %ebp
  100db6:	89 e5                	mov    %esp,%ebp
  100db8:	83 ec 10             	sub    $0x10,%esp
  100dbb:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100dc1:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100dc5:	89 c2                	mov    %eax,%edx
  100dc7:	ec                   	in     (%dx),%al
  100dc8:	88 45 fd             	mov    %al,-0x3(%ebp)
  100dcb:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100dd1:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100dd5:	89 c2                	mov    %eax,%edx
  100dd7:	ec                   	in     (%dx),%al
  100dd8:	88 45 f9             	mov    %al,-0x7(%ebp)
  100ddb:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100de1:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100de5:	89 c2                	mov    %eax,%edx
  100de7:	ec                   	in     (%dx),%al
  100de8:	88 45 f5             	mov    %al,-0xb(%ebp)
  100deb:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
  100df1:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100df5:	89 c2                	mov    %eax,%edx
  100df7:	ec                   	in     (%dx),%al
  100df8:	88 45 f1             	mov    %al,-0xf(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100dfb:	c9                   	leave  
  100dfc:	c3                   	ret    

00100dfd <cga_init>:
static uint16_t addr_6845;

/* TEXT-mode CGA/VGA display output */

static void
cga_init(void) {
  100dfd:	55                   	push   %ebp
  100dfe:	89 e5                	mov    %esp,%ebp
  100e00:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;
  100e03:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;
  100e0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e0d:	0f b7 00             	movzwl (%eax),%eax
  100e10:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;
  100e14:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e17:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {
  100e1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e1f:	0f b7 00             	movzwl (%eax),%eax
  100e22:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100e26:	74 12                	je     100e3a <cga_init+0x3d>
        cp = (uint16_t*)MONO_BUF;
  100e28:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;
  100e2f:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e36:	b4 03 
  100e38:	eb 13                	jmp    100e4d <cga_init+0x50>
    } else {
        *cp = was;
  100e3a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e3d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e41:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;
  100e44:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e4b:	d4 03 
    }

    // Extract cursor location
    uint32_t pos;
    outb(addr_6845, 14);
  100e4d:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e54:	0f b7 c0             	movzwl %ax,%eax
  100e57:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100e5b:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e5f:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100e63:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100e67:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;
  100e68:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e6f:	83 c0 01             	add    $0x1,%eax
  100e72:	0f b7 c0             	movzwl %ax,%eax
  100e75:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e79:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100e7d:	89 c2                	mov    %eax,%edx
  100e7f:	ec                   	in     (%dx),%al
  100e80:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100e83:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100e87:	0f b6 c0             	movzbl %al,%eax
  100e8a:	c1 e0 08             	shl    $0x8,%eax
  100e8d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100e90:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e97:	0f b7 c0             	movzwl %ax,%eax
  100e9a:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  100e9e:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ea2:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100ea6:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100eaa:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);
  100eab:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100eb2:	83 c0 01             	add    $0x1,%eax
  100eb5:	0f b7 c0             	movzwl %ax,%eax
  100eb8:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ebc:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100ec0:	89 c2                	mov    %eax,%edx
  100ec2:	ec                   	in     (%dx),%al
  100ec3:	88 45 e5             	mov    %al,-0x1b(%ebp)
    return data;
  100ec6:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100eca:	0f b6 c0             	movzbl %al,%eax
  100ecd:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;
  100ed0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ed3:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;
  100ed8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100edb:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100ee1:	c9                   	leave  
  100ee2:	c3                   	ret    

00100ee3 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100ee3:	55                   	push   %ebp
  100ee4:	89 e5                	mov    %esp,%ebp
  100ee6:	83 ec 48             	sub    $0x48,%esp
  100ee9:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100eef:	c6 45 f5 00          	movb   $0x0,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ef3:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100ef7:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100efb:	ee                   	out    %al,(%dx)
  100efc:	66 c7 45 f2 fb 03    	movw   $0x3fb,-0xe(%ebp)
  100f02:	c6 45 f1 80          	movb   $0x80,-0xf(%ebp)
  100f06:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f0a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f0e:	ee                   	out    %al,(%dx)
  100f0f:	66 c7 45 ee f8 03    	movw   $0x3f8,-0x12(%ebp)
  100f15:	c6 45 ed 0c          	movb   $0xc,-0x13(%ebp)
  100f19:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f1d:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f21:	ee                   	out    %al,(%dx)
  100f22:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f28:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
  100f2c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f30:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f34:	ee                   	out    %al,(%dx)
  100f35:	66 c7 45 e6 fb 03    	movw   $0x3fb,-0x1a(%ebp)
  100f3b:	c6 45 e5 03          	movb   $0x3,-0x1b(%ebp)
  100f3f:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100f43:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100f47:	ee                   	out    %al,(%dx)
  100f48:	66 c7 45 e2 fc 03    	movw   $0x3fc,-0x1e(%ebp)
  100f4e:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
  100f52:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100f56:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100f5a:	ee                   	out    %al,(%dx)
  100f5b:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100f61:	c6 45 dd 01          	movb   $0x1,-0x23(%ebp)
  100f65:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f69:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100f6d:	ee                   	out    %al,(%dx)
  100f6e:	66 c7 45 da fd 03    	movw   $0x3fd,-0x26(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f74:	0f b7 45 da          	movzwl -0x26(%ebp),%eax
  100f78:	89 c2                	mov    %eax,%edx
  100f7a:	ec                   	in     (%dx),%al
  100f7b:	88 45 d9             	mov    %al,-0x27(%ebp)
    return data;
  100f7e:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100f82:	3c ff                	cmp    $0xff,%al
  100f84:	0f 95 c0             	setne  %al
  100f87:	0f b6 c0             	movzbl %al,%eax
  100f8a:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100f8f:	66 c7 45 d6 fa 03    	movw   $0x3fa,-0x2a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f95:	0f b7 45 d6          	movzwl -0x2a(%ebp),%eax
  100f99:	89 c2                	mov    %eax,%edx
  100f9b:	ec                   	in     (%dx),%al
  100f9c:	88 45 d5             	mov    %al,-0x2b(%ebp)
  100f9f:	66 c7 45 d2 f8 03    	movw   $0x3f8,-0x2e(%ebp)
  100fa5:	0f b7 45 d2          	movzwl -0x2e(%ebp),%eax
  100fa9:	89 c2                	mov    %eax,%edx
  100fab:	ec                   	in     (%dx),%al
  100fac:	88 45 d1             	mov    %al,-0x2f(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100faf:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fb4:	85 c0                	test   %eax,%eax
  100fb6:	74 0c                	je     100fc4 <serial_init+0xe1>
        pic_enable(IRQ_COM1);
  100fb8:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fbf:	e8 b0 06 00 00       	call   101674 <pic_enable>
    }
}
  100fc4:	c9                   	leave  
  100fc5:	c3                   	ret    

00100fc6 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100fc6:	55                   	push   %ebp
  100fc7:	89 e5                	mov    %esp,%ebp
  100fc9:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fcc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100fd3:	eb 09                	jmp    100fde <lpt_putc_sub+0x18>
        delay();
  100fd5:	e8 db fd ff ff       	call   100db5 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100fda:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100fde:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  100fe4:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100fe8:	89 c2                	mov    %eax,%edx
  100fea:	ec                   	in     (%dx),%al
  100feb:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  100fee:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  100ff2:	84 c0                	test   %al,%al
  100ff4:	78 09                	js     100fff <lpt_putc_sub+0x39>
  100ff6:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  100ffd:	7e d6                	jle    100fd5 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  100fff:	8b 45 08             	mov    0x8(%ebp),%eax
  101002:	0f b6 c0             	movzbl %al,%eax
  101005:	66 c7 45 f6 78 03    	movw   $0x378,-0xa(%ebp)
  10100b:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10100e:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  101012:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101016:	ee                   	out    %al,(%dx)
  101017:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  10101d:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101021:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101025:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101029:	ee                   	out    %al,(%dx)
  10102a:	66 c7 45 ee 7a 03    	movw   $0x37a,-0x12(%ebp)
  101030:	c6 45 ed 08          	movb   $0x8,-0x13(%ebp)
  101034:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101038:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10103c:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  10103d:	c9                   	leave  
  10103e:	c3                   	ret    

0010103f <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  10103f:	55                   	push   %ebp
  101040:	89 e5                	mov    %esp,%ebp
  101042:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101045:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101049:	74 0d                	je     101058 <lpt_putc+0x19>
        lpt_putc_sub(c);
  10104b:	8b 45 08             	mov    0x8(%ebp),%eax
  10104e:	89 04 24             	mov    %eax,(%esp)
  101051:	e8 70 ff ff ff       	call   100fc6 <lpt_putc_sub>
  101056:	eb 24                	jmp    10107c <lpt_putc+0x3d>
    }
    else {
        lpt_putc_sub('\b');
  101058:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10105f:	e8 62 ff ff ff       	call   100fc6 <lpt_putc_sub>
        lpt_putc_sub(' ');
  101064:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10106b:	e8 56 ff ff ff       	call   100fc6 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101070:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101077:	e8 4a ff ff ff       	call   100fc6 <lpt_putc_sub>
    }
}
  10107c:	c9                   	leave  
  10107d:	c3                   	ret    

0010107e <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  10107e:	55                   	push   %ebp
  10107f:	89 e5                	mov    %esp,%ebp
  101081:	53                   	push   %ebx
  101082:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  101085:	8b 45 08             	mov    0x8(%ebp),%eax
  101088:	b0 00                	mov    $0x0,%al
  10108a:	85 c0                	test   %eax,%eax
  10108c:	75 07                	jne    101095 <cga_putc+0x17>
        c |= 0x0700;
  10108e:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101095:	8b 45 08             	mov    0x8(%ebp),%eax
  101098:	0f b6 c0             	movzbl %al,%eax
  10109b:	83 f8 0a             	cmp    $0xa,%eax
  10109e:	74 4c                	je     1010ec <cga_putc+0x6e>
  1010a0:	83 f8 0d             	cmp    $0xd,%eax
  1010a3:	74 57                	je     1010fc <cga_putc+0x7e>
  1010a5:	83 f8 08             	cmp    $0x8,%eax
  1010a8:	0f 85 88 00 00 00    	jne    101136 <cga_putc+0xb8>
    case '\b':
        if (crt_pos > 0) {
  1010ae:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010b5:	66 85 c0             	test   %ax,%ax
  1010b8:	74 30                	je     1010ea <cga_putc+0x6c>
            crt_pos --;
  1010ba:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010c1:	83 e8 01             	sub    $0x1,%eax
  1010c4:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010ca:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1010cf:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  1010d6:	0f b7 d2             	movzwl %dx,%edx
  1010d9:	01 d2                	add    %edx,%edx
  1010db:	01 c2                	add    %eax,%edx
  1010dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1010e0:	b0 00                	mov    $0x0,%al
  1010e2:	83 c8 20             	or     $0x20,%eax
  1010e5:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1010e8:	eb 72                	jmp    10115c <cga_putc+0xde>
  1010ea:	eb 70                	jmp    10115c <cga_putc+0xde>
    case '\n':
        crt_pos += CRT_COLS;
  1010ec:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010f3:	83 c0 50             	add    $0x50,%eax
  1010f6:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1010fc:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  101103:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  10110a:	0f b7 c1             	movzwl %cx,%eax
  10110d:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  101113:	c1 e8 10             	shr    $0x10,%eax
  101116:	89 c2                	mov    %eax,%edx
  101118:	66 c1 ea 06          	shr    $0x6,%dx
  10111c:	89 d0                	mov    %edx,%eax
  10111e:	c1 e0 02             	shl    $0x2,%eax
  101121:	01 d0                	add    %edx,%eax
  101123:	c1 e0 04             	shl    $0x4,%eax
  101126:	29 c1                	sub    %eax,%ecx
  101128:	89 ca                	mov    %ecx,%edx
  10112a:	89 d8                	mov    %ebx,%eax
  10112c:	29 d0                	sub    %edx,%eax
  10112e:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  101134:	eb 26                	jmp    10115c <cga_putc+0xde>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  101136:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  10113c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101143:	8d 50 01             	lea    0x1(%eax),%edx
  101146:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  10114d:	0f b7 c0             	movzwl %ax,%eax
  101150:	01 c0                	add    %eax,%eax
  101152:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101155:	8b 45 08             	mov    0x8(%ebp),%eax
  101158:	66 89 02             	mov    %ax,(%edx)
        break;
  10115b:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  10115c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101163:	66 3d cf 07          	cmp    $0x7cf,%ax
  101167:	76 5b                	jbe    1011c4 <cga_putc+0x146>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101169:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10116e:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  101174:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101179:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101180:	00 
  101181:	89 54 24 04          	mov    %edx,0x4(%esp)
  101185:	89 04 24             	mov    %eax,(%esp)
  101188:	e8 82 21 00 00       	call   10330f <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10118d:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  101194:	eb 15                	jmp    1011ab <cga_putc+0x12d>
            crt_buf[i] = 0x0700 | ' ';
  101196:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  10119b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10119e:	01 d2                	add    %edx,%edx
  1011a0:	01 d0                	add    %edx,%eax
  1011a2:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011a7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1011ab:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011b2:	7e e2                	jle    101196 <cga_putc+0x118>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011b4:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011bb:	83 e8 50             	sub    $0x50,%eax
  1011be:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  1011c4:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  1011cb:	0f b7 c0             	movzwl %ax,%eax
  1011ce:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  1011d2:	c6 45 f1 0e          	movb   $0xe,-0xf(%ebp)
  1011d6:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1011da:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1011de:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  1011df:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011e6:	66 c1 e8 08          	shr    $0x8,%ax
  1011ea:	0f b6 c0             	movzbl %al,%eax
  1011ed:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  1011f4:	83 c2 01             	add    $0x1,%edx
  1011f7:	0f b7 d2             	movzwl %dx,%edx
  1011fa:	66 89 55 ee          	mov    %dx,-0x12(%ebp)
  1011fe:	88 45 ed             	mov    %al,-0x13(%ebp)
  101201:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101205:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101209:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  10120a:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  101211:	0f b7 c0             	movzwl %ax,%eax
  101214:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
  101218:	c6 45 e9 0f          	movb   $0xf,-0x17(%ebp)
  10121c:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101220:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101224:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  101225:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10122c:	0f b6 c0             	movzbl %al,%eax
  10122f:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101236:	83 c2 01             	add    $0x1,%edx
  101239:	0f b7 d2             	movzwl %dx,%edx
  10123c:	66 89 55 e6          	mov    %dx,-0x1a(%ebp)
  101240:	88 45 e5             	mov    %al,-0x1b(%ebp)
  101243:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101247:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10124b:	ee                   	out    %al,(%dx)
}
  10124c:	83 c4 34             	add    $0x34,%esp
  10124f:	5b                   	pop    %ebx
  101250:	5d                   	pop    %ebp
  101251:	c3                   	ret    

00101252 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101252:	55                   	push   %ebp
  101253:	89 e5                	mov    %esp,%ebp
  101255:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101258:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10125f:	eb 09                	jmp    10126a <serial_putc_sub+0x18>
        delay();
  101261:	e8 4f fb ff ff       	call   100db5 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101266:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10126a:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101270:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101274:	89 c2                	mov    %eax,%edx
  101276:	ec                   	in     (%dx),%al
  101277:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10127a:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10127e:	0f b6 c0             	movzbl %al,%eax
  101281:	83 e0 20             	and    $0x20,%eax
  101284:	85 c0                	test   %eax,%eax
  101286:	75 09                	jne    101291 <serial_putc_sub+0x3f>
  101288:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  10128f:	7e d0                	jle    101261 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  101291:	8b 45 08             	mov    0x8(%ebp),%eax
  101294:	0f b6 c0             	movzbl %al,%eax
  101297:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10129d:	88 45 f5             	mov    %al,-0xb(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012a0:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1012a4:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1012a8:	ee                   	out    %al,(%dx)
}
  1012a9:	c9                   	leave  
  1012aa:	c3                   	ret    

001012ab <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012ab:	55                   	push   %ebp
  1012ac:	89 e5                	mov    %esp,%ebp
  1012ae:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012b1:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012b5:	74 0d                	je     1012c4 <serial_putc+0x19>
        serial_putc_sub(c);
  1012b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ba:	89 04 24             	mov    %eax,(%esp)
  1012bd:	e8 90 ff ff ff       	call   101252 <serial_putc_sub>
  1012c2:	eb 24                	jmp    1012e8 <serial_putc+0x3d>
    }
    else {
        serial_putc_sub('\b');
  1012c4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012cb:	e8 82 ff ff ff       	call   101252 <serial_putc_sub>
        serial_putc_sub(' ');
  1012d0:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1012d7:	e8 76 ff ff ff       	call   101252 <serial_putc_sub>
        serial_putc_sub('\b');
  1012dc:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1012e3:	e8 6a ff ff ff       	call   101252 <serial_putc_sub>
    }
}
  1012e8:	c9                   	leave  
  1012e9:	c3                   	ret    

001012ea <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1012ea:	55                   	push   %ebp
  1012eb:	89 e5                	mov    %esp,%ebp
  1012ed:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1012f0:	eb 33                	jmp    101325 <cons_intr+0x3b>
        if (c != 0) {
  1012f2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1012f6:	74 2d                	je     101325 <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  1012f8:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1012fd:	8d 50 01             	lea    0x1(%eax),%edx
  101300:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  101306:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101309:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  10130f:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101314:	3d 00 02 00 00       	cmp    $0x200,%eax
  101319:	75 0a                	jne    101325 <cons_intr+0x3b>
                cons.wpos = 0;
  10131b:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101322:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  101325:	8b 45 08             	mov    0x8(%ebp),%eax
  101328:	ff d0                	call   *%eax
  10132a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10132d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101331:	75 bf                	jne    1012f2 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  101333:	c9                   	leave  
  101334:	c3                   	ret    

00101335 <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  101335:	55                   	push   %ebp
  101336:	89 e5                	mov    %esp,%ebp
  101338:	83 ec 10             	sub    $0x10,%esp
  10133b:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101341:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101345:	89 c2                	mov    %eax,%edx
  101347:	ec                   	in     (%dx),%al
  101348:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  10134b:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  10134f:	0f b6 c0             	movzbl %al,%eax
  101352:	83 e0 01             	and    $0x1,%eax
  101355:	85 c0                	test   %eax,%eax
  101357:	75 07                	jne    101360 <serial_proc_data+0x2b>
        return -1;
  101359:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  10135e:	eb 2a                	jmp    10138a <serial_proc_data+0x55>
  101360:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101366:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10136a:	89 c2                	mov    %eax,%edx
  10136c:	ec                   	in     (%dx),%al
  10136d:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  101370:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  101374:	0f b6 c0             	movzbl %al,%eax
  101377:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  10137a:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  10137e:	75 07                	jne    101387 <serial_proc_data+0x52>
        c = '\b';
  101380:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101387:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  10138a:	c9                   	leave  
  10138b:	c3                   	ret    

0010138c <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  10138c:	55                   	push   %ebp
  10138d:	89 e5                	mov    %esp,%ebp
  10138f:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  101392:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101397:	85 c0                	test   %eax,%eax
  101399:	74 0c                	je     1013a7 <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  10139b:	c7 04 24 35 13 10 00 	movl   $0x101335,(%esp)
  1013a2:	e8 43 ff ff ff       	call   1012ea <cons_intr>
    }
}
  1013a7:	c9                   	leave  
  1013a8:	c3                   	ret    

001013a9 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013a9:	55                   	push   %ebp
  1013aa:	89 e5                	mov    %esp,%ebp
  1013ac:	83 ec 38             	sub    $0x38,%esp
  1013af:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013b5:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1013b9:	89 c2                	mov    %eax,%edx
  1013bb:	ec                   	in     (%dx),%al
  1013bc:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1013bf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013c3:	0f b6 c0             	movzbl %al,%eax
  1013c6:	83 e0 01             	and    $0x1,%eax
  1013c9:	85 c0                	test   %eax,%eax
  1013cb:	75 0a                	jne    1013d7 <kbd_proc_data+0x2e>
        return -1;
  1013cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1013d2:	e9 59 01 00 00       	jmp    101530 <kbd_proc_data+0x187>
  1013d7:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013dd:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  1013e1:	89 c2                	mov    %eax,%edx
  1013e3:	ec                   	in     (%dx),%al
  1013e4:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013e7:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1013eb:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1013ee:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1013f2:	75 17                	jne    10140b <kbd_proc_data+0x62>
        // E0 escape character
        shift |= E0ESC;
  1013f4:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1013f9:	83 c8 40             	or     $0x40,%eax
  1013fc:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101401:	b8 00 00 00 00       	mov    $0x0,%eax
  101406:	e9 25 01 00 00       	jmp    101530 <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  10140b:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10140f:	84 c0                	test   %al,%al
  101411:	79 47                	jns    10145a <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101413:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101418:	83 e0 40             	and    $0x40,%eax
  10141b:	85 c0                	test   %eax,%eax
  10141d:	75 09                	jne    101428 <kbd_proc_data+0x7f>
  10141f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101423:	83 e0 7f             	and    $0x7f,%eax
  101426:	eb 04                	jmp    10142c <kbd_proc_data+0x83>
  101428:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10142c:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10142f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101433:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10143a:	83 c8 40             	or     $0x40,%eax
  10143d:	0f b6 c0             	movzbl %al,%eax
  101440:	f7 d0                	not    %eax
  101442:	89 c2                	mov    %eax,%edx
  101444:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101449:	21 d0                	and    %edx,%eax
  10144b:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101450:	b8 00 00 00 00       	mov    $0x0,%eax
  101455:	e9 d6 00 00 00       	jmp    101530 <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  10145a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10145f:	83 e0 40             	and    $0x40,%eax
  101462:	85 c0                	test   %eax,%eax
  101464:	74 11                	je     101477 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101466:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10146a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10146f:	83 e0 bf             	and    $0xffffffbf,%eax
  101472:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  101477:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10147b:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  101482:	0f b6 d0             	movzbl %al,%edx
  101485:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10148a:	09 d0                	or     %edx,%eax
  10148c:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  101491:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101495:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  10149c:	0f b6 d0             	movzbl %al,%edx
  10149f:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a4:	31 d0                	xor    %edx,%eax
  1014a6:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014ab:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014b0:	83 e0 03             	and    $0x3,%eax
  1014b3:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014ba:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014be:	01 d0                	add    %edx,%eax
  1014c0:	0f b6 00             	movzbl (%eax),%eax
  1014c3:	0f b6 c0             	movzbl %al,%eax
  1014c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014c9:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014ce:	83 e0 08             	and    $0x8,%eax
  1014d1:	85 c0                	test   %eax,%eax
  1014d3:	74 22                	je     1014f7 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1014d5:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1014d9:	7e 0c                	jle    1014e7 <kbd_proc_data+0x13e>
  1014db:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1014df:	7f 06                	jg     1014e7 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1014e1:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1014e5:	eb 10                	jmp    1014f7 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1014e7:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1014eb:	7e 0a                	jle    1014f7 <kbd_proc_data+0x14e>
  1014ed:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1014f1:	7f 04                	jg     1014f7 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1014f3:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1014f7:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014fc:	f7 d0                	not    %eax
  1014fe:	83 e0 06             	and    $0x6,%eax
  101501:	85 c0                	test   %eax,%eax
  101503:	75 28                	jne    10152d <kbd_proc_data+0x184>
  101505:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  10150c:	75 1f                	jne    10152d <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  10150e:	c7 04 24 7d 37 10 00 	movl   $0x10377d,(%esp)
  101515:	e8 f8 ed ff ff       	call   100312 <cprintf>
  10151a:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  101520:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101524:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101528:	0f b7 55 e8          	movzwl -0x18(%ebp),%edx
  10152c:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10152d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101530:	c9                   	leave  
  101531:	c3                   	ret    

00101532 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101532:	55                   	push   %ebp
  101533:	89 e5                	mov    %esp,%ebp
  101535:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  101538:	c7 04 24 a9 13 10 00 	movl   $0x1013a9,(%esp)
  10153f:	e8 a6 fd ff ff       	call   1012ea <cons_intr>
}
  101544:	c9                   	leave  
  101545:	c3                   	ret    

00101546 <kbd_init>:

static void
kbd_init(void) {
  101546:	55                   	push   %ebp
  101547:	89 e5                	mov    %esp,%ebp
  101549:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  10154c:	e8 e1 ff ff ff       	call   101532 <kbd_intr>
    pic_enable(IRQ_KBD);
  101551:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101558:	e8 17 01 00 00       	call   101674 <pic_enable>
}
  10155d:	c9                   	leave  
  10155e:	c3                   	ret    

0010155f <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  10155f:	55                   	push   %ebp
  101560:	89 e5                	mov    %esp,%ebp
  101562:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101565:	e8 93 f8 ff ff       	call   100dfd <cga_init>
    serial_init();
  10156a:	e8 74 f9 ff ff       	call   100ee3 <serial_init>
    kbd_init();
  10156f:	e8 d2 ff ff ff       	call   101546 <kbd_init>
    if (!serial_exists) {
  101574:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  101579:	85 c0                	test   %eax,%eax
  10157b:	75 0c                	jne    101589 <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  10157d:	c7 04 24 89 37 10 00 	movl   $0x103789,(%esp)
  101584:	e8 89 ed ff ff       	call   100312 <cprintf>
    }
}
  101589:	c9                   	leave  
  10158a:	c3                   	ret    

0010158b <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  10158b:	55                   	push   %ebp
  10158c:	89 e5                	mov    %esp,%ebp
  10158e:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101591:	8b 45 08             	mov    0x8(%ebp),%eax
  101594:	89 04 24             	mov    %eax,(%esp)
  101597:	e8 a3 fa ff ff       	call   10103f <lpt_putc>
    cga_putc(c);
  10159c:	8b 45 08             	mov    0x8(%ebp),%eax
  10159f:	89 04 24             	mov    %eax,(%esp)
  1015a2:	e8 d7 fa ff ff       	call   10107e <cga_putc>
    serial_putc(c);
  1015a7:	8b 45 08             	mov    0x8(%ebp),%eax
  1015aa:	89 04 24             	mov    %eax,(%esp)
  1015ad:	e8 f9 fc ff ff       	call   1012ab <serial_putc>
}
  1015b2:	c9                   	leave  
  1015b3:	c3                   	ret    

001015b4 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015b4:	55                   	push   %ebp
  1015b5:	89 e5                	mov    %esp,%ebp
  1015b7:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015ba:	e8 cd fd ff ff       	call   10138c <serial_intr>
    kbd_intr();
  1015bf:	e8 6e ff ff ff       	call   101532 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015c4:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  1015ca:	a1 84 f0 10 00       	mov    0x10f084,%eax
  1015cf:	39 c2                	cmp    %eax,%edx
  1015d1:	74 36                	je     101609 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  1015d3:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015d8:	8d 50 01             	lea    0x1(%eax),%edx
  1015db:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  1015e1:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  1015e8:	0f b6 c0             	movzbl %al,%eax
  1015eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1015ee:	a1 80 f0 10 00       	mov    0x10f080,%eax
  1015f3:	3d 00 02 00 00       	cmp    $0x200,%eax
  1015f8:	75 0a                	jne    101604 <cons_getc+0x50>
            cons.rpos = 0;
  1015fa:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101601:	00 00 00 
        }
        return c;
  101604:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101607:	eb 05                	jmp    10160e <cons_getc+0x5a>
    }
    return 0;
  101609:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10160e:	c9                   	leave  
  10160f:	c3                   	ret    

00101610 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101610:	55                   	push   %ebp
  101611:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101613:	fb                   	sti    
    sti();
}
  101614:	5d                   	pop    %ebp
  101615:	c3                   	ret    

00101616 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  101616:	55                   	push   %ebp
  101617:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101619:	fa                   	cli    
    cli();
}
  10161a:	5d                   	pop    %ebp
  10161b:	c3                   	ret    

0010161c <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  10161c:	55                   	push   %ebp
  10161d:	89 e5                	mov    %esp,%ebp
  10161f:	83 ec 14             	sub    $0x14,%esp
  101622:	8b 45 08             	mov    0x8(%ebp),%eax
  101625:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101629:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  10162d:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  101633:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101638:	85 c0                	test   %eax,%eax
  10163a:	74 36                	je     101672 <pic_setmask+0x56>
        outb(IO_PIC1 + 1, mask);
  10163c:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101640:	0f b6 c0             	movzbl %al,%eax
  101643:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101649:	88 45 fd             	mov    %al,-0x3(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10164c:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  101650:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101654:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  101655:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101659:	66 c1 e8 08          	shr    $0x8,%ax
  10165d:	0f b6 c0             	movzbl %al,%eax
  101660:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  101666:	88 45 f9             	mov    %al,-0x7(%ebp)
  101669:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10166d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101671:	ee                   	out    %al,(%dx)
    }
}
  101672:	c9                   	leave  
  101673:	c3                   	ret    

00101674 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101674:	55                   	push   %ebp
  101675:	89 e5                	mov    %esp,%ebp
  101677:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  10167a:	8b 45 08             	mov    0x8(%ebp),%eax
  10167d:	ba 01 00 00 00       	mov    $0x1,%edx
  101682:	89 c1                	mov    %eax,%ecx
  101684:	d3 e2                	shl    %cl,%edx
  101686:	89 d0                	mov    %edx,%eax
  101688:	f7 d0                	not    %eax
  10168a:	89 c2                	mov    %eax,%edx
  10168c:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  101693:	21 d0                	and    %edx,%eax
  101695:	0f b7 c0             	movzwl %ax,%eax
  101698:	89 04 24             	mov    %eax,(%esp)
  10169b:	e8 7c ff ff ff       	call   10161c <pic_setmask>
}
  1016a0:	c9                   	leave  
  1016a1:	c3                   	ret    

001016a2 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016a2:	55                   	push   %ebp
  1016a3:	89 e5                	mov    %esp,%ebp
  1016a5:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1016a8:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016af:	00 00 00 
  1016b2:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016b8:	c6 45 fd ff          	movb   $0xff,-0x3(%ebp)
  1016bc:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1016c0:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016c4:	ee                   	out    %al,(%dx)
  1016c5:	66 c7 45 fa a1 00    	movw   $0xa1,-0x6(%ebp)
  1016cb:	c6 45 f9 ff          	movb   $0xff,-0x7(%ebp)
  1016cf:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1016d3:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1016d7:	ee                   	out    %al,(%dx)
  1016d8:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  1016de:	c6 45 f5 11          	movb   $0x11,-0xb(%ebp)
  1016e2:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1016e6:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1016ea:	ee                   	out    %al,(%dx)
  1016eb:	66 c7 45 f2 21 00    	movw   $0x21,-0xe(%ebp)
  1016f1:	c6 45 f1 20          	movb   $0x20,-0xf(%ebp)
  1016f5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1016f9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1016fd:	ee                   	out    %al,(%dx)
  1016fe:	66 c7 45 ee 21 00    	movw   $0x21,-0x12(%ebp)
  101704:	c6 45 ed 04          	movb   $0x4,-0x13(%ebp)
  101708:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  10170c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101710:	ee                   	out    %al,(%dx)
  101711:	66 c7 45 ea 21 00    	movw   $0x21,-0x16(%ebp)
  101717:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
  10171b:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10171f:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101723:	ee                   	out    %al,(%dx)
  101724:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  10172a:	c6 45 e5 11          	movb   $0x11,-0x1b(%ebp)
  10172e:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  101732:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  101736:	ee                   	out    %al,(%dx)
  101737:	66 c7 45 e2 a1 00    	movw   $0xa1,-0x1e(%ebp)
  10173d:	c6 45 e1 28          	movb   $0x28,-0x1f(%ebp)
  101741:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101745:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  101749:	ee                   	out    %al,(%dx)
  10174a:	66 c7 45 de a1 00    	movw   $0xa1,-0x22(%ebp)
  101750:	c6 45 dd 02          	movb   $0x2,-0x23(%ebp)
  101754:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101758:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  10175c:	ee                   	out    %al,(%dx)
  10175d:	66 c7 45 da a1 00    	movw   $0xa1,-0x26(%ebp)
  101763:	c6 45 d9 03          	movb   $0x3,-0x27(%ebp)
  101767:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10176b:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  10176f:	ee                   	out    %al,(%dx)
  101770:	66 c7 45 d6 20 00    	movw   $0x20,-0x2a(%ebp)
  101776:	c6 45 d5 68          	movb   $0x68,-0x2b(%ebp)
  10177a:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  10177e:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  101782:	ee                   	out    %al,(%dx)
  101783:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  101789:	c6 45 d1 0a          	movb   $0xa,-0x2f(%ebp)
  10178d:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  101791:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  101795:	ee                   	out    %al,(%dx)
  101796:	66 c7 45 ce a0 00    	movw   $0xa0,-0x32(%ebp)
  10179c:	c6 45 cd 68          	movb   $0x68,-0x33(%ebp)
  1017a0:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017a4:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017a8:	ee                   	out    %al,(%dx)
  1017a9:	66 c7 45 ca a0 00    	movw   $0xa0,-0x36(%ebp)
  1017af:	c6 45 c9 0a          	movb   $0xa,-0x37(%ebp)
  1017b3:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017b7:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017bb:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017bc:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017c3:	66 83 f8 ff          	cmp    $0xffff,%ax
  1017c7:	74 12                	je     1017db <pic_init+0x139>
        pic_setmask(irq_mask);
  1017c9:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017d0:	0f b7 c0             	movzwl %ax,%eax
  1017d3:	89 04 24             	mov    %eax,(%esp)
  1017d6:	e8 41 fe ff ff       	call   10161c <pic_setmask>
    }
}
  1017db:	c9                   	leave  
  1017dc:	c3                   	ret    

001017dd <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  1017dd:	55                   	push   %ebp
  1017de:	89 e5                	mov    %esp,%ebp
  1017e0:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  1017e3:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  1017ea:	00 
  1017eb:	c7 04 24 c0 37 10 00 	movl   $0x1037c0,(%esp)
  1017f2:	e8 1b eb ff ff       	call   100312 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  1017f7:	c9                   	leave  
  1017f8:	c3                   	ret    

001017f9 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  1017f9:	55                   	push   %ebp
  1017fa:	89 e5                	mov    %esp,%ebp
  1017fc:	83 ec 10             	sub    $0x10,%esp
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i;
	for(i = 0; i < sizeof(idt)/sizeof(struct gatedesc); i++)
  1017ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101806:	e9 c3 00 00 00       	jmp    1018ce <idt_init+0xd5>
	{
		SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], 0);
  10180b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10180e:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  101815:	89 c2                	mov    %eax,%edx
  101817:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10181a:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  101821:	00 
  101822:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101825:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  10182c:	00 08 00 
  10182f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101832:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101839:	00 
  10183a:	83 e2 e0             	and    $0xffffffe0,%edx
  10183d:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101844:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101847:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  10184e:	00 
  10184f:	83 e2 1f             	and    $0x1f,%edx
  101852:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101859:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10185c:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101863:	00 
  101864:	83 e2 f0             	and    $0xfffffff0,%edx
  101867:	83 ca 0e             	or     $0xe,%edx
  10186a:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101871:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101874:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10187b:	00 
  10187c:	83 e2 ef             	and    $0xffffffef,%edx
  10187f:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  101886:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101889:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  101890:	00 
  101891:	83 e2 9f             	and    $0xffffff9f,%edx
  101894:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  10189b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10189e:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018a5:	00 
  1018a6:	83 ca 80             	or     $0xffffff80,%edx
  1018a9:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018b3:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018ba:	c1 e8 10             	shr    $0x10,%eax
  1018bd:	89 c2                	mov    %eax,%edx
  1018bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c2:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  1018c9:	00 
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
	extern uintptr_t __vectors[];
	int i;
	for(i = 0; i < sizeof(idt)/sizeof(struct gatedesc); i++)
  1018ca:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1018ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d1:	3d ff 00 00 00       	cmp    $0xff,%eax
  1018d6:	0f 86 2f ff ff ff    	jbe    10180b <idt_init+0x12>
	{
		SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], 0);
	}
	SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], 3);
  1018dc:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  1018e1:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  1018e7:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  1018ee:	08 00 
  1018f0:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  1018f7:	83 e0 e0             	and    $0xffffffe0,%eax
  1018fa:	a2 6c f4 10 00       	mov    %al,0x10f46c
  1018ff:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101906:	83 e0 1f             	and    $0x1f,%eax
  101909:	a2 6c f4 10 00       	mov    %al,0x10f46c
  10190e:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101915:	83 e0 f0             	and    $0xfffffff0,%eax
  101918:	83 c8 0e             	or     $0xe,%eax
  10191b:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101920:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101927:	83 e0 ef             	and    $0xffffffef,%eax
  10192a:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10192f:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101936:	83 c8 60             	or     $0x60,%eax
  101939:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10193e:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  101945:	83 c8 80             	or     $0xffffff80,%eax
  101948:	a2 6d f4 10 00       	mov    %al,0x10f46d
  10194d:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101952:	c1 e8 10             	shr    $0x10,%eax
  101955:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  10195b:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  101962:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101965:	0f 01 18             	lidtl  (%eax)
	lidt(&idt_pd);
}
  101968:	c9                   	leave  
  101969:	c3                   	ret    

0010196a <trapname>:

static const char *
trapname(int trapno) {
  10196a:	55                   	push   %ebp
  10196b:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  10196d:	8b 45 08             	mov    0x8(%ebp),%eax
  101970:	83 f8 13             	cmp    $0x13,%eax
  101973:	77 0c                	ja     101981 <trapname+0x17>
        return excnames[trapno];
  101975:	8b 45 08             	mov    0x8(%ebp),%eax
  101978:	8b 04 85 20 3b 10 00 	mov    0x103b20(,%eax,4),%eax
  10197f:	eb 18                	jmp    101999 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101981:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101985:	7e 0d                	jle    101994 <trapname+0x2a>
  101987:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  10198b:	7f 07                	jg     101994 <trapname+0x2a>
        return "Hardware Interrupt";
  10198d:	b8 ca 37 10 00       	mov    $0x1037ca,%eax
  101992:	eb 05                	jmp    101999 <trapname+0x2f>
    }
    return "(unknown trap)";
  101994:	b8 dd 37 10 00       	mov    $0x1037dd,%eax
}
  101999:	5d                   	pop    %ebp
  10199a:	c3                   	ret    

0010199b <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  10199b:	55                   	push   %ebp
  10199c:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  10199e:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019a5:	66 83 f8 08          	cmp    $0x8,%ax
  1019a9:	0f 94 c0             	sete   %al
  1019ac:	0f b6 c0             	movzbl %al,%eax
}
  1019af:	5d                   	pop    %ebp
  1019b0:	c3                   	ret    

001019b1 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019b1:	55                   	push   %ebp
  1019b2:	89 e5                	mov    %esp,%ebp
  1019b4:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1019ba:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019be:	c7 04 24 1e 38 10 00 	movl   $0x10381e,(%esp)
  1019c5:	e8 48 e9 ff ff       	call   100312 <cprintf>
    print_regs(&tf->tf_regs);
  1019ca:	8b 45 08             	mov    0x8(%ebp),%eax
  1019cd:	89 04 24             	mov    %eax,(%esp)
  1019d0:	e8 a1 01 00 00       	call   101b76 <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  1019d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d8:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  1019dc:	0f b7 c0             	movzwl %ax,%eax
  1019df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019e3:	c7 04 24 2f 38 10 00 	movl   $0x10382f,(%esp)
  1019ea:	e8 23 e9 ff ff       	call   100312 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  1019ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f2:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  1019f6:	0f b7 c0             	movzwl %ax,%eax
  1019f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019fd:	c7 04 24 42 38 10 00 	movl   $0x103842,(%esp)
  101a04:	e8 09 e9 ff ff       	call   100312 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a09:	8b 45 08             	mov    0x8(%ebp),%eax
  101a0c:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a10:	0f b7 c0             	movzwl %ax,%eax
  101a13:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a17:	c7 04 24 55 38 10 00 	movl   $0x103855,(%esp)
  101a1e:	e8 ef e8 ff ff       	call   100312 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a23:	8b 45 08             	mov    0x8(%ebp),%eax
  101a26:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a2a:	0f b7 c0             	movzwl %ax,%eax
  101a2d:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a31:	c7 04 24 68 38 10 00 	movl   $0x103868,(%esp)
  101a38:	e8 d5 e8 ff ff       	call   100312 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a3d:	8b 45 08             	mov    0x8(%ebp),%eax
  101a40:	8b 40 30             	mov    0x30(%eax),%eax
  101a43:	89 04 24             	mov    %eax,(%esp)
  101a46:	e8 1f ff ff ff       	call   10196a <trapname>
  101a4b:	8b 55 08             	mov    0x8(%ebp),%edx
  101a4e:	8b 52 30             	mov    0x30(%edx),%edx
  101a51:	89 44 24 08          	mov    %eax,0x8(%esp)
  101a55:	89 54 24 04          	mov    %edx,0x4(%esp)
  101a59:	c7 04 24 7b 38 10 00 	movl   $0x10387b,(%esp)
  101a60:	e8 ad e8 ff ff       	call   100312 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a65:	8b 45 08             	mov    0x8(%ebp),%eax
  101a68:	8b 40 34             	mov    0x34(%eax),%eax
  101a6b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a6f:	c7 04 24 8d 38 10 00 	movl   $0x10388d,(%esp)
  101a76:	e8 97 e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101a7b:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7e:	8b 40 38             	mov    0x38(%eax),%eax
  101a81:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a85:	c7 04 24 9c 38 10 00 	movl   $0x10389c,(%esp)
  101a8c:	e8 81 e8 ff ff       	call   100312 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101a91:	8b 45 08             	mov    0x8(%ebp),%eax
  101a94:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101a98:	0f b7 c0             	movzwl %ax,%eax
  101a9b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a9f:	c7 04 24 ab 38 10 00 	movl   $0x1038ab,(%esp)
  101aa6:	e8 67 e8 ff ff       	call   100312 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101aab:	8b 45 08             	mov    0x8(%ebp),%eax
  101aae:	8b 40 40             	mov    0x40(%eax),%eax
  101ab1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ab5:	c7 04 24 be 38 10 00 	movl   $0x1038be,(%esp)
  101abc:	e8 51 e8 ff ff       	call   100312 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101ac1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101ac8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101acf:	eb 3e                	jmp    101b0f <print_trapframe+0x15e>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101ad1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad4:	8b 50 40             	mov    0x40(%eax),%edx
  101ad7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101ada:	21 d0                	and    %edx,%eax
  101adc:	85 c0                	test   %eax,%eax
  101ade:	74 28                	je     101b08 <print_trapframe+0x157>
  101ae0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101ae3:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101aea:	85 c0                	test   %eax,%eax
  101aec:	74 1a                	je     101b08 <print_trapframe+0x157>
            cprintf("%s,", IA32flags[i]);
  101aee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101af1:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101af8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101afc:	c7 04 24 cd 38 10 00 	movl   $0x1038cd,(%esp)
  101b03:	e8 0a e8 ff ff       	call   100312 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b08:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  101b0c:	d1 65 f0             	shll   -0x10(%ebp)
  101b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b12:	83 f8 17             	cmp    $0x17,%eax
  101b15:	76 ba                	jbe    101ad1 <print_trapframe+0x120>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b17:	8b 45 08             	mov    0x8(%ebp),%eax
  101b1a:	8b 40 40             	mov    0x40(%eax),%eax
  101b1d:	25 00 30 00 00       	and    $0x3000,%eax
  101b22:	c1 e8 0c             	shr    $0xc,%eax
  101b25:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b29:	c7 04 24 d1 38 10 00 	movl   $0x1038d1,(%esp)
  101b30:	e8 dd e7 ff ff       	call   100312 <cprintf>

    if (!trap_in_kernel(tf)) {
  101b35:	8b 45 08             	mov    0x8(%ebp),%eax
  101b38:	89 04 24             	mov    %eax,(%esp)
  101b3b:	e8 5b fe ff ff       	call   10199b <trap_in_kernel>
  101b40:	85 c0                	test   %eax,%eax
  101b42:	75 30                	jne    101b74 <print_trapframe+0x1c3>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b44:	8b 45 08             	mov    0x8(%ebp),%eax
  101b47:	8b 40 44             	mov    0x44(%eax),%eax
  101b4a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b4e:	c7 04 24 da 38 10 00 	movl   $0x1038da,(%esp)
  101b55:	e8 b8 e7 ff ff       	call   100312 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101b5d:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b61:	0f b7 c0             	movzwl %ax,%eax
  101b64:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b68:	c7 04 24 e9 38 10 00 	movl   $0x1038e9,(%esp)
  101b6f:	e8 9e e7 ff ff       	call   100312 <cprintf>
    }
}
  101b74:	c9                   	leave  
  101b75:	c3                   	ret    

00101b76 <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b76:	55                   	push   %ebp
  101b77:	89 e5                	mov    %esp,%ebp
  101b79:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101b7c:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7f:	8b 00                	mov    (%eax),%eax
  101b81:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b85:	c7 04 24 fc 38 10 00 	movl   $0x1038fc,(%esp)
  101b8c:	e8 81 e7 ff ff       	call   100312 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101b91:	8b 45 08             	mov    0x8(%ebp),%eax
  101b94:	8b 40 04             	mov    0x4(%eax),%eax
  101b97:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9b:	c7 04 24 0b 39 10 00 	movl   $0x10390b,(%esp)
  101ba2:	e8 6b e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101ba7:	8b 45 08             	mov    0x8(%ebp),%eax
  101baa:	8b 40 08             	mov    0x8(%eax),%eax
  101bad:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bb1:	c7 04 24 1a 39 10 00 	movl   $0x10391a,(%esp)
  101bb8:	e8 55 e7 ff ff       	call   100312 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101bbd:	8b 45 08             	mov    0x8(%ebp),%eax
  101bc0:	8b 40 0c             	mov    0xc(%eax),%eax
  101bc3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc7:	c7 04 24 29 39 10 00 	movl   $0x103929,(%esp)
  101bce:	e8 3f e7 ff ff       	call   100312 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bd3:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd6:	8b 40 10             	mov    0x10(%eax),%eax
  101bd9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bdd:	c7 04 24 38 39 10 00 	movl   $0x103938,(%esp)
  101be4:	e8 29 e7 ff ff       	call   100312 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101be9:	8b 45 08             	mov    0x8(%ebp),%eax
  101bec:	8b 40 14             	mov    0x14(%eax),%eax
  101bef:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bf3:	c7 04 24 47 39 10 00 	movl   $0x103947,(%esp)
  101bfa:	e8 13 e7 ff ff       	call   100312 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101bff:	8b 45 08             	mov    0x8(%ebp),%eax
  101c02:	8b 40 18             	mov    0x18(%eax),%eax
  101c05:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c09:	c7 04 24 56 39 10 00 	movl   $0x103956,(%esp)
  101c10:	e8 fd e6 ff ff       	call   100312 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c15:	8b 45 08             	mov    0x8(%ebp),%eax
  101c18:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c1b:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c1f:	c7 04 24 65 39 10 00 	movl   $0x103965,(%esp)
  101c26:	e8 e7 e6 ff ff       	call   100312 <cprintf>
}
  101c2b:	c9                   	leave  
  101c2c:	c3                   	ret    

00101c2d <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c2d:	55                   	push   %ebp
  101c2e:	89 e5                	mov    %esp,%ebp
  101c30:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101c33:	8b 45 08             	mov    0x8(%ebp),%eax
  101c36:	8b 40 30             	mov    0x30(%eax),%eax
  101c39:	83 f8 2f             	cmp    $0x2f,%eax
  101c3c:	77 1d                	ja     101c5b <trap_dispatch+0x2e>
  101c3e:	83 f8 2e             	cmp    $0x2e,%eax
  101c41:	0f 83 f2 00 00 00    	jae    101d39 <trap_dispatch+0x10c>
  101c47:	83 f8 21             	cmp    $0x21,%eax
  101c4a:	74 73                	je     101cbf <trap_dispatch+0x92>
  101c4c:	83 f8 24             	cmp    $0x24,%eax
  101c4f:	74 48                	je     101c99 <trap_dispatch+0x6c>
  101c51:	83 f8 20             	cmp    $0x20,%eax
  101c54:	74 13                	je     101c69 <trap_dispatch+0x3c>
  101c56:	e9 a6 00 00 00       	jmp    101d01 <trap_dispatch+0xd4>
  101c5b:	83 e8 78             	sub    $0x78,%eax
  101c5e:	83 f8 01             	cmp    $0x1,%eax
  101c61:	0f 87 9a 00 00 00    	ja     101d01 <trap_dispatch+0xd4>
  101c67:	eb 7c                	jmp    101ce5 <trap_dispatch+0xb8>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
    	if(ticks < TICK_NUM)
  101c69:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101c6e:	83 f8 63             	cmp    $0x63,%eax
  101c71:	77 12                	ja     101c85 <trap_dispatch+0x58>
    	{
    		ticks++;
  101c73:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101c78:	83 c0 01             	add    $0x1,%eax
  101c7b:	a3 08 f9 10 00       	mov    %eax,0x10f908
    	else
    	{
    		print_ticks();
    		ticks = 0;
    	}
        break;
  101c80:	e9 b5 00 00 00       	jmp    101d3a <trap_dispatch+0x10d>
    	{
    		ticks++;
    	}
    	else
    	{
    		print_ticks();
  101c85:	e8 53 fb ff ff       	call   1017dd <print_ticks>
    		ticks = 0;
  101c8a:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  101c91:	00 00 00 
    	}
        break;
  101c94:	e9 a1 00 00 00       	jmp    101d3a <trap_dispatch+0x10d>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101c99:	e8 16 f9 ff ff       	call   1015b4 <cons_getc>
  101c9e:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101ca1:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ca5:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ca9:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cad:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cb1:	c7 04 24 74 39 10 00 	movl   $0x103974,(%esp)
  101cb8:	e8 55 e6 ff ff       	call   100312 <cprintf>
        break;
  101cbd:	eb 7b                	jmp    101d3a <trap_dispatch+0x10d>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101cbf:	e8 f0 f8 ff ff       	call   1015b4 <cons_getc>
  101cc4:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101cc7:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ccb:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101ccf:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cd3:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cd7:	c7 04 24 86 39 10 00 	movl   $0x103986,(%esp)
  101cde:	e8 2f e6 ff ff       	call   100312 <cprintf>
        break;
  101ce3:	eb 55                	jmp    101d3a <trap_dispatch+0x10d>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
    case T_SWITCH_TOK:
        panic("T_SWITCH_** ??\n");
  101ce5:	c7 44 24 08 95 39 10 	movl   $0x103995,0x8(%esp)
  101cec:	00 
  101ced:	c7 44 24 04 b3 00 00 	movl   $0xb3,0x4(%esp)
  101cf4:	00 
  101cf5:	c7 04 24 a5 39 10 00 	movl   $0x1039a5,(%esp)
  101cfc:	e8 95 ef ff ff       	call   100c96 <__panic>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101d01:	8b 45 08             	mov    0x8(%ebp),%eax
  101d04:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d08:	0f b7 c0             	movzwl %ax,%eax
  101d0b:	83 e0 03             	and    $0x3,%eax
  101d0e:	85 c0                	test   %eax,%eax
  101d10:	75 28                	jne    101d3a <trap_dispatch+0x10d>
            print_trapframe(tf);
  101d12:	8b 45 08             	mov    0x8(%ebp),%eax
  101d15:	89 04 24             	mov    %eax,(%esp)
  101d18:	e8 94 fc ff ff       	call   1019b1 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101d1d:	c7 44 24 08 b6 39 10 	movl   $0x1039b6,0x8(%esp)
  101d24:	00 
  101d25:	c7 44 24 04 bd 00 00 	movl   $0xbd,0x4(%esp)
  101d2c:	00 
  101d2d:	c7 04 24 a5 39 10 00 	movl   $0x1039a5,(%esp)
  101d34:	e8 5d ef ff ff       	call   100c96 <__panic>
        panic("T_SWITCH_** ??\n");
        break;
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101d39:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101d3a:	c9                   	leave  
  101d3b:	c3                   	ret    

00101d3c <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101d3c:	55                   	push   %ebp
  101d3d:	89 e5                	mov    %esp,%ebp
  101d3f:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101d42:	8b 45 08             	mov    0x8(%ebp),%eax
  101d45:	89 04 24             	mov    %eax,(%esp)
  101d48:	e8 e0 fe ff ff       	call   101c2d <trap_dispatch>
}
  101d4d:	c9                   	leave  
  101d4e:	c3                   	ret    

00101d4f <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  101d4f:	1e                   	push   %ds
    pushl %es
  101d50:	06                   	push   %es
    pushl %fs
  101d51:	0f a0                	push   %fs
    pushl %gs
  101d53:	0f a8                	push   %gs
    pushal
  101d55:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  101d56:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  101d5b:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  101d5d:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  101d5f:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  101d60:	e8 d7 ff ff ff       	call   101d3c <trap>

    # pop the pushed stack pointer
    popl %esp
  101d65:	5c                   	pop    %esp

00101d66 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  101d66:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  101d67:	0f a9                	pop    %gs
    popl %fs
  101d69:	0f a1                	pop    %fs
    popl %es
  101d6b:	07                   	pop    %es
    popl %ds
  101d6c:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  101d6d:	83 c4 08             	add    $0x8,%esp
    iret
  101d70:	cf                   	iret   

00101d71 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101d71:	6a 00                	push   $0x0
  pushl $0
  101d73:	6a 00                	push   $0x0
  jmp __alltraps
  101d75:	e9 d5 ff ff ff       	jmp    101d4f <__alltraps>

00101d7a <vector1>:
.globl vector1
vector1:
  pushl $0
  101d7a:	6a 00                	push   $0x0
  pushl $1
  101d7c:	6a 01                	push   $0x1
  jmp __alltraps
  101d7e:	e9 cc ff ff ff       	jmp    101d4f <__alltraps>

00101d83 <vector2>:
.globl vector2
vector2:
  pushl $0
  101d83:	6a 00                	push   $0x0
  pushl $2
  101d85:	6a 02                	push   $0x2
  jmp __alltraps
  101d87:	e9 c3 ff ff ff       	jmp    101d4f <__alltraps>

00101d8c <vector3>:
.globl vector3
vector3:
  pushl $0
  101d8c:	6a 00                	push   $0x0
  pushl $3
  101d8e:	6a 03                	push   $0x3
  jmp __alltraps
  101d90:	e9 ba ff ff ff       	jmp    101d4f <__alltraps>

00101d95 <vector4>:
.globl vector4
vector4:
  pushl $0
  101d95:	6a 00                	push   $0x0
  pushl $4
  101d97:	6a 04                	push   $0x4
  jmp __alltraps
  101d99:	e9 b1 ff ff ff       	jmp    101d4f <__alltraps>

00101d9e <vector5>:
.globl vector5
vector5:
  pushl $0
  101d9e:	6a 00                	push   $0x0
  pushl $5
  101da0:	6a 05                	push   $0x5
  jmp __alltraps
  101da2:	e9 a8 ff ff ff       	jmp    101d4f <__alltraps>

00101da7 <vector6>:
.globl vector6
vector6:
  pushl $0
  101da7:	6a 00                	push   $0x0
  pushl $6
  101da9:	6a 06                	push   $0x6
  jmp __alltraps
  101dab:	e9 9f ff ff ff       	jmp    101d4f <__alltraps>

00101db0 <vector7>:
.globl vector7
vector7:
  pushl $0
  101db0:	6a 00                	push   $0x0
  pushl $7
  101db2:	6a 07                	push   $0x7
  jmp __alltraps
  101db4:	e9 96 ff ff ff       	jmp    101d4f <__alltraps>

00101db9 <vector8>:
.globl vector8
vector8:
  pushl $8
  101db9:	6a 08                	push   $0x8
  jmp __alltraps
  101dbb:	e9 8f ff ff ff       	jmp    101d4f <__alltraps>

00101dc0 <vector9>:
.globl vector9
vector9:
  pushl $9
  101dc0:	6a 09                	push   $0x9
  jmp __alltraps
  101dc2:	e9 88 ff ff ff       	jmp    101d4f <__alltraps>

00101dc7 <vector10>:
.globl vector10
vector10:
  pushl $10
  101dc7:	6a 0a                	push   $0xa
  jmp __alltraps
  101dc9:	e9 81 ff ff ff       	jmp    101d4f <__alltraps>

00101dce <vector11>:
.globl vector11
vector11:
  pushl $11
  101dce:	6a 0b                	push   $0xb
  jmp __alltraps
  101dd0:	e9 7a ff ff ff       	jmp    101d4f <__alltraps>

00101dd5 <vector12>:
.globl vector12
vector12:
  pushl $12
  101dd5:	6a 0c                	push   $0xc
  jmp __alltraps
  101dd7:	e9 73 ff ff ff       	jmp    101d4f <__alltraps>

00101ddc <vector13>:
.globl vector13
vector13:
  pushl $13
  101ddc:	6a 0d                	push   $0xd
  jmp __alltraps
  101dde:	e9 6c ff ff ff       	jmp    101d4f <__alltraps>

00101de3 <vector14>:
.globl vector14
vector14:
  pushl $14
  101de3:	6a 0e                	push   $0xe
  jmp __alltraps
  101de5:	e9 65 ff ff ff       	jmp    101d4f <__alltraps>

00101dea <vector15>:
.globl vector15
vector15:
  pushl $0
  101dea:	6a 00                	push   $0x0
  pushl $15
  101dec:	6a 0f                	push   $0xf
  jmp __alltraps
  101dee:	e9 5c ff ff ff       	jmp    101d4f <__alltraps>

00101df3 <vector16>:
.globl vector16
vector16:
  pushl $0
  101df3:	6a 00                	push   $0x0
  pushl $16
  101df5:	6a 10                	push   $0x10
  jmp __alltraps
  101df7:	e9 53 ff ff ff       	jmp    101d4f <__alltraps>

00101dfc <vector17>:
.globl vector17
vector17:
  pushl $17
  101dfc:	6a 11                	push   $0x11
  jmp __alltraps
  101dfe:	e9 4c ff ff ff       	jmp    101d4f <__alltraps>

00101e03 <vector18>:
.globl vector18
vector18:
  pushl $0
  101e03:	6a 00                	push   $0x0
  pushl $18
  101e05:	6a 12                	push   $0x12
  jmp __alltraps
  101e07:	e9 43 ff ff ff       	jmp    101d4f <__alltraps>

00101e0c <vector19>:
.globl vector19
vector19:
  pushl $0
  101e0c:	6a 00                	push   $0x0
  pushl $19
  101e0e:	6a 13                	push   $0x13
  jmp __alltraps
  101e10:	e9 3a ff ff ff       	jmp    101d4f <__alltraps>

00101e15 <vector20>:
.globl vector20
vector20:
  pushl $0
  101e15:	6a 00                	push   $0x0
  pushl $20
  101e17:	6a 14                	push   $0x14
  jmp __alltraps
  101e19:	e9 31 ff ff ff       	jmp    101d4f <__alltraps>

00101e1e <vector21>:
.globl vector21
vector21:
  pushl $0
  101e1e:	6a 00                	push   $0x0
  pushl $21
  101e20:	6a 15                	push   $0x15
  jmp __alltraps
  101e22:	e9 28 ff ff ff       	jmp    101d4f <__alltraps>

00101e27 <vector22>:
.globl vector22
vector22:
  pushl $0
  101e27:	6a 00                	push   $0x0
  pushl $22
  101e29:	6a 16                	push   $0x16
  jmp __alltraps
  101e2b:	e9 1f ff ff ff       	jmp    101d4f <__alltraps>

00101e30 <vector23>:
.globl vector23
vector23:
  pushl $0
  101e30:	6a 00                	push   $0x0
  pushl $23
  101e32:	6a 17                	push   $0x17
  jmp __alltraps
  101e34:	e9 16 ff ff ff       	jmp    101d4f <__alltraps>

00101e39 <vector24>:
.globl vector24
vector24:
  pushl $0
  101e39:	6a 00                	push   $0x0
  pushl $24
  101e3b:	6a 18                	push   $0x18
  jmp __alltraps
  101e3d:	e9 0d ff ff ff       	jmp    101d4f <__alltraps>

00101e42 <vector25>:
.globl vector25
vector25:
  pushl $0
  101e42:	6a 00                	push   $0x0
  pushl $25
  101e44:	6a 19                	push   $0x19
  jmp __alltraps
  101e46:	e9 04 ff ff ff       	jmp    101d4f <__alltraps>

00101e4b <vector26>:
.globl vector26
vector26:
  pushl $0
  101e4b:	6a 00                	push   $0x0
  pushl $26
  101e4d:	6a 1a                	push   $0x1a
  jmp __alltraps
  101e4f:	e9 fb fe ff ff       	jmp    101d4f <__alltraps>

00101e54 <vector27>:
.globl vector27
vector27:
  pushl $0
  101e54:	6a 00                	push   $0x0
  pushl $27
  101e56:	6a 1b                	push   $0x1b
  jmp __alltraps
  101e58:	e9 f2 fe ff ff       	jmp    101d4f <__alltraps>

00101e5d <vector28>:
.globl vector28
vector28:
  pushl $0
  101e5d:	6a 00                	push   $0x0
  pushl $28
  101e5f:	6a 1c                	push   $0x1c
  jmp __alltraps
  101e61:	e9 e9 fe ff ff       	jmp    101d4f <__alltraps>

00101e66 <vector29>:
.globl vector29
vector29:
  pushl $0
  101e66:	6a 00                	push   $0x0
  pushl $29
  101e68:	6a 1d                	push   $0x1d
  jmp __alltraps
  101e6a:	e9 e0 fe ff ff       	jmp    101d4f <__alltraps>

00101e6f <vector30>:
.globl vector30
vector30:
  pushl $0
  101e6f:	6a 00                	push   $0x0
  pushl $30
  101e71:	6a 1e                	push   $0x1e
  jmp __alltraps
  101e73:	e9 d7 fe ff ff       	jmp    101d4f <__alltraps>

00101e78 <vector31>:
.globl vector31
vector31:
  pushl $0
  101e78:	6a 00                	push   $0x0
  pushl $31
  101e7a:	6a 1f                	push   $0x1f
  jmp __alltraps
  101e7c:	e9 ce fe ff ff       	jmp    101d4f <__alltraps>

00101e81 <vector32>:
.globl vector32
vector32:
  pushl $0
  101e81:	6a 00                	push   $0x0
  pushl $32
  101e83:	6a 20                	push   $0x20
  jmp __alltraps
  101e85:	e9 c5 fe ff ff       	jmp    101d4f <__alltraps>

00101e8a <vector33>:
.globl vector33
vector33:
  pushl $0
  101e8a:	6a 00                	push   $0x0
  pushl $33
  101e8c:	6a 21                	push   $0x21
  jmp __alltraps
  101e8e:	e9 bc fe ff ff       	jmp    101d4f <__alltraps>

00101e93 <vector34>:
.globl vector34
vector34:
  pushl $0
  101e93:	6a 00                	push   $0x0
  pushl $34
  101e95:	6a 22                	push   $0x22
  jmp __alltraps
  101e97:	e9 b3 fe ff ff       	jmp    101d4f <__alltraps>

00101e9c <vector35>:
.globl vector35
vector35:
  pushl $0
  101e9c:	6a 00                	push   $0x0
  pushl $35
  101e9e:	6a 23                	push   $0x23
  jmp __alltraps
  101ea0:	e9 aa fe ff ff       	jmp    101d4f <__alltraps>

00101ea5 <vector36>:
.globl vector36
vector36:
  pushl $0
  101ea5:	6a 00                	push   $0x0
  pushl $36
  101ea7:	6a 24                	push   $0x24
  jmp __alltraps
  101ea9:	e9 a1 fe ff ff       	jmp    101d4f <__alltraps>

00101eae <vector37>:
.globl vector37
vector37:
  pushl $0
  101eae:	6a 00                	push   $0x0
  pushl $37
  101eb0:	6a 25                	push   $0x25
  jmp __alltraps
  101eb2:	e9 98 fe ff ff       	jmp    101d4f <__alltraps>

00101eb7 <vector38>:
.globl vector38
vector38:
  pushl $0
  101eb7:	6a 00                	push   $0x0
  pushl $38
  101eb9:	6a 26                	push   $0x26
  jmp __alltraps
  101ebb:	e9 8f fe ff ff       	jmp    101d4f <__alltraps>

00101ec0 <vector39>:
.globl vector39
vector39:
  pushl $0
  101ec0:	6a 00                	push   $0x0
  pushl $39
  101ec2:	6a 27                	push   $0x27
  jmp __alltraps
  101ec4:	e9 86 fe ff ff       	jmp    101d4f <__alltraps>

00101ec9 <vector40>:
.globl vector40
vector40:
  pushl $0
  101ec9:	6a 00                	push   $0x0
  pushl $40
  101ecb:	6a 28                	push   $0x28
  jmp __alltraps
  101ecd:	e9 7d fe ff ff       	jmp    101d4f <__alltraps>

00101ed2 <vector41>:
.globl vector41
vector41:
  pushl $0
  101ed2:	6a 00                	push   $0x0
  pushl $41
  101ed4:	6a 29                	push   $0x29
  jmp __alltraps
  101ed6:	e9 74 fe ff ff       	jmp    101d4f <__alltraps>

00101edb <vector42>:
.globl vector42
vector42:
  pushl $0
  101edb:	6a 00                	push   $0x0
  pushl $42
  101edd:	6a 2a                	push   $0x2a
  jmp __alltraps
  101edf:	e9 6b fe ff ff       	jmp    101d4f <__alltraps>

00101ee4 <vector43>:
.globl vector43
vector43:
  pushl $0
  101ee4:	6a 00                	push   $0x0
  pushl $43
  101ee6:	6a 2b                	push   $0x2b
  jmp __alltraps
  101ee8:	e9 62 fe ff ff       	jmp    101d4f <__alltraps>

00101eed <vector44>:
.globl vector44
vector44:
  pushl $0
  101eed:	6a 00                	push   $0x0
  pushl $44
  101eef:	6a 2c                	push   $0x2c
  jmp __alltraps
  101ef1:	e9 59 fe ff ff       	jmp    101d4f <__alltraps>

00101ef6 <vector45>:
.globl vector45
vector45:
  pushl $0
  101ef6:	6a 00                	push   $0x0
  pushl $45
  101ef8:	6a 2d                	push   $0x2d
  jmp __alltraps
  101efa:	e9 50 fe ff ff       	jmp    101d4f <__alltraps>

00101eff <vector46>:
.globl vector46
vector46:
  pushl $0
  101eff:	6a 00                	push   $0x0
  pushl $46
  101f01:	6a 2e                	push   $0x2e
  jmp __alltraps
  101f03:	e9 47 fe ff ff       	jmp    101d4f <__alltraps>

00101f08 <vector47>:
.globl vector47
vector47:
  pushl $0
  101f08:	6a 00                	push   $0x0
  pushl $47
  101f0a:	6a 2f                	push   $0x2f
  jmp __alltraps
  101f0c:	e9 3e fe ff ff       	jmp    101d4f <__alltraps>

00101f11 <vector48>:
.globl vector48
vector48:
  pushl $0
  101f11:	6a 00                	push   $0x0
  pushl $48
  101f13:	6a 30                	push   $0x30
  jmp __alltraps
  101f15:	e9 35 fe ff ff       	jmp    101d4f <__alltraps>

00101f1a <vector49>:
.globl vector49
vector49:
  pushl $0
  101f1a:	6a 00                	push   $0x0
  pushl $49
  101f1c:	6a 31                	push   $0x31
  jmp __alltraps
  101f1e:	e9 2c fe ff ff       	jmp    101d4f <__alltraps>

00101f23 <vector50>:
.globl vector50
vector50:
  pushl $0
  101f23:	6a 00                	push   $0x0
  pushl $50
  101f25:	6a 32                	push   $0x32
  jmp __alltraps
  101f27:	e9 23 fe ff ff       	jmp    101d4f <__alltraps>

00101f2c <vector51>:
.globl vector51
vector51:
  pushl $0
  101f2c:	6a 00                	push   $0x0
  pushl $51
  101f2e:	6a 33                	push   $0x33
  jmp __alltraps
  101f30:	e9 1a fe ff ff       	jmp    101d4f <__alltraps>

00101f35 <vector52>:
.globl vector52
vector52:
  pushl $0
  101f35:	6a 00                	push   $0x0
  pushl $52
  101f37:	6a 34                	push   $0x34
  jmp __alltraps
  101f39:	e9 11 fe ff ff       	jmp    101d4f <__alltraps>

00101f3e <vector53>:
.globl vector53
vector53:
  pushl $0
  101f3e:	6a 00                	push   $0x0
  pushl $53
  101f40:	6a 35                	push   $0x35
  jmp __alltraps
  101f42:	e9 08 fe ff ff       	jmp    101d4f <__alltraps>

00101f47 <vector54>:
.globl vector54
vector54:
  pushl $0
  101f47:	6a 00                	push   $0x0
  pushl $54
  101f49:	6a 36                	push   $0x36
  jmp __alltraps
  101f4b:	e9 ff fd ff ff       	jmp    101d4f <__alltraps>

00101f50 <vector55>:
.globl vector55
vector55:
  pushl $0
  101f50:	6a 00                	push   $0x0
  pushl $55
  101f52:	6a 37                	push   $0x37
  jmp __alltraps
  101f54:	e9 f6 fd ff ff       	jmp    101d4f <__alltraps>

00101f59 <vector56>:
.globl vector56
vector56:
  pushl $0
  101f59:	6a 00                	push   $0x0
  pushl $56
  101f5b:	6a 38                	push   $0x38
  jmp __alltraps
  101f5d:	e9 ed fd ff ff       	jmp    101d4f <__alltraps>

00101f62 <vector57>:
.globl vector57
vector57:
  pushl $0
  101f62:	6a 00                	push   $0x0
  pushl $57
  101f64:	6a 39                	push   $0x39
  jmp __alltraps
  101f66:	e9 e4 fd ff ff       	jmp    101d4f <__alltraps>

00101f6b <vector58>:
.globl vector58
vector58:
  pushl $0
  101f6b:	6a 00                	push   $0x0
  pushl $58
  101f6d:	6a 3a                	push   $0x3a
  jmp __alltraps
  101f6f:	e9 db fd ff ff       	jmp    101d4f <__alltraps>

00101f74 <vector59>:
.globl vector59
vector59:
  pushl $0
  101f74:	6a 00                	push   $0x0
  pushl $59
  101f76:	6a 3b                	push   $0x3b
  jmp __alltraps
  101f78:	e9 d2 fd ff ff       	jmp    101d4f <__alltraps>

00101f7d <vector60>:
.globl vector60
vector60:
  pushl $0
  101f7d:	6a 00                	push   $0x0
  pushl $60
  101f7f:	6a 3c                	push   $0x3c
  jmp __alltraps
  101f81:	e9 c9 fd ff ff       	jmp    101d4f <__alltraps>

00101f86 <vector61>:
.globl vector61
vector61:
  pushl $0
  101f86:	6a 00                	push   $0x0
  pushl $61
  101f88:	6a 3d                	push   $0x3d
  jmp __alltraps
  101f8a:	e9 c0 fd ff ff       	jmp    101d4f <__alltraps>

00101f8f <vector62>:
.globl vector62
vector62:
  pushl $0
  101f8f:	6a 00                	push   $0x0
  pushl $62
  101f91:	6a 3e                	push   $0x3e
  jmp __alltraps
  101f93:	e9 b7 fd ff ff       	jmp    101d4f <__alltraps>

00101f98 <vector63>:
.globl vector63
vector63:
  pushl $0
  101f98:	6a 00                	push   $0x0
  pushl $63
  101f9a:	6a 3f                	push   $0x3f
  jmp __alltraps
  101f9c:	e9 ae fd ff ff       	jmp    101d4f <__alltraps>

00101fa1 <vector64>:
.globl vector64
vector64:
  pushl $0
  101fa1:	6a 00                	push   $0x0
  pushl $64
  101fa3:	6a 40                	push   $0x40
  jmp __alltraps
  101fa5:	e9 a5 fd ff ff       	jmp    101d4f <__alltraps>

00101faa <vector65>:
.globl vector65
vector65:
  pushl $0
  101faa:	6a 00                	push   $0x0
  pushl $65
  101fac:	6a 41                	push   $0x41
  jmp __alltraps
  101fae:	e9 9c fd ff ff       	jmp    101d4f <__alltraps>

00101fb3 <vector66>:
.globl vector66
vector66:
  pushl $0
  101fb3:	6a 00                	push   $0x0
  pushl $66
  101fb5:	6a 42                	push   $0x42
  jmp __alltraps
  101fb7:	e9 93 fd ff ff       	jmp    101d4f <__alltraps>

00101fbc <vector67>:
.globl vector67
vector67:
  pushl $0
  101fbc:	6a 00                	push   $0x0
  pushl $67
  101fbe:	6a 43                	push   $0x43
  jmp __alltraps
  101fc0:	e9 8a fd ff ff       	jmp    101d4f <__alltraps>

00101fc5 <vector68>:
.globl vector68
vector68:
  pushl $0
  101fc5:	6a 00                	push   $0x0
  pushl $68
  101fc7:	6a 44                	push   $0x44
  jmp __alltraps
  101fc9:	e9 81 fd ff ff       	jmp    101d4f <__alltraps>

00101fce <vector69>:
.globl vector69
vector69:
  pushl $0
  101fce:	6a 00                	push   $0x0
  pushl $69
  101fd0:	6a 45                	push   $0x45
  jmp __alltraps
  101fd2:	e9 78 fd ff ff       	jmp    101d4f <__alltraps>

00101fd7 <vector70>:
.globl vector70
vector70:
  pushl $0
  101fd7:	6a 00                	push   $0x0
  pushl $70
  101fd9:	6a 46                	push   $0x46
  jmp __alltraps
  101fdb:	e9 6f fd ff ff       	jmp    101d4f <__alltraps>

00101fe0 <vector71>:
.globl vector71
vector71:
  pushl $0
  101fe0:	6a 00                	push   $0x0
  pushl $71
  101fe2:	6a 47                	push   $0x47
  jmp __alltraps
  101fe4:	e9 66 fd ff ff       	jmp    101d4f <__alltraps>

00101fe9 <vector72>:
.globl vector72
vector72:
  pushl $0
  101fe9:	6a 00                	push   $0x0
  pushl $72
  101feb:	6a 48                	push   $0x48
  jmp __alltraps
  101fed:	e9 5d fd ff ff       	jmp    101d4f <__alltraps>

00101ff2 <vector73>:
.globl vector73
vector73:
  pushl $0
  101ff2:	6a 00                	push   $0x0
  pushl $73
  101ff4:	6a 49                	push   $0x49
  jmp __alltraps
  101ff6:	e9 54 fd ff ff       	jmp    101d4f <__alltraps>

00101ffb <vector74>:
.globl vector74
vector74:
  pushl $0
  101ffb:	6a 00                	push   $0x0
  pushl $74
  101ffd:	6a 4a                	push   $0x4a
  jmp __alltraps
  101fff:	e9 4b fd ff ff       	jmp    101d4f <__alltraps>

00102004 <vector75>:
.globl vector75
vector75:
  pushl $0
  102004:	6a 00                	push   $0x0
  pushl $75
  102006:	6a 4b                	push   $0x4b
  jmp __alltraps
  102008:	e9 42 fd ff ff       	jmp    101d4f <__alltraps>

0010200d <vector76>:
.globl vector76
vector76:
  pushl $0
  10200d:	6a 00                	push   $0x0
  pushl $76
  10200f:	6a 4c                	push   $0x4c
  jmp __alltraps
  102011:	e9 39 fd ff ff       	jmp    101d4f <__alltraps>

00102016 <vector77>:
.globl vector77
vector77:
  pushl $0
  102016:	6a 00                	push   $0x0
  pushl $77
  102018:	6a 4d                	push   $0x4d
  jmp __alltraps
  10201a:	e9 30 fd ff ff       	jmp    101d4f <__alltraps>

0010201f <vector78>:
.globl vector78
vector78:
  pushl $0
  10201f:	6a 00                	push   $0x0
  pushl $78
  102021:	6a 4e                	push   $0x4e
  jmp __alltraps
  102023:	e9 27 fd ff ff       	jmp    101d4f <__alltraps>

00102028 <vector79>:
.globl vector79
vector79:
  pushl $0
  102028:	6a 00                	push   $0x0
  pushl $79
  10202a:	6a 4f                	push   $0x4f
  jmp __alltraps
  10202c:	e9 1e fd ff ff       	jmp    101d4f <__alltraps>

00102031 <vector80>:
.globl vector80
vector80:
  pushl $0
  102031:	6a 00                	push   $0x0
  pushl $80
  102033:	6a 50                	push   $0x50
  jmp __alltraps
  102035:	e9 15 fd ff ff       	jmp    101d4f <__alltraps>

0010203a <vector81>:
.globl vector81
vector81:
  pushl $0
  10203a:	6a 00                	push   $0x0
  pushl $81
  10203c:	6a 51                	push   $0x51
  jmp __alltraps
  10203e:	e9 0c fd ff ff       	jmp    101d4f <__alltraps>

00102043 <vector82>:
.globl vector82
vector82:
  pushl $0
  102043:	6a 00                	push   $0x0
  pushl $82
  102045:	6a 52                	push   $0x52
  jmp __alltraps
  102047:	e9 03 fd ff ff       	jmp    101d4f <__alltraps>

0010204c <vector83>:
.globl vector83
vector83:
  pushl $0
  10204c:	6a 00                	push   $0x0
  pushl $83
  10204e:	6a 53                	push   $0x53
  jmp __alltraps
  102050:	e9 fa fc ff ff       	jmp    101d4f <__alltraps>

00102055 <vector84>:
.globl vector84
vector84:
  pushl $0
  102055:	6a 00                	push   $0x0
  pushl $84
  102057:	6a 54                	push   $0x54
  jmp __alltraps
  102059:	e9 f1 fc ff ff       	jmp    101d4f <__alltraps>

0010205e <vector85>:
.globl vector85
vector85:
  pushl $0
  10205e:	6a 00                	push   $0x0
  pushl $85
  102060:	6a 55                	push   $0x55
  jmp __alltraps
  102062:	e9 e8 fc ff ff       	jmp    101d4f <__alltraps>

00102067 <vector86>:
.globl vector86
vector86:
  pushl $0
  102067:	6a 00                	push   $0x0
  pushl $86
  102069:	6a 56                	push   $0x56
  jmp __alltraps
  10206b:	e9 df fc ff ff       	jmp    101d4f <__alltraps>

00102070 <vector87>:
.globl vector87
vector87:
  pushl $0
  102070:	6a 00                	push   $0x0
  pushl $87
  102072:	6a 57                	push   $0x57
  jmp __alltraps
  102074:	e9 d6 fc ff ff       	jmp    101d4f <__alltraps>

00102079 <vector88>:
.globl vector88
vector88:
  pushl $0
  102079:	6a 00                	push   $0x0
  pushl $88
  10207b:	6a 58                	push   $0x58
  jmp __alltraps
  10207d:	e9 cd fc ff ff       	jmp    101d4f <__alltraps>

00102082 <vector89>:
.globl vector89
vector89:
  pushl $0
  102082:	6a 00                	push   $0x0
  pushl $89
  102084:	6a 59                	push   $0x59
  jmp __alltraps
  102086:	e9 c4 fc ff ff       	jmp    101d4f <__alltraps>

0010208b <vector90>:
.globl vector90
vector90:
  pushl $0
  10208b:	6a 00                	push   $0x0
  pushl $90
  10208d:	6a 5a                	push   $0x5a
  jmp __alltraps
  10208f:	e9 bb fc ff ff       	jmp    101d4f <__alltraps>

00102094 <vector91>:
.globl vector91
vector91:
  pushl $0
  102094:	6a 00                	push   $0x0
  pushl $91
  102096:	6a 5b                	push   $0x5b
  jmp __alltraps
  102098:	e9 b2 fc ff ff       	jmp    101d4f <__alltraps>

0010209d <vector92>:
.globl vector92
vector92:
  pushl $0
  10209d:	6a 00                	push   $0x0
  pushl $92
  10209f:	6a 5c                	push   $0x5c
  jmp __alltraps
  1020a1:	e9 a9 fc ff ff       	jmp    101d4f <__alltraps>

001020a6 <vector93>:
.globl vector93
vector93:
  pushl $0
  1020a6:	6a 00                	push   $0x0
  pushl $93
  1020a8:	6a 5d                	push   $0x5d
  jmp __alltraps
  1020aa:	e9 a0 fc ff ff       	jmp    101d4f <__alltraps>

001020af <vector94>:
.globl vector94
vector94:
  pushl $0
  1020af:	6a 00                	push   $0x0
  pushl $94
  1020b1:	6a 5e                	push   $0x5e
  jmp __alltraps
  1020b3:	e9 97 fc ff ff       	jmp    101d4f <__alltraps>

001020b8 <vector95>:
.globl vector95
vector95:
  pushl $0
  1020b8:	6a 00                	push   $0x0
  pushl $95
  1020ba:	6a 5f                	push   $0x5f
  jmp __alltraps
  1020bc:	e9 8e fc ff ff       	jmp    101d4f <__alltraps>

001020c1 <vector96>:
.globl vector96
vector96:
  pushl $0
  1020c1:	6a 00                	push   $0x0
  pushl $96
  1020c3:	6a 60                	push   $0x60
  jmp __alltraps
  1020c5:	e9 85 fc ff ff       	jmp    101d4f <__alltraps>

001020ca <vector97>:
.globl vector97
vector97:
  pushl $0
  1020ca:	6a 00                	push   $0x0
  pushl $97
  1020cc:	6a 61                	push   $0x61
  jmp __alltraps
  1020ce:	e9 7c fc ff ff       	jmp    101d4f <__alltraps>

001020d3 <vector98>:
.globl vector98
vector98:
  pushl $0
  1020d3:	6a 00                	push   $0x0
  pushl $98
  1020d5:	6a 62                	push   $0x62
  jmp __alltraps
  1020d7:	e9 73 fc ff ff       	jmp    101d4f <__alltraps>

001020dc <vector99>:
.globl vector99
vector99:
  pushl $0
  1020dc:	6a 00                	push   $0x0
  pushl $99
  1020de:	6a 63                	push   $0x63
  jmp __alltraps
  1020e0:	e9 6a fc ff ff       	jmp    101d4f <__alltraps>

001020e5 <vector100>:
.globl vector100
vector100:
  pushl $0
  1020e5:	6a 00                	push   $0x0
  pushl $100
  1020e7:	6a 64                	push   $0x64
  jmp __alltraps
  1020e9:	e9 61 fc ff ff       	jmp    101d4f <__alltraps>

001020ee <vector101>:
.globl vector101
vector101:
  pushl $0
  1020ee:	6a 00                	push   $0x0
  pushl $101
  1020f0:	6a 65                	push   $0x65
  jmp __alltraps
  1020f2:	e9 58 fc ff ff       	jmp    101d4f <__alltraps>

001020f7 <vector102>:
.globl vector102
vector102:
  pushl $0
  1020f7:	6a 00                	push   $0x0
  pushl $102
  1020f9:	6a 66                	push   $0x66
  jmp __alltraps
  1020fb:	e9 4f fc ff ff       	jmp    101d4f <__alltraps>

00102100 <vector103>:
.globl vector103
vector103:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $103
  102102:	6a 67                	push   $0x67
  jmp __alltraps
  102104:	e9 46 fc ff ff       	jmp    101d4f <__alltraps>

00102109 <vector104>:
.globl vector104
vector104:
  pushl $0
  102109:	6a 00                	push   $0x0
  pushl $104
  10210b:	6a 68                	push   $0x68
  jmp __alltraps
  10210d:	e9 3d fc ff ff       	jmp    101d4f <__alltraps>

00102112 <vector105>:
.globl vector105
vector105:
  pushl $0
  102112:	6a 00                	push   $0x0
  pushl $105
  102114:	6a 69                	push   $0x69
  jmp __alltraps
  102116:	e9 34 fc ff ff       	jmp    101d4f <__alltraps>

0010211b <vector106>:
.globl vector106
vector106:
  pushl $0
  10211b:	6a 00                	push   $0x0
  pushl $106
  10211d:	6a 6a                	push   $0x6a
  jmp __alltraps
  10211f:	e9 2b fc ff ff       	jmp    101d4f <__alltraps>

00102124 <vector107>:
.globl vector107
vector107:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $107
  102126:	6a 6b                	push   $0x6b
  jmp __alltraps
  102128:	e9 22 fc ff ff       	jmp    101d4f <__alltraps>

0010212d <vector108>:
.globl vector108
vector108:
  pushl $0
  10212d:	6a 00                	push   $0x0
  pushl $108
  10212f:	6a 6c                	push   $0x6c
  jmp __alltraps
  102131:	e9 19 fc ff ff       	jmp    101d4f <__alltraps>

00102136 <vector109>:
.globl vector109
vector109:
  pushl $0
  102136:	6a 00                	push   $0x0
  pushl $109
  102138:	6a 6d                	push   $0x6d
  jmp __alltraps
  10213a:	e9 10 fc ff ff       	jmp    101d4f <__alltraps>

0010213f <vector110>:
.globl vector110
vector110:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $110
  102141:	6a 6e                	push   $0x6e
  jmp __alltraps
  102143:	e9 07 fc ff ff       	jmp    101d4f <__alltraps>

00102148 <vector111>:
.globl vector111
vector111:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $111
  10214a:	6a 6f                	push   $0x6f
  jmp __alltraps
  10214c:	e9 fe fb ff ff       	jmp    101d4f <__alltraps>

00102151 <vector112>:
.globl vector112
vector112:
  pushl $0
  102151:	6a 00                	push   $0x0
  pushl $112
  102153:	6a 70                	push   $0x70
  jmp __alltraps
  102155:	e9 f5 fb ff ff       	jmp    101d4f <__alltraps>

0010215a <vector113>:
.globl vector113
vector113:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $113
  10215c:	6a 71                	push   $0x71
  jmp __alltraps
  10215e:	e9 ec fb ff ff       	jmp    101d4f <__alltraps>

00102163 <vector114>:
.globl vector114
vector114:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $114
  102165:	6a 72                	push   $0x72
  jmp __alltraps
  102167:	e9 e3 fb ff ff       	jmp    101d4f <__alltraps>

0010216c <vector115>:
.globl vector115
vector115:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $115
  10216e:	6a 73                	push   $0x73
  jmp __alltraps
  102170:	e9 da fb ff ff       	jmp    101d4f <__alltraps>

00102175 <vector116>:
.globl vector116
vector116:
  pushl $0
  102175:	6a 00                	push   $0x0
  pushl $116
  102177:	6a 74                	push   $0x74
  jmp __alltraps
  102179:	e9 d1 fb ff ff       	jmp    101d4f <__alltraps>

0010217e <vector117>:
.globl vector117
vector117:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $117
  102180:	6a 75                	push   $0x75
  jmp __alltraps
  102182:	e9 c8 fb ff ff       	jmp    101d4f <__alltraps>

00102187 <vector118>:
.globl vector118
vector118:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $118
  102189:	6a 76                	push   $0x76
  jmp __alltraps
  10218b:	e9 bf fb ff ff       	jmp    101d4f <__alltraps>

00102190 <vector119>:
.globl vector119
vector119:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $119
  102192:	6a 77                	push   $0x77
  jmp __alltraps
  102194:	e9 b6 fb ff ff       	jmp    101d4f <__alltraps>

00102199 <vector120>:
.globl vector120
vector120:
  pushl $0
  102199:	6a 00                	push   $0x0
  pushl $120
  10219b:	6a 78                	push   $0x78
  jmp __alltraps
  10219d:	e9 ad fb ff ff       	jmp    101d4f <__alltraps>

001021a2 <vector121>:
.globl vector121
vector121:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $121
  1021a4:	6a 79                	push   $0x79
  jmp __alltraps
  1021a6:	e9 a4 fb ff ff       	jmp    101d4f <__alltraps>

001021ab <vector122>:
.globl vector122
vector122:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $122
  1021ad:	6a 7a                	push   $0x7a
  jmp __alltraps
  1021af:	e9 9b fb ff ff       	jmp    101d4f <__alltraps>

001021b4 <vector123>:
.globl vector123
vector123:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $123
  1021b6:	6a 7b                	push   $0x7b
  jmp __alltraps
  1021b8:	e9 92 fb ff ff       	jmp    101d4f <__alltraps>

001021bd <vector124>:
.globl vector124
vector124:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $124
  1021bf:	6a 7c                	push   $0x7c
  jmp __alltraps
  1021c1:	e9 89 fb ff ff       	jmp    101d4f <__alltraps>

001021c6 <vector125>:
.globl vector125
vector125:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $125
  1021c8:	6a 7d                	push   $0x7d
  jmp __alltraps
  1021ca:	e9 80 fb ff ff       	jmp    101d4f <__alltraps>

001021cf <vector126>:
.globl vector126
vector126:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $126
  1021d1:	6a 7e                	push   $0x7e
  jmp __alltraps
  1021d3:	e9 77 fb ff ff       	jmp    101d4f <__alltraps>

001021d8 <vector127>:
.globl vector127
vector127:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $127
  1021da:	6a 7f                	push   $0x7f
  jmp __alltraps
  1021dc:	e9 6e fb ff ff       	jmp    101d4f <__alltraps>

001021e1 <vector128>:
.globl vector128
vector128:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $128
  1021e3:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1021e8:	e9 62 fb ff ff       	jmp    101d4f <__alltraps>

001021ed <vector129>:
.globl vector129
vector129:
  pushl $0
  1021ed:	6a 00                	push   $0x0
  pushl $129
  1021ef:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1021f4:	e9 56 fb ff ff       	jmp    101d4f <__alltraps>

001021f9 <vector130>:
.globl vector130
vector130:
  pushl $0
  1021f9:	6a 00                	push   $0x0
  pushl $130
  1021fb:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  102200:	e9 4a fb ff ff       	jmp    101d4f <__alltraps>

00102205 <vector131>:
.globl vector131
vector131:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $131
  102207:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  10220c:	e9 3e fb ff ff       	jmp    101d4f <__alltraps>

00102211 <vector132>:
.globl vector132
vector132:
  pushl $0
  102211:	6a 00                	push   $0x0
  pushl $132
  102213:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  102218:	e9 32 fb ff ff       	jmp    101d4f <__alltraps>

0010221d <vector133>:
.globl vector133
vector133:
  pushl $0
  10221d:	6a 00                	push   $0x0
  pushl $133
  10221f:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102224:	e9 26 fb ff ff       	jmp    101d4f <__alltraps>

00102229 <vector134>:
.globl vector134
vector134:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $134
  10222b:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102230:	e9 1a fb ff ff       	jmp    101d4f <__alltraps>

00102235 <vector135>:
.globl vector135
vector135:
  pushl $0
  102235:	6a 00                	push   $0x0
  pushl $135
  102237:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  10223c:	e9 0e fb ff ff       	jmp    101d4f <__alltraps>

00102241 <vector136>:
.globl vector136
vector136:
  pushl $0
  102241:	6a 00                	push   $0x0
  pushl $136
  102243:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102248:	e9 02 fb ff ff       	jmp    101d4f <__alltraps>

0010224d <vector137>:
.globl vector137
vector137:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $137
  10224f:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102254:	e9 f6 fa ff ff       	jmp    101d4f <__alltraps>

00102259 <vector138>:
.globl vector138
vector138:
  pushl $0
  102259:	6a 00                	push   $0x0
  pushl $138
  10225b:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102260:	e9 ea fa ff ff       	jmp    101d4f <__alltraps>

00102265 <vector139>:
.globl vector139
vector139:
  pushl $0
  102265:	6a 00                	push   $0x0
  pushl $139
  102267:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  10226c:	e9 de fa ff ff       	jmp    101d4f <__alltraps>

00102271 <vector140>:
.globl vector140
vector140:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $140
  102273:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102278:	e9 d2 fa ff ff       	jmp    101d4f <__alltraps>

0010227d <vector141>:
.globl vector141
vector141:
  pushl $0
  10227d:	6a 00                	push   $0x0
  pushl $141
  10227f:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102284:	e9 c6 fa ff ff       	jmp    101d4f <__alltraps>

00102289 <vector142>:
.globl vector142
vector142:
  pushl $0
  102289:	6a 00                	push   $0x0
  pushl $142
  10228b:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102290:	e9 ba fa ff ff       	jmp    101d4f <__alltraps>

00102295 <vector143>:
.globl vector143
vector143:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $143
  102297:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  10229c:	e9 ae fa ff ff       	jmp    101d4f <__alltraps>

001022a1 <vector144>:
.globl vector144
vector144:
  pushl $0
  1022a1:	6a 00                	push   $0x0
  pushl $144
  1022a3:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  1022a8:	e9 a2 fa ff ff       	jmp    101d4f <__alltraps>

001022ad <vector145>:
.globl vector145
vector145:
  pushl $0
  1022ad:	6a 00                	push   $0x0
  pushl $145
  1022af:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1022b4:	e9 96 fa ff ff       	jmp    101d4f <__alltraps>

001022b9 <vector146>:
.globl vector146
vector146:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $146
  1022bb:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1022c0:	e9 8a fa ff ff       	jmp    101d4f <__alltraps>

001022c5 <vector147>:
.globl vector147
vector147:
  pushl $0
  1022c5:	6a 00                	push   $0x0
  pushl $147
  1022c7:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1022cc:	e9 7e fa ff ff       	jmp    101d4f <__alltraps>

001022d1 <vector148>:
.globl vector148
vector148:
  pushl $0
  1022d1:	6a 00                	push   $0x0
  pushl $148
  1022d3:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1022d8:	e9 72 fa ff ff       	jmp    101d4f <__alltraps>

001022dd <vector149>:
.globl vector149
vector149:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $149
  1022df:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1022e4:	e9 66 fa ff ff       	jmp    101d4f <__alltraps>

001022e9 <vector150>:
.globl vector150
vector150:
  pushl $0
  1022e9:	6a 00                	push   $0x0
  pushl $150
  1022eb:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1022f0:	e9 5a fa ff ff       	jmp    101d4f <__alltraps>

001022f5 <vector151>:
.globl vector151
vector151:
  pushl $0
  1022f5:	6a 00                	push   $0x0
  pushl $151
  1022f7:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1022fc:	e9 4e fa ff ff       	jmp    101d4f <__alltraps>

00102301 <vector152>:
.globl vector152
vector152:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $152
  102303:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  102308:	e9 42 fa ff ff       	jmp    101d4f <__alltraps>

0010230d <vector153>:
.globl vector153
vector153:
  pushl $0
  10230d:	6a 00                	push   $0x0
  pushl $153
  10230f:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102314:	e9 36 fa ff ff       	jmp    101d4f <__alltraps>

00102319 <vector154>:
.globl vector154
vector154:
  pushl $0
  102319:	6a 00                	push   $0x0
  pushl $154
  10231b:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102320:	e9 2a fa ff ff       	jmp    101d4f <__alltraps>

00102325 <vector155>:
.globl vector155
vector155:
  pushl $0
  102325:	6a 00                	push   $0x0
  pushl $155
  102327:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  10232c:	e9 1e fa ff ff       	jmp    101d4f <__alltraps>

00102331 <vector156>:
.globl vector156
vector156:
  pushl $0
  102331:	6a 00                	push   $0x0
  pushl $156
  102333:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  102338:	e9 12 fa ff ff       	jmp    101d4f <__alltraps>

0010233d <vector157>:
.globl vector157
vector157:
  pushl $0
  10233d:	6a 00                	push   $0x0
  pushl $157
  10233f:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102344:	e9 06 fa ff ff       	jmp    101d4f <__alltraps>

00102349 <vector158>:
.globl vector158
vector158:
  pushl $0
  102349:	6a 00                	push   $0x0
  pushl $158
  10234b:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102350:	e9 fa f9 ff ff       	jmp    101d4f <__alltraps>

00102355 <vector159>:
.globl vector159
vector159:
  pushl $0
  102355:	6a 00                	push   $0x0
  pushl $159
  102357:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  10235c:	e9 ee f9 ff ff       	jmp    101d4f <__alltraps>

00102361 <vector160>:
.globl vector160
vector160:
  pushl $0
  102361:	6a 00                	push   $0x0
  pushl $160
  102363:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102368:	e9 e2 f9 ff ff       	jmp    101d4f <__alltraps>

0010236d <vector161>:
.globl vector161
vector161:
  pushl $0
  10236d:	6a 00                	push   $0x0
  pushl $161
  10236f:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102374:	e9 d6 f9 ff ff       	jmp    101d4f <__alltraps>

00102379 <vector162>:
.globl vector162
vector162:
  pushl $0
  102379:	6a 00                	push   $0x0
  pushl $162
  10237b:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102380:	e9 ca f9 ff ff       	jmp    101d4f <__alltraps>

00102385 <vector163>:
.globl vector163
vector163:
  pushl $0
  102385:	6a 00                	push   $0x0
  pushl $163
  102387:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  10238c:	e9 be f9 ff ff       	jmp    101d4f <__alltraps>

00102391 <vector164>:
.globl vector164
vector164:
  pushl $0
  102391:	6a 00                	push   $0x0
  pushl $164
  102393:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102398:	e9 b2 f9 ff ff       	jmp    101d4f <__alltraps>

0010239d <vector165>:
.globl vector165
vector165:
  pushl $0
  10239d:	6a 00                	push   $0x0
  pushl $165
  10239f:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  1023a4:	e9 a6 f9 ff ff       	jmp    101d4f <__alltraps>

001023a9 <vector166>:
.globl vector166
vector166:
  pushl $0
  1023a9:	6a 00                	push   $0x0
  pushl $166
  1023ab:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1023b0:	e9 9a f9 ff ff       	jmp    101d4f <__alltraps>

001023b5 <vector167>:
.globl vector167
vector167:
  pushl $0
  1023b5:	6a 00                	push   $0x0
  pushl $167
  1023b7:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1023bc:	e9 8e f9 ff ff       	jmp    101d4f <__alltraps>

001023c1 <vector168>:
.globl vector168
vector168:
  pushl $0
  1023c1:	6a 00                	push   $0x0
  pushl $168
  1023c3:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1023c8:	e9 82 f9 ff ff       	jmp    101d4f <__alltraps>

001023cd <vector169>:
.globl vector169
vector169:
  pushl $0
  1023cd:	6a 00                	push   $0x0
  pushl $169
  1023cf:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1023d4:	e9 76 f9 ff ff       	jmp    101d4f <__alltraps>

001023d9 <vector170>:
.globl vector170
vector170:
  pushl $0
  1023d9:	6a 00                	push   $0x0
  pushl $170
  1023db:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1023e0:	e9 6a f9 ff ff       	jmp    101d4f <__alltraps>

001023e5 <vector171>:
.globl vector171
vector171:
  pushl $0
  1023e5:	6a 00                	push   $0x0
  pushl $171
  1023e7:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1023ec:	e9 5e f9 ff ff       	jmp    101d4f <__alltraps>

001023f1 <vector172>:
.globl vector172
vector172:
  pushl $0
  1023f1:	6a 00                	push   $0x0
  pushl $172
  1023f3:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1023f8:	e9 52 f9 ff ff       	jmp    101d4f <__alltraps>

001023fd <vector173>:
.globl vector173
vector173:
  pushl $0
  1023fd:	6a 00                	push   $0x0
  pushl $173
  1023ff:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  102404:	e9 46 f9 ff ff       	jmp    101d4f <__alltraps>

00102409 <vector174>:
.globl vector174
vector174:
  pushl $0
  102409:	6a 00                	push   $0x0
  pushl $174
  10240b:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102410:	e9 3a f9 ff ff       	jmp    101d4f <__alltraps>

00102415 <vector175>:
.globl vector175
vector175:
  pushl $0
  102415:	6a 00                	push   $0x0
  pushl $175
  102417:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  10241c:	e9 2e f9 ff ff       	jmp    101d4f <__alltraps>

00102421 <vector176>:
.globl vector176
vector176:
  pushl $0
  102421:	6a 00                	push   $0x0
  pushl $176
  102423:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  102428:	e9 22 f9 ff ff       	jmp    101d4f <__alltraps>

0010242d <vector177>:
.globl vector177
vector177:
  pushl $0
  10242d:	6a 00                	push   $0x0
  pushl $177
  10242f:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102434:	e9 16 f9 ff ff       	jmp    101d4f <__alltraps>

00102439 <vector178>:
.globl vector178
vector178:
  pushl $0
  102439:	6a 00                	push   $0x0
  pushl $178
  10243b:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102440:	e9 0a f9 ff ff       	jmp    101d4f <__alltraps>

00102445 <vector179>:
.globl vector179
vector179:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $179
  102447:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  10244c:	e9 fe f8 ff ff       	jmp    101d4f <__alltraps>

00102451 <vector180>:
.globl vector180
vector180:
  pushl $0
  102451:	6a 00                	push   $0x0
  pushl $180
  102453:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102458:	e9 f2 f8 ff ff       	jmp    101d4f <__alltraps>

0010245d <vector181>:
.globl vector181
vector181:
  pushl $0
  10245d:	6a 00                	push   $0x0
  pushl $181
  10245f:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102464:	e9 e6 f8 ff ff       	jmp    101d4f <__alltraps>

00102469 <vector182>:
.globl vector182
vector182:
  pushl $0
  102469:	6a 00                	push   $0x0
  pushl $182
  10246b:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102470:	e9 da f8 ff ff       	jmp    101d4f <__alltraps>

00102475 <vector183>:
.globl vector183
vector183:
  pushl $0
  102475:	6a 00                	push   $0x0
  pushl $183
  102477:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  10247c:	e9 ce f8 ff ff       	jmp    101d4f <__alltraps>

00102481 <vector184>:
.globl vector184
vector184:
  pushl $0
  102481:	6a 00                	push   $0x0
  pushl $184
  102483:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102488:	e9 c2 f8 ff ff       	jmp    101d4f <__alltraps>

0010248d <vector185>:
.globl vector185
vector185:
  pushl $0
  10248d:	6a 00                	push   $0x0
  pushl $185
  10248f:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102494:	e9 b6 f8 ff ff       	jmp    101d4f <__alltraps>

00102499 <vector186>:
.globl vector186
vector186:
  pushl $0
  102499:	6a 00                	push   $0x0
  pushl $186
  10249b:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  1024a0:	e9 aa f8 ff ff       	jmp    101d4f <__alltraps>

001024a5 <vector187>:
.globl vector187
vector187:
  pushl $0
  1024a5:	6a 00                	push   $0x0
  pushl $187
  1024a7:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1024ac:	e9 9e f8 ff ff       	jmp    101d4f <__alltraps>

001024b1 <vector188>:
.globl vector188
vector188:
  pushl $0
  1024b1:	6a 00                	push   $0x0
  pushl $188
  1024b3:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1024b8:	e9 92 f8 ff ff       	jmp    101d4f <__alltraps>

001024bd <vector189>:
.globl vector189
vector189:
  pushl $0
  1024bd:	6a 00                	push   $0x0
  pushl $189
  1024bf:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1024c4:	e9 86 f8 ff ff       	jmp    101d4f <__alltraps>

001024c9 <vector190>:
.globl vector190
vector190:
  pushl $0
  1024c9:	6a 00                	push   $0x0
  pushl $190
  1024cb:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1024d0:	e9 7a f8 ff ff       	jmp    101d4f <__alltraps>

001024d5 <vector191>:
.globl vector191
vector191:
  pushl $0
  1024d5:	6a 00                	push   $0x0
  pushl $191
  1024d7:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1024dc:	e9 6e f8 ff ff       	jmp    101d4f <__alltraps>

001024e1 <vector192>:
.globl vector192
vector192:
  pushl $0
  1024e1:	6a 00                	push   $0x0
  pushl $192
  1024e3:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1024e8:	e9 62 f8 ff ff       	jmp    101d4f <__alltraps>

001024ed <vector193>:
.globl vector193
vector193:
  pushl $0
  1024ed:	6a 00                	push   $0x0
  pushl $193
  1024ef:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1024f4:	e9 56 f8 ff ff       	jmp    101d4f <__alltraps>

001024f9 <vector194>:
.globl vector194
vector194:
  pushl $0
  1024f9:	6a 00                	push   $0x0
  pushl $194
  1024fb:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  102500:	e9 4a f8 ff ff       	jmp    101d4f <__alltraps>

00102505 <vector195>:
.globl vector195
vector195:
  pushl $0
  102505:	6a 00                	push   $0x0
  pushl $195
  102507:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  10250c:	e9 3e f8 ff ff       	jmp    101d4f <__alltraps>

00102511 <vector196>:
.globl vector196
vector196:
  pushl $0
  102511:	6a 00                	push   $0x0
  pushl $196
  102513:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  102518:	e9 32 f8 ff ff       	jmp    101d4f <__alltraps>

0010251d <vector197>:
.globl vector197
vector197:
  pushl $0
  10251d:	6a 00                	push   $0x0
  pushl $197
  10251f:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102524:	e9 26 f8 ff ff       	jmp    101d4f <__alltraps>

00102529 <vector198>:
.globl vector198
vector198:
  pushl $0
  102529:	6a 00                	push   $0x0
  pushl $198
  10252b:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102530:	e9 1a f8 ff ff       	jmp    101d4f <__alltraps>

00102535 <vector199>:
.globl vector199
vector199:
  pushl $0
  102535:	6a 00                	push   $0x0
  pushl $199
  102537:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  10253c:	e9 0e f8 ff ff       	jmp    101d4f <__alltraps>

00102541 <vector200>:
.globl vector200
vector200:
  pushl $0
  102541:	6a 00                	push   $0x0
  pushl $200
  102543:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102548:	e9 02 f8 ff ff       	jmp    101d4f <__alltraps>

0010254d <vector201>:
.globl vector201
vector201:
  pushl $0
  10254d:	6a 00                	push   $0x0
  pushl $201
  10254f:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102554:	e9 f6 f7 ff ff       	jmp    101d4f <__alltraps>

00102559 <vector202>:
.globl vector202
vector202:
  pushl $0
  102559:	6a 00                	push   $0x0
  pushl $202
  10255b:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102560:	e9 ea f7 ff ff       	jmp    101d4f <__alltraps>

00102565 <vector203>:
.globl vector203
vector203:
  pushl $0
  102565:	6a 00                	push   $0x0
  pushl $203
  102567:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  10256c:	e9 de f7 ff ff       	jmp    101d4f <__alltraps>

00102571 <vector204>:
.globl vector204
vector204:
  pushl $0
  102571:	6a 00                	push   $0x0
  pushl $204
  102573:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102578:	e9 d2 f7 ff ff       	jmp    101d4f <__alltraps>

0010257d <vector205>:
.globl vector205
vector205:
  pushl $0
  10257d:	6a 00                	push   $0x0
  pushl $205
  10257f:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102584:	e9 c6 f7 ff ff       	jmp    101d4f <__alltraps>

00102589 <vector206>:
.globl vector206
vector206:
  pushl $0
  102589:	6a 00                	push   $0x0
  pushl $206
  10258b:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102590:	e9 ba f7 ff ff       	jmp    101d4f <__alltraps>

00102595 <vector207>:
.globl vector207
vector207:
  pushl $0
  102595:	6a 00                	push   $0x0
  pushl $207
  102597:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  10259c:	e9 ae f7 ff ff       	jmp    101d4f <__alltraps>

001025a1 <vector208>:
.globl vector208
vector208:
  pushl $0
  1025a1:	6a 00                	push   $0x0
  pushl $208
  1025a3:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  1025a8:	e9 a2 f7 ff ff       	jmp    101d4f <__alltraps>

001025ad <vector209>:
.globl vector209
vector209:
  pushl $0
  1025ad:	6a 00                	push   $0x0
  pushl $209
  1025af:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1025b4:	e9 96 f7 ff ff       	jmp    101d4f <__alltraps>

001025b9 <vector210>:
.globl vector210
vector210:
  pushl $0
  1025b9:	6a 00                	push   $0x0
  pushl $210
  1025bb:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1025c0:	e9 8a f7 ff ff       	jmp    101d4f <__alltraps>

001025c5 <vector211>:
.globl vector211
vector211:
  pushl $0
  1025c5:	6a 00                	push   $0x0
  pushl $211
  1025c7:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1025cc:	e9 7e f7 ff ff       	jmp    101d4f <__alltraps>

001025d1 <vector212>:
.globl vector212
vector212:
  pushl $0
  1025d1:	6a 00                	push   $0x0
  pushl $212
  1025d3:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1025d8:	e9 72 f7 ff ff       	jmp    101d4f <__alltraps>

001025dd <vector213>:
.globl vector213
vector213:
  pushl $0
  1025dd:	6a 00                	push   $0x0
  pushl $213
  1025df:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1025e4:	e9 66 f7 ff ff       	jmp    101d4f <__alltraps>

001025e9 <vector214>:
.globl vector214
vector214:
  pushl $0
  1025e9:	6a 00                	push   $0x0
  pushl $214
  1025eb:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1025f0:	e9 5a f7 ff ff       	jmp    101d4f <__alltraps>

001025f5 <vector215>:
.globl vector215
vector215:
  pushl $0
  1025f5:	6a 00                	push   $0x0
  pushl $215
  1025f7:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1025fc:	e9 4e f7 ff ff       	jmp    101d4f <__alltraps>

00102601 <vector216>:
.globl vector216
vector216:
  pushl $0
  102601:	6a 00                	push   $0x0
  pushl $216
  102603:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  102608:	e9 42 f7 ff ff       	jmp    101d4f <__alltraps>

0010260d <vector217>:
.globl vector217
vector217:
  pushl $0
  10260d:	6a 00                	push   $0x0
  pushl $217
  10260f:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102614:	e9 36 f7 ff ff       	jmp    101d4f <__alltraps>

00102619 <vector218>:
.globl vector218
vector218:
  pushl $0
  102619:	6a 00                	push   $0x0
  pushl $218
  10261b:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102620:	e9 2a f7 ff ff       	jmp    101d4f <__alltraps>

00102625 <vector219>:
.globl vector219
vector219:
  pushl $0
  102625:	6a 00                	push   $0x0
  pushl $219
  102627:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  10262c:	e9 1e f7 ff ff       	jmp    101d4f <__alltraps>

00102631 <vector220>:
.globl vector220
vector220:
  pushl $0
  102631:	6a 00                	push   $0x0
  pushl $220
  102633:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  102638:	e9 12 f7 ff ff       	jmp    101d4f <__alltraps>

0010263d <vector221>:
.globl vector221
vector221:
  pushl $0
  10263d:	6a 00                	push   $0x0
  pushl $221
  10263f:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102644:	e9 06 f7 ff ff       	jmp    101d4f <__alltraps>

00102649 <vector222>:
.globl vector222
vector222:
  pushl $0
  102649:	6a 00                	push   $0x0
  pushl $222
  10264b:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102650:	e9 fa f6 ff ff       	jmp    101d4f <__alltraps>

00102655 <vector223>:
.globl vector223
vector223:
  pushl $0
  102655:	6a 00                	push   $0x0
  pushl $223
  102657:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  10265c:	e9 ee f6 ff ff       	jmp    101d4f <__alltraps>

00102661 <vector224>:
.globl vector224
vector224:
  pushl $0
  102661:	6a 00                	push   $0x0
  pushl $224
  102663:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102668:	e9 e2 f6 ff ff       	jmp    101d4f <__alltraps>

0010266d <vector225>:
.globl vector225
vector225:
  pushl $0
  10266d:	6a 00                	push   $0x0
  pushl $225
  10266f:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102674:	e9 d6 f6 ff ff       	jmp    101d4f <__alltraps>

00102679 <vector226>:
.globl vector226
vector226:
  pushl $0
  102679:	6a 00                	push   $0x0
  pushl $226
  10267b:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102680:	e9 ca f6 ff ff       	jmp    101d4f <__alltraps>

00102685 <vector227>:
.globl vector227
vector227:
  pushl $0
  102685:	6a 00                	push   $0x0
  pushl $227
  102687:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  10268c:	e9 be f6 ff ff       	jmp    101d4f <__alltraps>

00102691 <vector228>:
.globl vector228
vector228:
  pushl $0
  102691:	6a 00                	push   $0x0
  pushl $228
  102693:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102698:	e9 b2 f6 ff ff       	jmp    101d4f <__alltraps>

0010269d <vector229>:
.globl vector229
vector229:
  pushl $0
  10269d:	6a 00                	push   $0x0
  pushl $229
  10269f:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  1026a4:	e9 a6 f6 ff ff       	jmp    101d4f <__alltraps>

001026a9 <vector230>:
.globl vector230
vector230:
  pushl $0
  1026a9:	6a 00                	push   $0x0
  pushl $230
  1026ab:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1026b0:	e9 9a f6 ff ff       	jmp    101d4f <__alltraps>

001026b5 <vector231>:
.globl vector231
vector231:
  pushl $0
  1026b5:	6a 00                	push   $0x0
  pushl $231
  1026b7:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1026bc:	e9 8e f6 ff ff       	jmp    101d4f <__alltraps>

001026c1 <vector232>:
.globl vector232
vector232:
  pushl $0
  1026c1:	6a 00                	push   $0x0
  pushl $232
  1026c3:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1026c8:	e9 82 f6 ff ff       	jmp    101d4f <__alltraps>

001026cd <vector233>:
.globl vector233
vector233:
  pushl $0
  1026cd:	6a 00                	push   $0x0
  pushl $233
  1026cf:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1026d4:	e9 76 f6 ff ff       	jmp    101d4f <__alltraps>

001026d9 <vector234>:
.globl vector234
vector234:
  pushl $0
  1026d9:	6a 00                	push   $0x0
  pushl $234
  1026db:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1026e0:	e9 6a f6 ff ff       	jmp    101d4f <__alltraps>

001026e5 <vector235>:
.globl vector235
vector235:
  pushl $0
  1026e5:	6a 00                	push   $0x0
  pushl $235
  1026e7:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1026ec:	e9 5e f6 ff ff       	jmp    101d4f <__alltraps>

001026f1 <vector236>:
.globl vector236
vector236:
  pushl $0
  1026f1:	6a 00                	push   $0x0
  pushl $236
  1026f3:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1026f8:	e9 52 f6 ff ff       	jmp    101d4f <__alltraps>

001026fd <vector237>:
.globl vector237
vector237:
  pushl $0
  1026fd:	6a 00                	push   $0x0
  pushl $237
  1026ff:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  102704:	e9 46 f6 ff ff       	jmp    101d4f <__alltraps>

00102709 <vector238>:
.globl vector238
vector238:
  pushl $0
  102709:	6a 00                	push   $0x0
  pushl $238
  10270b:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102710:	e9 3a f6 ff ff       	jmp    101d4f <__alltraps>

00102715 <vector239>:
.globl vector239
vector239:
  pushl $0
  102715:	6a 00                	push   $0x0
  pushl $239
  102717:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  10271c:	e9 2e f6 ff ff       	jmp    101d4f <__alltraps>

00102721 <vector240>:
.globl vector240
vector240:
  pushl $0
  102721:	6a 00                	push   $0x0
  pushl $240
  102723:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102728:	e9 22 f6 ff ff       	jmp    101d4f <__alltraps>

0010272d <vector241>:
.globl vector241
vector241:
  pushl $0
  10272d:	6a 00                	push   $0x0
  pushl $241
  10272f:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102734:	e9 16 f6 ff ff       	jmp    101d4f <__alltraps>

00102739 <vector242>:
.globl vector242
vector242:
  pushl $0
  102739:	6a 00                	push   $0x0
  pushl $242
  10273b:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102740:	e9 0a f6 ff ff       	jmp    101d4f <__alltraps>

00102745 <vector243>:
.globl vector243
vector243:
  pushl $0
  102745:	6a 00                	push   $0x0
  pushl $243
  102747:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  10274c:	e9 fe f5 ff ff       	jmp    101d4f <__alltraps>

00102751 <vector244>:
.globl vector244
vector244:
  pushl $0
  102751:	6a 00                	push   $0x0
  pushl $244
  102753:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102758:	e9 f2 f5 ff ff       	jmp    101d4f <__alltraps>

0010275d <vector245>:
.globl vector245
vector245:
  pushl $0
  10275d:	6a 00                	push   $0x0
  pushl $245
  10275f:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102764:	e9 e6 f5 ff ff       	jmp    101d4f <__alltraps>

00102769 <vector246>:
.globl vector246
vector246:
  pushl $0
  102769:	6a 00                	push   $0x0
  pushl $246
  10276b:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102770:	e9 da f5 ff ff       	jmp    101d4f <__alltraps>

00102775 <vector247>:
.globl vector247
vector247:
  pushl $0
  102775:	6a 00                	push   $0x0
  pushl $247
  102777:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  10277c:	e9 ce f5 ff ff       	jmp    101d4f <__alltraps>

00102781 <vector248>:
.globl vector248
vector248:
  pushl $0
  102781:	6a 00                	push   $0x0
  pushl $248
  102783:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102788:	e9 c2 f5 ff ff       	jmp    101d4f <__alltraps>

0010278d <vector249>:
.globl vector249
vector249:
  pushl $0
  10278d:	6a 00                	push   $0x0
  pushl $249
  10278f:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102794:	e9 b6 f5 ff ff       	jmp    101d4f <__alltraps>

00102799 <vector250>:
.globl vector250
vector250:
  pushl $0
  102799:	6a 00                	push   $0x0
  pushl $250
  10279b:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  1027a0:	e9 aa f5 ff ff       	jmp    101d4f <__alltraps>

001027a5 <vector251>:
.globl vector251
vector251:
  pushl $0
  1027a5:	6a 00                	push   $0x0
  pushl $251
  1027a7:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  1027ac:	e9 9e f5 ff ff       	jmp    101d4f <__alltraps>

001027b1 <vector252>:
.globl vector252
vector252:
  pushl $0
  1027b1:	6a 00                	push   $0x0
  pushl $252
  1027b3:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  1027b8:	e9 92 f5 ff ff       	jmp    101d4f <__alltraps>

001027bd <vector253>:
.globl vector253
vector253:
  pushl $0
  1027bd:	6a 00                	push   $0x0
  pushl $253
  1027bf:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  1027c4:	e9 86 f5 ff ff       	jmp    101d4f <__alltraps>

001027c9 <vector254>:
.globl vector254
vector254:
  pushl $0
  1027c9:	6a 00                	push   $0x0
  pushl $254
  1027cb:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  1027d0:	e9 7a f5 ff ff       	jmp    101d4f <__alltraps>

001027d5 <vector255>:
.globl vector255
vector255:
  pushl $0
  1027d5:	6a 00                	push   $0x0
  pushl $255
  1027d7:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  1027dc:	e9 6e f5 ff ff       	jmp    101d4f <__alltraps>

001027e1 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1027e1:	55                   	push   %ebp
  1027e2:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1027e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1027e7:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1027ea:	b8 23 00 00 00       	mov    $0x23,%eax
  1027ef:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1027f1:	b8 23 00 00 00       	mov    $0x23,%eax
  1027f6:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1027f8:	b8 10 00 00 00       	mov    $0x10,%eax
  1027fd:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1027ff:	b8 10 00 00 00       	mov    $0x10,%eax
  102804:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102806:	b8 10 00 00 00       	mov    $0x10,%eax
  10280b:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  10280d:	ea 14 28 10 00 08 00 	ljmp   $0x8,$0x102814
}
  102814:	5d                   	pop    %ebp
  102815:	c3                   	ret    

00102816 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102816:	55                   	push   %ebp
  102817:	89 e5                	mov    %esp,%ebp
  102819:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  10281c:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102821:	05 00 04 00 00       	add    $0x400,%eax
  102826:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  10282b:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102832:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102834:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  10283b:	68 00 
  10283d:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102842:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102848:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  10284d:	c1 e8 10             	shr    $0x10,%eax
  102850:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102855:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10285c:	83 e0 f0             	and    $0xfffffff0,%eax
  10285f:	83 c8 09             	or     $0x9,%eax
  102862:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102867:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10286e:	83 c8 10             	or     $0x10,%eax
  102871:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102876:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10287d:	83 e0 9f             	and    $0xffffff9f,%eax
  102880:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102885:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  10288c:	83 c8 80             	or     $0xffffff80,%eax
  10288f:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102894:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  10289b:	83 e0 f0             	and    $0xfffffff0,%eax
  10289e:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028a3:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028aa:	83 e0 ef             	and    $0xffffffef,%eax
  1028ad:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028b2:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028b9:	83 e0 df             	and    $0xffffffdf,%eax
  1028bc:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028c1:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028c8:	83 c8 40             	or     $0x40,%eax
  1028cb:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028d0:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  1028d7:	83 e0 7f             	and    $0x7f,%eax
  1028da:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  1028df:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  1028e4:	c1 e8 18             	shr    $0x18,%eax
  1028e7:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  1028ec:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  1028f3:	83 e0 ef             	and    $0xffffffef,%eax
  1028f6:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  1028fb:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102902:	e8 da fe ff ff       	call   1027e1 <lgdt>
  102907:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  10290d:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102911:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102914:	c9                   	leave  
  102915:	c3                   	ret    

00102916 <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102916:	55                   	push   %ebp
  102917:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102919:	e8 f8 fe ff ff       	call   102816 <gdt_init>
}
  10291e:	5d                   	pop    %ebp
  10291f:	c3                   	ret    

00102920 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102920:	55                   	push   %ebp
  102921:	89 e5                	mov    %esp,%ebp
  102923:	83 ec 58             	sub    $0x58,%esp
  102926:	8b 45 10             	mov    0x10(%ebp),%eax
  102929:	89 45 d0             	mov    %eax,-0x30(%ebp)
  10292c:	8b 45 14             	mov    0x14(%ebp),%eax
  10292f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102932:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102935:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102938:	89 45 e8             	mov    %eax,-0x18(%ebp)
  10293b:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  10293e:	8b 45 18             	mov    0x18(%ebp),%eax
  102941:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102944:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102947:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10294a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10294d:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102950:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102953:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102956:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10295a:	74 1c                	je     102978 <printnum+0x58>
  10295c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10295f:	ba 00 00 00 00       	mov    $0x0,%edx
  102964:	f7 75 e4             	divl   -0x1c(%ebp)
  102967:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10296a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10296d:	ba 00 00 00 00       	mov    $0x0,%edx
  102972:	f7 75 e4             	divl   -0x1c(%ebp)
  102975:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102978:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10297b:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10297e:	f7 75 e4             	divl   -0x1c(%ebp)
  102981:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102984:	89 55 dc             	mov    %edx,-0x24(%ebp)
  102987:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10298a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10298d:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102990:	89 55 ec             	mov    %edx,-0x14(%ebp)
  102993:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102996:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  102999:	8b 45 18             	mov    0x18(%ebp),%eax
  10299c:	ba 00 00 00 00       	mov    $0x0,%edx
  1029a1:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1029a4:	77 56                	ja     1029fc <printnum+0xdc>
  1029a6:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  1029a9:	72 05                	jb     1029b0 <printnum+0x90>
  1029ab:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  1029ae:	77 4c                	ja     1029fc <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  1029b0:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1029b3:	8d 50 ff             	lea    -0x1(%eax),%edx
  1029b6:	8b 45 20             	mov    0x20(%ebp),%eax
  1029b9:	89 44 24 18          	mov    %eax,0x18(%esp)
  1029bd:	89 54 24 14          	mov    %edx,0x14(%esp)
  1029c1:	8b 45 18             	mov    0x18(%ebp),%eax
  1029c4:	89 44 24 10          	mov    %eax,0x10(%esp)
  1029c8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1029cb:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1029ce:	89 44 24 08          	mov    %eax,0x8(%esp)
  1029d2:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1029d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029d9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1029dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1029e0:	89 04 24             	mov    %eax,(%esp)
  1029e3:	e8 38 ff ff ff       	call   102920 <printnum>
  1029e8:	eb 1c                	jmp    102a06 <printnum+0xe6>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1029ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  1029ed:	89 44 24 04          	mov    %eax,0x4(%esp)
  1029f1:	8b 45 20             	mov    0x20(%ebp),%eax
  1029f4:	89 04 24             	mov    %eax,(%esp)
  1029f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1029fa:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  1029fc:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  102a00:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  102a04:	7f e4                	jg     1029ea <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  102a06:	8b 45 d8             	mov    -0x28(%ebp),%eax
  102a09:	05 f0 3b 10 00       	add    $0x103bf0,%eax
  102a0e:	0f b6 00             	movzbl (%eax),%eax
  102a11:	0f be c0             	movsbl %al,%eax
  102a14:	8b 55 0c             	mov    0xc(%ebp),%edx
  102a17:	89 54 24 04          	mov    %edx,0x4(%esp)
  102a1b:	89 04 24             	mov    %eax,(%esp)
  102a1e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a21:	ff d0                	call   *%eax
}
  102a23:	c9                   	leave  
  102a24:	c3                   	ret    

00102a25 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  102a25:	55                   	push   %ebp
  102a26:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a28:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a2c:	7e 14                	jle    102a42 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  102a2e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a31:	8b 00                	mov    (%eax),%eax
  102a33:	8d 48 08             	lea    0x8(%eax),%ecx
  102a36:	8b 55 08             	mov    0x8(%ebp),%edx
  102a39:	89 0a                	mov    %ecx,(%edx)
  102a3b:	8b 50 04             	mov    0x4(%eax),%edx
  102a3e:	8b 00                	mov    (%eax),%eax
  102a40:	eb 30                	jmp    102a72 <getuint+0x4d>
    }
    else if (lflag) {
  102a42:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a46:	74 16                	je     102a5e <getuint+0x39>
        return va_arg(*ap, unsigned long);
  102a48:	8b 45 08             	mov    0x8(%ebp),%eax
  102a4b:	8b 00                	mov    (%eax),%eax
  102a4d:	8d 48 04             	lea    0x4(%eax),%ecx
  102a50:	8b 55 08             	mov    0x8(%ebp),%edx
  102a53:	89 0a                	mov    %ecx,(%edx)
  102a55:	8b 00                	mov    (%eax),%eax
  102a57:	ba 00 00 00 00       	mov    $0x0,%edx
  102a5c:	eb 14                	jmp    102a72 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  102a5e:	8b 45 08             	mov    0x8(%ebp),%eax
  102a61:	8b 00                	mov    (%eax),%eax
  102a63:	8d 48 04             	lea    0x4(%eax),%ecx
  102a66:	8b 55 08             	mov    0x8(%ebp),%edx
  102a69:	89 0a                	mov    %ecx,(%edx)
  102a6b:	8b 00                	mov    (%eax),%eax
  102a6d:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  102a72:	5d                   	pop    %ebp
  102a73:	c3                   	ret    

00102a74 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  102a74:	55                   	push   %ebp
  102a75:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  102a77:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  102a7b:	7e 14                	jle    102a91 <getint+0x1d>
        return va_arg(*ap, long long);
  102a7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102a80:	8b 00                	mov    (%eax),%eax
  102a82:	8d 48 08             	lea    0x8(%eax),%ecx
  102a85:	8b 55 08             	mov    0x8(%ebp),%edx
  102a88:	89 0a                	mov    %ecx,(%edx)
  102a8a:	8b 50 04             	mov    0x4(%eax),%edx
  102a8d:	8b 00                	mov    (%eax),%eax
  102a8f:	eb 28                	jmp    102ab9 <getint+0x45>
    }
    else if (lflag) {
  102a91:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102a95:	74 12                	je     102aa9 <getint+0x35>
        return va_arg(*ap, long);
  102a97:	8b 45 08             	mov    0x8(%ebp),%eax
  102a9a:	8b 00                	mov    (%eax),%eax
  102a9c:	8d 48 04             	lea    0x4(%eax),%ecx
  102a9f:	8b 55 08             	mov    0x8(%ebp),%edx
  102aa2:	89 0a                	mov    %ecx,(%edx)
  102aa4:	8b 00                	mov    (%eax),%eax
  102aa6:	99                   	cltd   
  102aa7:	eb 10                	jmp    102ab9 <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  102aa9:	8b 45 08             	mov    0x8(%ebp),%eax
  102aac:	8b 00                	mov    (%eax),%eax
  102aae:	8d 48 04             	lea    0x4(%eax),%ecx
  102ab1:	8b 55 08             	mov    0x8(%ebp),%edx
  102ab4:	89 0a                	mov    %ecx,(%edx)
  102ab6:	8b 00                	mov    (%eax),%eax
  102ab8:	99                   	cltd   
    }
}
  102ab9:	5d                   	pop    %ebp
  102aba:	c3                   	ret    

00102abb <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  102abb:	55                   	push   %ebp
  102abc:	89 e5                	mov    %esp,%ebp
  102abe:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  102ac1:	8d 45 14             	lea    0x14(%ebp),%eax
  102ac4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  102ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102aca:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102ace:	8b 45 10             	mov    0x10(%ebp),%eax
  102ad1:	89 44 24 08          	mov    %eax,0x8(%esp)
  102ad5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ad8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102adc:	8b 45 08             	mov    0x8(%ebp),%eax
  102adf:	89 04 24             	mov    %eax,(%esp)
  102ae2:	e8 02 00 00 00       	call   102ae9 <vprintfmt>
    va_end(ap);
}
  102ae7:	c9                   	leave  
  102ae8:	c3                   	ret    

00102ae9 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  102ae9:	55                   	push   %ebp
  102aea:	89 e5                	mov    %esp,%ebp
  102aec:	56                   	push   %esi
  102aed:	53                   	push   %ebx
  102aee:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102af1:	eb 18                	jmp    102b0b <vprintfmt+0x22>
            if (ch == '\0') {
  102af3:	85 db                	test   %ebx,%ebx
  102af5:	75 05                	jne    102afc <vprintfmt+0x13>
                return;
  102af7:	e9 d1 03 00 00       	jmp    102ecd <vprintfmt+0x3e4>
            }
            putch(ch, putdat);
  102afc:	8b 45 0c             	mov    0xc(%ebp),%eax
  102aff:	89 44 24 04          	mov    %eax,0x4(%esp)
  102b03:	89 1c 24             	mov    %ebx,(%esp)
  102b06:	8b 45 08             	mov    0x8(%ebp),%eax
  102b09:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102b0b:	8b 45 10             	mov    0x10(%ebp),%eax
  102b0e:	8d 50 01             	lea    0x1(%eax),%edx
  102b11:	89 55 10             	mov    %edx,0x10(%ebp)
  102b14:	0f b6 00             	movzbl (%eax),%eax
  102b17:	0f b6 d8             	movzbl %al,%ebx
  102b1a:	83 fb 25             	cmp    $0x25,%ebx
  102b1d:	75 d4                	jne    102af3 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  102b1f:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  102b23:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  102b2a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102b2d:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  102b30:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  102b37:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102b3a:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  102b3d:	8b 45 10             	mov    0x10(%ebp),%eax
  102b40:	8d 50 01             	lea    0x1(%eax),%edx
  102b43:	89 55 10             	mov    %edx,0x10(%ebp)
  102b46:	0f b6 00             	movzbl (%eax),%eax
  102b49:	0f b6 d8             	movzbl %al,%ebx
  102b4c:	8d 43 dd             	lea    -0x23(%ebx),%eax
  102b4f:	83 f8 55             	cmp    $0x55,%eax
  102b52:	0f 87 44 03 00 00    	ja     102e9c <vprintfmt+0x3b3>
  102b58:	8b 04 85 14 3c 10 00 	mov    0x103c14(,%eax,4),%eax
  102b5f:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  102b61:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  102b65:	eb d6                	jmp    102b3d <vprintfmt+0x54>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  102b67:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  102b6b:	eb d0                	jmp    102b3d <vprintfmt+0x54>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b6d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  102b74:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102b77:	89 d0                	mov    %edx,%eax
  102b79:	c1 e0 02             	shl    $0x2,%eax
  102b7c:	01 d0                	add    %edx,%eax
  102b7e:	01 c0                	add    %eax,%eax
  102b80:	01 d8                	add    %ebx,%eax
  102b82:	83 e8 30             	sub    $0x30,%eax
  102b85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  102b88:	8b 45 10             	mov    0x10(%ebp),%eax
  102b8b:	0f b6 00             	movzbl (%eax),%eax
  102b8e:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  102b91:	83 fb 2f             	cmp    $0x2f,%ebx
  102b94:	7e 0b                	jle    102ba1 <vprintfmt+0xb8>
  102b96:	83 fb 39             	cmp    $0x39,%ebx
  102b99:	7f 06                	jg     102ba1 <vprintfmt+0xb8>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  102b9b:	83 45 10 01          	addl   $0x1,0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  102b9f:	eb d3                	jmp    102b74 <vprintfmt+0x8b>
            goto process_precision;
  102ba1:	eb 33                	jmp    102bd6 <vprintfmt+0xed>

        case '*':
            precision = va_arg(ap, int);
  102ba3:	8b 45 14             	mov    0x14(%ebp),%eax
  102ba6:	8d 50 04             	lea    0x4(%eax),%edx
  102ba9:	89 55 14             	mov    %edx,0x14(%ebp)
  102bac:	8b 00                	mov    (%eax),%eax
  102bae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  102bb1:	eb 23                	jmp    102bd6 <vprintfmt+0xed>

        case '.':
            if (width < 0)
  102bb3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bb7:	79 0c                	jns    102bc5 <vprintfmt+0xdc>
                width = 0;
  102bb9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  102bc0:	e9 78 ff ff ff       	jmp    102b3d <vprintfmt+0x54>
  102bc5:	e9 73 ff ff ff       	jmp    102b3d <vprintfmt+0x54>

        case '#':
            altflag = 1;
  102bca:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  102bd1:	e9 67 ff ff ff       	jmp    102b3d <vprintfmt+0x54>

        process_precision:
            if (width < 0)
  102bd6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102bda:	79 12                	jns    102bee <vprintfmt+0x105>
                width = precision, precision = -1;
  102bdc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102bdf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102be2:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  102be9:	e9 4f ff ff ff       	jmp    102b3d <vprintfmt+0x54>
  102bee:	e9 4a ff ff ff       	jmp    102b3d <vprintfmt+0x54>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  102bf3:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
            goto reswitch;
  102bf7:	e9 41 ff ff ff       	jmp    102b3d <vprintfmt+0x54>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  102bfc:	8b 45 14             	mov    0x14(%ebp),%eax
  102bff:	8d 50 04             	lea    0x4(%eax),%edx
  102c02:	89 55 14             	mov    %edx,0x14(%ebp)
  102c05:	8b 00                	mov    (%eax),%eax
  102c07:	8b 55 0c             	mov    0xc(%ebp),%edx
  102c0a:	89 54 24 04          	mov    %edx,0x4(%esp)
  102c0e:	89 04 24             	mov    %eax,(%esp)
  102c11:	8b 45 08             	mov    0x8(%ebp),%eax
  102c14:	ff d0                	call   *%eax
            break;
  102c16:	e9 ac 02 00 00       	jmp    102ec7 <vprintfmt+0x3de>

        // error message
        case 'e':
            err = va_arg(ap, int);
  102c1b:	8b 45 14             	mov    0x14(%ebp),%eax
  102c1e:	8d 50 04             	lea    0x4(%eax),%edx
  102c21:	89 55 14             	mov    %edx,0x14(%ebp)
  102c24:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  102c26:	85 db                	test   %ebx,%ebx
  102c28:	79 02                	jns    102c2c <vprintfmt+0x143>
                err = -err;
  102c2a:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  102c2c:	83 fb 06             	cmp    $0x6,%ebx
  102c2f:	7f 0b                	jg     102c3c <vprintfmt+0x153>
  102c31:	8b 34 9d d4 3b 10 00 	mov    0x103bd4(,%ebx,4),%esi
  102c38:	85 f6                	test   %esi,%esi
  102c3a:	75 23                	jne    102c5f <vprintfmt+0x176>
                printfmt(putch, putdat, "error %d", err);
  102c3c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  102c40:	c7 44 24 08 01 3c 10 	movl   $0x103c01,0x8(%esp)
  102c47:	00 
  102c48:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c4b:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c52:	89 04 24             	mov    %eax,(%esp)
  102c55:	e8 61 fe ff ff       	call   102abb <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  102c5a:	e9 68 02 00 00       	jmp    102ec7 <vprintfmt+0x3de>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  102c5f:	89 74 24 0c          	mov    %esi,0xc(%esp)
  102c63:	c7 44 24 08 0a 3c 10 	movl   $0x103c0a,0x8(%esp)
  102c6a:	00 
  102c6b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c6e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102c72:	8b 45 08             	mov    0x8(%ebp),%eax
  102c75:	89 04 24             	mov    %eax,(%esp)
  102c78:	e8 3e fe ff ff       	call   102abb <printfmt>
            }
            break;
  102c7d:	e9 45 02 00 00       	jmp    102ec7 <vprintfmt+0x3de>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  102c82:	8b 45 14             	mov    0x14(%ebp),%eax
  102c85:	8d 50 04             	lea    0x4(%eax),%edx
  102c88:	89 55 14             	mov    %edx,0x14(%ebp)
  102c8b:	8b 30                	mov    (%eax),%esi
  102c8d:	85 f6                	test   %esi,%esi
  102c8f:	75 05                	jne    102c96 <vprintfmt+0x1ad>
                p = "(null)";
  102c91:	be 0d 3c 10 00       	mov    $0x103c0d,%esi
            }
            if (width > 0 && padc != '-') {
  102c96:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102c9a:	7e 3e                	jle    102cda <vprintfmt+0x1f1>
  102c9c:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  102ca0:	74 38                	je     102cda <vprintfmt+0x1f1>
                for (width -= strnlen(p, precision); width > 0; width --) {
  102ca2:	8b 5d e8             	mov    -0x18(%ebp),%ebx
  102ca5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  102ca8:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cac:	89 34 24             	mov    %esi,(%esp)
  102caf:	e8 15 03 00 00       	call   102fc9 <strnlen>
  102cb4:	29 c3                	sub    %eax,%ebx
  102cb6:	89 d8                	mov    %ebx,%eax
  102cb8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102cbb:	eb 17                	jmp    102cd4 <vprintfmt+0x1eb>
                    putch(padc, putdat);
  102cbd:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  102cc1:	8b 55 0c             	mov    0xc(%ebp),%edx
  102cc4:	89 54 24 04          	mov    %edx,0x4(%esp)
  102cc8:	89 04 24             	mov    %eax,(%esp)
  102ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  102cce:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  102cd0:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102cd4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102cd8:	7f e3                	jg     102cbd <vprintfmt+0x1d4>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102cda:	eb 38                	jmp    102d14 <vprintfmt+0x22b>
                if (altflag && (ch < ' ' || ch > '~')) {
  102cdc:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  102ce0:	74 1f                	je     102d01 <vprintfmt+0x218>
  102ce2:	83 fb 1f             	cmp    $0x1f,%ebx
  102ce5:	7e 05                	jle    102cec <vprintfmt+0x203>
  102ce7:	83 fb 7e             	cmp    $0x7e,%ebx
  102cea:	7e 15                	jle    102d01 <vprintfmt+0x218>
                    putch('?', putdat);
  102cec:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cef:	89 44 24 04          	mov    %eax,0x4(%esp)
  102cf3:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  102cfa:	8b 45 08             	mov    0x8(%ebp),%eax
  102cfd:	ff d0                	call   *%eax
  102cff:	eb 0f                	jmp    102d10 <vprintfmt+0x227>
                }
                else {
                    putch(ch, putdat);
  102d01:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d04:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d08:	89 1c 24             	mov    %ebx,(%esp)
  102d0b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d0e:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  102d10:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d14:	89 f0                	mov    %esi,%eax
  102d16:	8d 70 01             	lea    0x1(%eax),%esi
  102d19:	0f b6 00             	movzbl (%eax),%eax
  102d1c:	0f be d8             	movsbl %al,%ebx
  102d1f:	85 db                	test   %ebx,%ebx
  102d21:	74 10                	je     102d33 <vprintfmt+0x24a>
  102d23:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d27:	78 b3                	js     102cdc <vprintfmt+0x1f3>
  102d29:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
  102d2d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  102d31:	79 a9                	jns    102cdc <vprintfmt+0x1f3>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102d33:	eb 17                	jmp    102d4c <vprintfmt+0x263>
                putch(' ', putdat);
  102d35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d38:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d3c:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  102d43:	8b 45 08             	mov    0x8(%ebp),%eax
  102d46:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  102d48:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
  102d4c:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  102d50:	7f e3                	jg     102d35 <vprintfmt+0x24c>
                putch(' ', putdat);
            }
            break;
  102d52:	e9 70 01 00 00       	jmp    102ec7 <vprintfmt+0x3de>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  102d57:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102d5a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d5e:	8d 45 14             	lea    0x14(%ebp),%eax
  102d61:	89 04 24             	mov    %eax,(%esp)
  102d64:	e8 0b fd ff ff       	call   102a74 <getint>
  102d69:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d6c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  102d6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d72:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d75:	85 d2                	test   %edx,%edx
  102d77:	79 26                	jns    102d9f <vprintfmt+0x2b6>
                putch('-', putdat);
  102d79:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d7c:	89 44 24 04          	mov    %eax,0x4(%esp)
  102d80:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  102d87:	8b 45 08             	mov    0x8(%ebp),%eax
  102d8a:	ff d0                	call   *%eax
                num = -(long long)num;
  102d8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d8f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d92:	f7 d8                	neg    %eax
  102d94:	83 d2 00             	adc    $0x0,%edx
  102d97:	f7 da                	neg    %edx
  102d99:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102d9c:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  102d9f:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102da6:	e9 a8 00 00 00       	jmp    102e53 <vprintfmt+0x36a>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  102dab:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dae:	89 44 24 04          	mov    %eax,0x4(%esp)
  102db2:	8d 45 14             	lea    0x14(%ebp),%eax
  102db5:	89 04 24             	mov    %eax,(%esp)
  102db8:	e8 68 fc ff ff       	call   102a25 <getuint>
  102dbd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102dc0:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  102dc3:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  102dca:	e9 84 00 00 00       	jmp    102e53 <vprintfmt+0x36a>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  102dcf:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102dd2:	89 44 24 04          	mov    %eax,0x4(%esp)
  102dd6:	8d 45 14             	lea    0x14(%ebp),%eax
  102dd9:	89 04 24             	mov    %eax,(%esp)
  102ddc:	e8 44 fc ff ff       	call   102a25 <getuint>
  102de1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102de4:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  102de7:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  102dee:	eb 63                	jmp    102e53 <vprintfmt+0x36a>

        // pointer
        case 'p':
            putch('0', putdat);
  102df0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102df3:	89 44 24 04          	mov    %eax,0x4(%esp)
  102df7:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  102dfe:	8b 45 08             	mov    0x8(%ebp),%eax
  102e01:	ff d0                	call   *%eax
            putch('x', putdat);
  102e03:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e06:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e0a:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  102e11:	8b 45 08             	mov    0x8(%ebp),%eax
  102e14:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  102e16:	8b 45 14             	mov    0x14(%ebp),%eax
  102e19:	8d 50 04             	lea    0x4(%eax),%edx
  102e1c:	89 55 14             	mov    %edx,0x14(%ebp)
  102e1f:	8b 00                	mov    (%eax),%eax
  102e21:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  102e2b:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  102e32:	eb 1f                	jmp    102e53 <vprintfmt+0x36a>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  102e34:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e37:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e3b:	8d 45 14             	lea    0x14(%ebp),%eax
  102e3e:	89 04 24             	mov    %eax,(%esp)
  102e41:	e8 df fb ff ff       	call   102a25 <getuint>
  102e46:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e49:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  102e4c:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  102e53:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  102e57:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e5a:	89 54 24 18          	mov    %edx,0x18(%esp)
  102e5e:	8b 55 e8             	mov    -0x18(%ebp),%edx
  102e61:	89 54 24 14          	mov    %edx,0x14(%esp)
  102e65:	89 44 24 10          	mov    %eax,0x10(%esp)
  102e69:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e6c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102e6f:	89 44 24 08          	mov    %eax,0x8(%esp)
  102e73:	89 54 24 0c          	mov    %edx,0xc(%esp)
  102e77:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e7a:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e7e:	8b 45 08             	mov    0x8(%ebp),%eax
  102e81:	89 04 24             	mov    %eax,(%esp)
  102e84:	e8 97 fa ff ff       	call   102920 <printnum>
            break;
  102e89:	eb 3c                	jmp    102ec7 <vprintfmt+0x3de>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  102e8b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e8e:	89 44 24 04          	mov    %eax,0x4(%esp)
  102e92:	89 1c 24             	mov    %ebx,(%esp)
  102e95:	8b 45 08             	mov    0x8(%ebp),%eax
  102e98:	ff d0                	call   *%eax
            break;
  102e9a:	eb 2b                	jmp    102ec7 <vprintfmt+0x3de>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  102e9c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e9f:	89 44 24 04          	mov    %eax,0x4(%esp)
  102ea3:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  102eaa:	8b 45 08             	mov    0x8(%ebp),%eax
  102ead:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  102eaf:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102eb3:	eb 04                	jmp    102eb9 <vprintfmt+0x3d0>
  102eb5:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102eb9:	8b 45 10             	mov    0x10(%ebp),%eax
  102ebc:	83 e8 01             	sub    $0x1,%eax
  102ebf:	0f b6 00             	movzbl (%eax),%eax
  102ec2:	3c 25                	cmp    $0x25,%al
  102ec4:	75 ef                	jne    102eb5 <vprintfmt+0x3cc>
                /* do nothing */;
            break;
  102ec6:	90                   	nop
        }
    }
  102ec7:	90                   	nop
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  102ec8:	e9 3e fc ff ff       	jmp    102b0b <vprintfmt+0x22>
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  102ecd:	83 c4 40             	add    $0x40,%esp
  102ed0:	5b                   	pop    %ebx
  102ed1:	5e                   	pop    %esi
  102ed2:	5d                   	pop    %ebp
  102ed3:	c3                   	ret    

00102ed4 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  102ed4:	55                   	push   %ebp
  102ed5:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  102ed7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eda:	8b 40 08             	mov    0x8(%eax),%eax
  102edd:	8d 50 01             	lea    0x1(%eax),%edx
  102ee0:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ee3:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  102ee6:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ee9:	8b 10                	mov    (%eax),%edx
  102eeb:	8b 45 0c             	mov    0xc(%ebp),%eax
  102eee:	8b 40 04             	mov    0x4(%eax),%eax
  102ef1:	39 c2                	cmp    %eax,%edx
  102ef3:	73 12                	jae    102f07 <sprintputch+0x33>
        *b->buf ++ = ch;
  102ef5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ef8:	8b 00                	mov    (%eax),%eax
  102efa:	8d 48 01             	lea    0x1(%eax),%ecx
  102efd:	8b 55 0c             	mov    0xc(%ebp),%edx
  102f00:	89 0a                	mov    %ecx,(%edx)
  102f02:	8b 55 08             	mov    0x8(%ebp),%edx
  102f05:	88 10                	mov    %dl,(%eax)
    }
}
  102f07:	5d                   	pop    %ebp
  102f08:	c3                   	ret    

00102f09 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  102f09:	55                   	push   %ebp
  102f0a:	89 e5                	mov    %esp,%ebp
  102f0c:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  102f0f:	8d 45 14             	lea    0x14(%ebp),%eax
  102f12:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  102f15:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f18:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f1c:	8b 45 10             	mov    0x10(%ebp),%eax
  102f1f:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f23:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f26:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2d:	89 04 24             	mov    %eax,(%esp)
  102f30:	e8 08 00 00 00       	call   102f3d <vsnprintf>
  102f35:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  102f38:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f3b:	c9                   	leave  
  102f3c:	c3                   	ret    

00102f3d <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  102f3d:	55                   	push   %ebp
  102f3e:	89 e5                	mov    %esp,%ebp
  102f40:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  102f43:	8b 45 08             	mov    0x8(%ebp),%eax
  102f46:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102f49:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f4c:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f4f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f52:	01 d0                	add    %edx,%eax
  102f54:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f57:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  102f5e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  102f62:	74 0a                	je     102f6e <vsnprintf+0x31>
  102f64:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102f67:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f6a:	39 c2                	cmp    %eax,%edx
  102f6c:	76 07                	jbe    102f75 <vsnprintf+0x38>
        return -E_INVAL;
  102f6e:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  102f73:	eb 2a                	jmp    102f9f <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  102f75:	8b 45 14             	mov    0x14(%ebp),%eax
  102f78:	89 44 24 0c          	mov    %eax,0xc(%esp)
  102f7c:	8b 45 10             	mov    0x10(%ebp),%eax
  102f7f:	89 44 24 08          	mov    %eax,0x8(%esp)
  102f83:	8d 45 ec             	lea    -0x14(%ebp),%eax
  102f86:	89 44 24 04          	mov    %eax,0x4(%esp)
  102f8a:	c7 04 24 d4 2e 10 00 	movl   $0x102ed4,(%esp)
  102f91:	e8 53 fb ff ff       	call   102ae9 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  102f96:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f99:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  102f9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  102f9f:	c9                   	leave  
  102fa0:	c3                   	ret    

00102fa1 <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102fa1:	55                   	push   %ebp
  102fa2:	89 e5                	mov    %esp,%ebp
  102fa4:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102fa7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102fae:	eb 04                	jmp    102fb4 <strlen+0x13>
        cnt ++;
  102fb0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102fb4:	8b 45 08             	mov    0x8(%ebp),%eax
  102fb7:	8d 50 01             	lea    0x1(%eax),%edx
  102fba:	89 55 08             	mov    %edx,0x8(%ebp)
  102fbd:	0f b6 00             	movzbl (%eax),%eax
  102fc0:	84 c0                	test   %al,%al
  102fc2:	75 ec                	jne    102fb0 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102fc4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102fc7:	c9                   	leave  
  102fc8:	c3                   	ret    

00102fc9 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102fc9:	55                   	push   %ebp
  102fca:	89 e5                	mov    %esp,%ebp
  102fcc:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102fcf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102fd6:	eb 04                	jmp    102fdc <strnlen+0x13>
        cnt ++;
  102fd8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102fdc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102fdf:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102fe2:	73 10                	jae    102ff4 <strnlen+0x2b>
  102fe4:	8b 45 08             	mov    0x8(%ebp),%eax
  102fe7:	8d 50 01             	lea    0x1(%eax),%edx
  102fea:	89 55 08             	mov    %edx,0x8(%ebp)
  102fed:	0f b6 00             	movzbl (%eax),%eax
  102ff0:	84 c0                	test   %al,%al
  102ff2:	75 e4                	jne    102fd8 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102ff4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102ff7:	c9                   	leave  
  102ff8:	c3                   	ret    

00102ff9 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102ff9:	55                   	push   %ebp
  102ffa:	89 e5                	mov    %esp,%ebp
  102ffc:	57                   	push   %edi
  102ffd:	56                   	push   %esi
  102ffe:	83 ec 20             	sub    $0x20,%esp
  103001:	8b 45 08             	mov    0x8(%ebp),%eax
  103004:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103007:	8b 45 0c             	mov    0xc(%ebp),%eax
  10300a:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  10300d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103010:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103013:	89 d1                	mov    %edx,%ecx
  103015:	89 c2                	mov    %eax,%edx
  103017:	89 ce                	mov    %ecx,%esi
  103019:	89 d7                	mov    %edx,%edi
  10301b:	ac                   	lods   %ds:(%esi),%al
  10301c:	aa                   	stos   %al,%es:(%edi)
  10301d:	84 c0                	test   %al,%al
  10301f:	75 fa                	jne    10301b <strcpy+0x22>
  103021:	89 fa                	mov    %edi,%edx
  103023:	89 f1                	mov    %esi,%ecx
  103025:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103028:	89 55 e8             	mov    %edx,-0x18(%ebp)
  10302b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  10302e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  103031:	83 c4 20             	add    $0x20,%esp
  103034:	5e                   	pop    %esi
  103035:	5f                   	pop    %edi
  103036:	5d                   	pop    %ebp
  103037:	c3                   	ret    

00103038 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  103038:	55                   	push   %ebp
  103039:	89 e5                	mov    %esp,%ebp
  10303b:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  10303e:	8b 45 08             	mov    0x8(%ebp),%eax
  103041:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  103044:	eb 21                	jmp    103067 <strncpy+0x2f>
        if ((*p = *src) != '\0') {
  103046:	8b 45 0c             	mov    0xc(%ebp),%eax
  103049:	0f b6 10             	movzbl (%eax),%edx
  10304c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10304f:	88 10                	mov    %dl,(%eax)
  103051:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103054:	0f b6 00             	movzbl (%eax),%eax
  103057:	84 c0                	test   %al,%al
  103059:	74 04                	je     10305f <strncpy+0x27>
            src ++;
  10305b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
        }
        p ++, len --;
  10305f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103063:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  103067:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10306b:	75 d9                	jne    103046 <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  10306d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103070:	c9                   	leave  
  103071:	c3                   	ret    

00103072 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  103072:	55                   	push   %ebp
  103073:	89 e5                	mov    %esp,%ebp
  103075:	57                   	push   %edi
  103076:	56                   	push   %esi
  103077:	83 ec 20             	sub    $0x20,%esp
  10307a:	8b 45 08             	mov    0x8(%ebp),%eax
  10307d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103080:	8b 45 0c             	mov    0xc(%ebp),%eax
  103083:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  103086:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103089:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10308c:	89 d1                	mov    %edx,%ecx
  10308e:	89 c2                	mov    %eax,%edx
  103090:	89 ce                	mov    %ecx,%esi
  103092:	89 d7                	mov    %edx,%edi
  103094:	ac                   	lods   %ds:(%esi),%al
  103095:	ae                   	scas   %es:(%edi),%al
  103096:	75 08                	jne    1030a0 <strcmp+0x2e>
  103098:	84 c0                	test   %al,%al
  10309a:	75 f8                	jne    103094 <strcmp+0x22>
  10309c:	31 c0                	xor    %eax,%eax
  10309e:	eb 04                	jmp    1030a4 <strcmp+0x32>
  1030a0:	19 c0                	sbb    %eax,%eax
  1030a2:	0c 01                	or     $0x1,%al
  1030a4:	89 fa                	mov    %edi,%edx
  1030a6:	89 f1                	mov    %esi,%ecx
  1030a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1030ab:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1030ae:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  1030b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  1030b4:	83 c4 20             	add    $0x20,%esp
  1030b7:	5e                   	pop    %esi
  1030b8:	5f                   	pop    %edi
  1030b9:	5d                   	pop    %ebp
  1030ba:	c3                   	ret    

001030bb <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  1030bb:	55                   	push   %ebp
  1030bc:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1030be:	eb 0c                	jmp    1030cc <strncmp+0x11>
        n --, s1 ++, s2 ++;
  1030c0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  1030c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1030c8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  1030cc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030d0:	74 1a                	je     1030ec <strncmp+0x31>
  1030d2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030d5:	0f b6 00             	movzbl (%eax),%eax
  1030d8:	84 c0                	test   %al,%al
  1030da:	74 10                	je     1030ec <strncmp+0x31>
  1030dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1030df:	0f b6 10             	movzbl (%eax),%edx
  1030e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030e5:	0f b6 00             	movzbl (%eax),%eax
  1030e8:	38 c2                	cmp    %al,%dl
  1030ea:	74 d4                	je     1030c0 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  1030ec:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1030f0:	74 18                	je     10310a <strncmp+0x4f>
  1030f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1030f5:	0f b6 00             	movzbl (%eax),%eax
  1030f8:	0f b6 d0             	movzbl %al,%edx
  1030fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030fe:	0f b6 00             	movzbl (%eax),%eax
  103101:	0f b6 c0             	movzbl %al,%eax
  103104:	29 c2                	sub    %eax,%edx
  103106:	89 d0                	mov    %edx,%eax
  103108:	eb 05                	jmp    10310f <strncmp+0x54>
  10310a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10310f:	5d                   	pop    %ebp
  103110:	c3                   	ret    

00103111 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  103111:	55                   	push   %ebp
  103112:	89 e5                	mov    %esp,%ebp
  103114:	83 ec 04             	sub    $0x4,%esp
  103117:	8b 45 0c             	mov    0xc(%ebp),%eax
  10311a:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  10311d:	eb 14                	jmp    103133 <strchr+0x22>
        if (*s == c) {
  10311f:	8b 45 08             	mov    0x8(%ebp),%eax
  103122:	0f b6 00             	movzbl (%eax),%eax
  103125:	3a 45 fc             	cmp    -0x4(%ebp),%al
  103128:	75 05                	jne    10312f <strchr+0x1e>
            return (char *)s;
  10312a:	8b 45 08             	mov    0x8(%ebp),%eax
  10312d:	eb 13                	jmp    103142 <strchr+0x31>
        }
        s ++;
  10312f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  103133:	8b 45 08             	mov    0x8(%ebp),%eax
  103136:	0f b6 00             	movzbl (%eax),%eax
  103139:	84 c0                	test   %al,%al
  10313b:	75 e2                	jne    10311f <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  10313d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103142:	c9                   	leave  
  103143:	c3                   	ret    

00103144 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  103144:	55                   	push   %ebp
  103145:	89 e5                	mov    %esp,%ebp
  103147:	83 ec 04             	sub    $0x4,%esp
  10314a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10314d:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  103150:	eb 11                	jmp    103163 <strfind+0x1f>
        if (*s == c) {
  103152:	8b 45 08             	mov    0x8(%ebp),%eax
  103155:	0f b6 00             	movzbl (%eax),%eax
  103158:	3a 45 fc             	cmp    -0x4(%ebp),%al
  10315b:	75 02                	jne    10315f <strfind+0x1b>
            break;
  10315d:	eb 0e                	jmp    10316d <strfind+0x29>
        }
        s ++;
  10315f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  103163:	8b 45 08             	mov    0x8(%ebp),%eax
  103166:	0f b6 00             	movzbl (%eax),%eax
  103169:	84 c0                	test   %al,%al
  10316b:	75 e5                	jne    103152 <strfind+0xe>
        if (*s == c) {
            break;
        }
        s ++;
    }
    return (char *)s;
  10316d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  103170:	c9                   	leave  
  103171:	c3                   	ret    

00103172 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  103172:	55                   	push   %ebp
  103173:	89 e5                	mov    %esp,%ebp
  103175:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  103178:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  10317f:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  103186:	eb 04                	jmp    10318c <strtol+0x1a>
        s ++;
  103188:	83 45 08 01          	addl   $0x1,0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  10318c:	8b 45 08             	mov    0x8(%ebp),%eax
  10318f:	0f b6 00             	movzbl (%eax),%eax
  103192:	3c 20                	cmp    $0x20,%al
  103194:	74 f2                	je     103188 <strtol+0x16>
  103196:	8b 45 08             	mov    0x8(%ebp),%eax
  103199:	0f b6 00             	movzbl (%eax),%eax
  10319c:	3c 09                	cmp    $0x9,%al
  10319e:	74 e8                	je     103188 <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  1031a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1031a3:	0f b6 00             	movzbl (%eax),%eax
  1031a6:	3c 2b                	cmp    $0x2b,%al
  1031a8:	75 06                	jne    1031b0 <strtol+0x3e>
        s ++;
  1031aa:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031ae:	eb 15                	jmp    1031c5 <strtol+0x53>
    }
    else if (*s == '-') {
  1031b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1031b3:	0f b6 00             	movzbl (%eax),%eax
  1031b6:	3c 2d                	cmp    $0x2d,%al
  1031b8:	75 0b                	jne    1031c5 <strtol+0x53>
        s ++, neg = 1;
  1031ba:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1031be:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  1031c5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031c9:	74 06                	je     1031d1 <strtol+0x5f>
  1031cb:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  1031cf:	75 24                	jne    1031f5 <strtol+0x83>
  1031d1:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d4:	0f b6 00             	movzbl (%eax),%eax
  1031d7:	3c 30                	cmp    $0x30,%al
  1031d9:	75 1a                	jne    1031f5 <strtol+0x83>
  1031db:	8b 45 08             	mov    0x8(%ebp),%eax
  1031de:	83 c0 01             	add    $0x1,%eax
  1031e1:	0f b6 00             	movzbl (%eax),%eax
  1031e4:	3c 78                	cmp    $0x78,%al
  1031e6:	75 0d                	jne    1031f5 <strtol+0x83>
        s += 2, base = 16;
  1031e8:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1031ec:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1031f3:	eb 2a                	jmp    10321f <strtol+0xad>
    }
    else if (base == 0 && s[0] == '0') {
  1031f5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1031f9:	75 17                	jne    103212 <strtol+0xa0>
  1031fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1031fe:	0f b6 00             	movzbl (%eax),%eax
  103201:	3c 30                	cmp    $0x30,%al
  103203:	75 0d                	jne    103212 <strtol+0xa0>
        s ++, base = 8;
  103205:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103209:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  103210:	eb 0d                	jmp    10321f <strtol+0xad>
    }
    else if (base == 0) {
  103212:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103216:	75 07                	jne    10321f <strtol+0xad>
        base = 10;
  103218:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  10321f:	8b 45 08             	mov    0x8(%ebp),%eax
  103222:	0f b6 00             	movzbl (%eax),%eax
  103225:	3c 2f                	cmp    $0x2f,%al
  103227:	7e 1b                	jle    103244 <strtol+0xd2>
  103229:	8b 45 08             	mov    0x8(%ebp),%eax
  10322c:	0f b6 00             	movzbl (%eax),%eax
  10322f:	3c 39                	cmp    $0x39,%al
  103231:	7f 11                	jg     103244 <strtol+0xd2>
            dig = *s - '0';
  103233:	8b 45 08             	mov    0x8(%ebp),%eax
  103236:	0f b6 00             	movzbl (%eax),%eax
  103239:	0f be c0             	movsbl %al,%eax
  10323c:	83 e8 30             	sub    $0x30,%eax
  10323f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103242:	eb 48                	jmp    10328c <strtol+0x11a>
        }
        else if (*s >= 'a' && *s <= 'z') {
  103244:	8b 45 08             	mov    0x8(%ebp),%eax
  103247:	0f b6 00             	movzbl (%eax),%eax
  10324a:	3c 60                	cmp    $0x60,%al
  10324c:	7e 1b                	jle    103269 <strtol+0xf7>
  10324e:	8b 45 08             	mov    0x8(%ebp),%eax
  103251:	0f b6 00             	movzbl (%eax),%eax
  103254:	3c 7a                	cmp    $0x7a,%al
  103256:	7f 11                	jg     103269 <strtol+0xf7>
            dig = *s - 'a' + 10;
  103258:	8b 45 08             	mov    0x8(%ebp),%eax
  10325b:	0f b6 00             	movzbl (%eax),%eax
  10325e:	0f be c0             	movsbl %al,%eax
  103261:	83 e8 57             	sub    $0x57,%eax
  103264:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103267:	eb 23                	jmp    10328c <strtol+0x11a>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  103269:	8b 45 08             	mov    0x8(%ebp),%eax
  10326c:	0f b6 00             	movzbl (%eax),%eax
  10326f:	3c 40                	cmp    $0x40,%al
  103271:	7e 3d                	jle    1032b0 <strtol+0x13e>
  103273:	8b 45 08             	mov    0x8(%ebp),%eax
  103276:	0f b6 00             	movzbl (%eax),%eax
  103279:	3c 5a                	cmp    $0x5a,%al
  10327b:	7f 33                	jg     1032b0 <strtol+0x13e>
            dig = *s - 'A' + 10;
  10327d:	8b 45 08             	mov    0x8(%ebp),%eax
  103280:	0f b6 00             	movzbl (%eax),%eax
  103283:	0f be c0             	movsbl %al,%eax
  103286:	83 e8 37             	sub    $0x37,%eax
  103289:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  10328c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10328f:	3b 45 10             	cmp    0x10(%ebp),%eax
  103292:	7c 02                	jl     103296 <strtol+0x124>
            break;
  103294:	eb 1a                	jmp    1032b0 <strtol+0x13e>
        }
        s ++, val = (val * base) + dig;
  103296:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10329a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10329d:	0f af 45 10          	imul   0x10(%ebp),%eax
  1032a1:	89 c2                	mov    %eax,%edx
  1032a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032a6:	01 d0                	add    %edx,%eax
  1032a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  1032ab:	e9 6f ff ff ff       	jmp    10321f <strtol+0xad>

    if (endptr) {
  1032b0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1032b4:	74 08                	je     1032be <strtol+0x14c>
        *endptr = (char *) s;
  1032b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032b9:	8b 55 08             	mov    0x8(%ebp),%edx
  1032bc:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  1032be:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  1032c2:	74 07                	je     1032cb <strtol+0x159>
  1032c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1032c7:	f7 d8                	neg    %eax
  1032c9:	eb 03                	jmp    1032ce <strtol+0x15c>
  1032cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1032ce:	c9                   	leave  
  1032cf:	c3                   	ret    

001032d0 <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  1032d0:	55                   	push   %ebp
  1032d1:	89 e5                	mov    %esp,%ebp
  1032d3:	57                   	push   %edi
  1032d4:	83 ec 24             	sub    $0x24,%esp
  1032d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032da:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  1032dd:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  1032e1:	8b 55 08             	mov    0x8(%ebp),%edx
  1032e4:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1032e7:	88 45 f7             	mov    %al,-0x9(%ebp)
  1032ea:	8b 45 10             	mov    0x10(%ebp),%eax
  1032ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  1032f0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  1032f3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1032f7:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1032fa:	89 d7                	mov    %edx,%edi
  1032fc:	f3 aa                	rep stos %al,%es:(%edi)
  1032fe:	89 fa                	mov    %edi,%edx
  103300:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  103303:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  103306:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  103309:	83 c4 24             	add    $0x24,%esp
  10330c:	5f                   	pop    %edi
  10330d:	5d                   	pop    %ebp
  10330e:	c3                   	ret    

0010330f <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  10330f:	55                   	push   %ebp
  103310:	89 e5                	mov    %esp,%ebp
  103312:	57                   	push   %edi
  103313:	56                   	push   %esi
  103314:	53                   	push   %ebx
  103315:	83 ec 30             	sub    $0x30,%esp
  103318:	8b 45 08             	mov    0x8(%ebp),%eax
  10331b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10331e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103321:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103324:	8b 45 10             	mov    0x10(%ebp),%eax
  103327:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  10332a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10332d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  103330:	73 42                	jae    103374 <memmove+0x65>
  103332:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103335:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  103338:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10333b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10333e:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103341:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103344:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103347:	c1 e8 02             	shr    $0x2,%eax
  10334a:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  10334c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10334f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103352:	89 d7                	mov    %edx,%edi
  103354:	89 c6                	mov    %eax,%esi
  103356:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103358:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10335b:	83 e1 03             	and    $0x3,%ecx
  10335e:	74 02                	je     103362 <memmove+0x53>
  103360:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103362:	89 f0                	mov    %esi,%eax
  103364:	89 fa                	mov    %edi,%edx
  103366:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  103369:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  10336c:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  10336f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  103372:	eb 36                	jmp    1033aa <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103374:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103377:	8d 50 ff             	lea    -0x1(%eax),%edx
  10337a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10337d:	01 c2                	add    %eax,%edx
  10337f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103382:	8d 48 ff             	lea    -0x1(%eax),%ecx
  103385:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103388:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  10338b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10338e:	89 c1                	mov    %eax,%ecx
  103390:	89 d8                	mov    %ebx,%eax
  103392:	89 d6                	mov    %edx,%esi
  103394:	89 c7                	mov    %eax,%edi
  103396:	fd                   	std    
  103397:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103399:	fc                   	cld    
  10339a:	89 f8                	mov    %edi,%eax
  10339c:	89 f2                	mov    %esi,%edx
  10339e:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  1033a1:	89 55 c8             	mov    %edx,-0x38(%ebp)
  1033a4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  1033a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  1033aa:	83 c4 30             	add    $0x30,%esp
  1033ad:	5b                   	pop    %ebx
  1033ae:	5e                   	pop    %esi
  1033af:	5f                   	pop    %edi
  1033b0:	5d                   	pop    %ebp
  1033b1:	c3                   	ret    

001033b2 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  1033b2:	55                   	push   %ebp
  1033b3:	89 e5                	mov    %esp,%ebp
  1033b5:	57                   	push   %edi
  1033b6:	56                   	push   %esi
  1033b7:	83 ec 20             	sub    $0x20,%esp
  1033ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1033bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033c0:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033c6:	8b 45 10             	mov    0x10(%ebp),%eax
  1033c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  1033cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1033cf:	c1 e8 02             	shr    $0x2,%eax
  1033d2:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  1033d4:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033da:	89 d7                	mov    %edx,%edi
  1033dc:	89 c6                	mov    %eax,%esi
  1033de:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  1033e0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  1033e3:	83 e1 03             	and    $0x3,%ecx
  1033e6:	74 02                	je     1033ea <memcpy+0x38>
  1033e8:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1033ea:	89 f0                	mov    %esi,%eax
  1033ec:	89 fa                	mov    %edi,%edx
  1033ee:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1033f1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1033f4:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  1033f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1033fa:	83 c4 20             	add    $0x20,%esp
  1033fd:	5e                   	pop    %esi
  1033fe:	5f                   	pop    %edi
  1033ff:	5d                   	pop    %ebp
  103400:	c3                   	ret    

00103401 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  103401:	55                   	push   %ebp
  103402:	89 e5                	mov    %esp,%ebp
  103404:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  103407:	8b 45 08             	mov    0x8(%ebp),%eax
  10340a:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  10340d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103410:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  103413:	eb 30                	jmp    103445 <memcmp+0x44>
        if (*s1 != *s2) {
  103415:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103418:	0f b6 10             	movzbl (%eax),%edx
  10341b:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10341e:	0f b6 00             	movzbl (%eax),%eax
  103421:	38 c2                	cmp    %al,%dl
  103423:	74 18                	je     10343d <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  103425:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103428:	0f b6 00             	movzbl (%eax),%eax
  10342b:	0f b6 d0             	movzbl %al,%edx
  10342e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103431:	0f b6 00             	movzbl (%eax),%eax
  103434:	0f b6 c0             	movzbl %al,%eax
  103437:	29 c2                	sub    %eax,%edx
  103439:	89 d0                	mov    %edx,%eax
  10343b:	eb 1a                	jmp    103457 <memcmp+0x56>
        }
        s1 ++, s2 ++;
  10343d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103441:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  103445:	8b 45 10             	mov    0x10(%ebp),%eax
  103448:	8d 50 ff             	lea    -0x1(%eax),%edx
  10344b:	89 55 10             	mov    %edx,0x10(%ebp)
  10344e:	85 c0                	test   %eax,%eax
  103450:	75 c3                	jne    103415 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  103452:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103457:	c9                   	leave  
  103458:	c3                   	ret    
