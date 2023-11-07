
kernel.bin:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_start>:
    80200000:	00015117          	auipc	sp,0x15
    80200004:	00010113          	mv	sp,sp
    80200008:	004000ef          	jal	ra,8020000c <main>

000000008020000c <main>:
    8020000c:	7179                	addi	sp,sp,-48
    8020000e:	f406                	sd	ra,40(sp)
    80200010:	f022                	sd	s0,32(sp)
    80200012:	1800                	addi	s0,sp,48
    80200014:	fca43c23          	sd	a0,-40(s0)
    80200018:	fcb43823          	sd	a1,-48(s0)
    8020001c:	00003517          	auipc	a0,0x3
    80200020:	fe450513          	addi	a0,a0,-28 # 80203000 <rodata_start>
    80200024:	618020ef          	jal	ra,8020263c <kputs>
    80200028:	35f020ef          	jal	ra,80202b86 <print_system_infomation>
    8020002c:	00003517          	auipc	a0,0x3
    80200030:	ffc50513          	addi	a0,a0,-4 # 80203028 <rodata_start+0x28>
    80200034:	608020ef          	jal	ra,8020263c <kputs>
    80200038:	0dc010ef          	jal	ra,80201114 <set_stvec>
    8020003c:	0ae000ef          	jal	ra,802000ea <clock_init>
    80200040:	00003517          	auipc	a0,0x3
    80200044:	ff850513          	addi	a0,a0,-8 # 80203038 <rodata_start+0x38>
    80200048:	652020ef          	jal	ra,8020269a <kprintf>
    8020004c:	fd043503          	ld	a0,-48(s0)
    80200050:	469000ef          	jal	ra,80200cb8 <unflatten_device_tree>
    80200054:	55b000ef          	jal	ra,80200dae <plic_init>
    80200058:	00003517          	auipc	a0,0x3
    8020005c:	ff850513          	addi	a0,a0,-8 # 80203050 <rodata_start+0x50>
    80200060:	63a020ef          	jal	ra,8020269a <kprintf>
    80200064:	2ff010ef          	jal	ra,80201b62 <uart_init>
    80200068:	00003517          	auipc	a0,0x3
    8020006c:	00050513          	mv	a0,a0
    80200070:	62a020ef          	jal	ra,8020269a <kprintf>
    80200074:	0fd010ef          	jal	ra,80201970 <rtc_init>
    80200078:	141010ef          	jal	ra,802019b8 <read_time>
    8020007c:	87aa                	mv	a5,a0
    8020007e:	85be                	mv	a1,a5
    80200080:	00003517          	auipc	a0,0x3
    80200084:	00050513          	mv	a0,a0
    80200088:	612020ef          	jal	ra,8020269a <kprintf>
    8020008c:	12d010ef          	jal	ra,802019b8 <read_time>
    80200090:	872a                	mv	a4,a0
    80200092:	3b9ad7b7          	lui	a5,0x3b9ad
    80200096:	a0078793          	addi	a5,a5,-1536 # 3b9aca00 <XLENB+0x3b9ac9f8>
    8020009a:	97ba                	add	a5,a5,a4
    8020009c:	853e                	mv	a0,a5
    8020009e:	181010ef          	jal	ra,80201a1e <set_alarm>
    802000a2:	15d010ef          	jal	ra,802019fe <read_alarm>
    802000a6:	87aa                	mv	a5,a0
    802000a8:	85be                	mv	a1,a5
    802000aa:	00003517          	auipc	a0,0x3
    802000ae:	fee50513          	addi	a0,a0,-18 # 80203098 <rodata_start+0x98>
    802000b2:	5e8020ef          	jal	ra,8020269a <kprintf>
    802000b6:	100167f3          	csrrsi	a5,sstatus,2
    802000ba:	fef43423          	sd	a5,-24(s0)
    802000be:	9002                	ebreak
    802000c0:	00003517          	auipc	a0,0x3
    802000c4:	fe850513          	addi	a0,a0,-24 # 802030a8 <rodata_start+0xa8>
    802000c8:	574020ef          	jal	ra,8020263c <kputs>
    802000cc:	a001                	j	802000cc <main+0xc0>
	...

00000000802000d0 <get_cycles>:
    802000d0:	1101                	addi	sp,sp,-32 # 80214fe0 <boot_stack+0xffe0>
    802000d2:	ec22                	sd	s0,24(sp)
    802000d4:	1000                	addi	s0,sp,32
    802000d6:	c01027f3          	rdtime	a5
    802000da:	fef43423          	sd	a5,-24(s0)
    802000de:	fe843783          	ld	a5,-24(s0)
    802000e2:	853e                	mv	a0,a5
    802000e4:	6462                	ld	s0,24(sp)
    802000e6:	6105                	addi	sp,sp,32
    802000e8:	8082                	ret

00000000802000ea <clock_init>:
    802000ea:	1101                	addi	sp,sp,-32
    802000ec:	ec06                	sd	ra,24(sp)
    802000ee:	e822                	sd	s0,16(sp)
    802000f0:	1000                	addi	s0,sp,32
    802000f2:	00015797          	auipc	a5,0x15
    802000f6:	f1678793          	addi	a5,a5,-234 # 80215008 <timebase>
    802000fa:	6761                	lui	a4,0x18
    802000fc:	6a070713          	addi	a4,a4,1696 # 186a0 <XLENB+0x18698>
    80200100:	e398                	sd	a4,0(a5)
    80200102:	00015797          	auipc	a5,0x15
    80200106:	efe78793          	addi	a5,a5,-258 # 80215000 <ticks>
    8020010a:	0007b023          	sd	zero,0(a5)
    8020010e:	02000793          	li	a5,32
    80200112:	1047a7f3          	csrrs	a5,sie,a5
    80200116:	fef43423          	sd	a5,-24(s0)
    8020011a:	01a000ef          	jal	ra,80200134 <clock_set_next_event>
    8020011e:	00003517          	auipc	a0,0x3
    80200122:	f9a50513          	addi	a0,a0,-102 # 802030b8 <rodata_start+0xb8>
    80200126:	516020ef          	jal	ra,8020263c <kputs>
    8020012a:	0001                	nop
    8020012c:	60e2                	ld	ra,24(sp)
    8020012e:	6442                	ld	s0,16(sp)
    80200130:	6105                	addi	sp,sp,32
    80200132:	8082                	ret

0000000080200134 <clock_set_next_event>:
    80200134:	1141                	addi	sp,sp,-16
    80200136:	e406                	sd	ra,8(sp)
    80200138:	e022                	sd	s0,0(sp)
    8020013a:	0800                	addi	s0,sp,16
    8020013c:	f95ff0ef          	jal	ra,802000d0 <get_cycles>
    80200140:	872a                	mv	a4,a0
    80200142:	00015797          	auipc	a5,0x15
    80200146:	ec678793          	addi	a5,a5,-314 # 80215008 <timebase>
    8020014a:	639c                	ld	a5,0(a5)
    8020014c:	97ba                	add	a5,a5,a4
    8020014e:	853e                	mv	a0,a5
    80200150:	0b3020ef          	jal	ra,80202a02 <sbi_set_timer>
    80200154:	0001                	nop
    80200156:	60a2                	ld	ra,8(sp)
    80200158:	6402                	ld	s0,0(sp)
    8020015a:	0141                	addi	sp,sp,16
    8020015c:	8082                	ret

000000008020015e <fdt32_to_cpu>:
    8020015e:	7179                	addi	sp,sp,-48
    80200160:	f422                	sd	s0,40(sp)
    80200162:	1800                	addi	s0,sp,48
    80200164:	87aa                	mv	a5,a0
    80200166:	fcf42e23          	sw	a5,-36(s0)
    8020016a:	fdc40793          	addi	a5,s0,-36
    8020016e:	fef43423          	sd	a5,-24(s0)
    80200172:	fe843783          	ld	a5,-24(s0)
    80200176:	0007c783          	lbu	a5,0(a5)
    8020017a:	2781                	sext.w	a5,a5
    8020017c:	0187979b          	slliw	a5,a5,0x18
    80200180:	0007871b          	sext.w	a4,a5
    80200184:	fe843783          	ld	a5,-24(s0)
    80200188:	0785                	addi	a5,a5,1
    8020018a:	0007c783          	lbu	a5,0(a5)
    8020018e:	2781                	sext.w	a5,a5
    80200190:	0107979b          	slliw	a5,a5,0x10
    80200194:	2781                	sext.w	a5,a5
    80200196:	8fd9                	or	a5,a5,a4
    80200198:	0007871b          	sext.w	a4,a5
    8020019c:	fe843783          	ld	a5,-24(s0)
    802001a0:	0789                	addi	a5,a5,2
    802001a2:	0007c783          	lbu	a5,0(a5)
    802001a6:	2781                	sext.w	a5,a5
    802001a8:	0087979b          	slliw	a5,a5,0x8
    802001ac:	2781                	sext.w	a5,a5
    802001ae:	8fd9                	or	a5,a5,a4
    802001b0:	0007871b          	sext.w	a4,a5
    802001b4:	fe843783          	ld	a5,-24(s0)
    802001b8:	078d                	addi	a5,a5,3
    802001ba:	0007c783          	lbu	a5,0(a5)
    802001be:	2781                	sext.w	a5,a5
    802001c0:	8fd9                	or	a5,a5,a4
    802001c2:	2781                	sext.w	a5,a5
    802001c4:	2781                	sext.w	a5,a5
    802001c6:	853e                	mv	a0,a5
    802001c8:	7422                	ld	s0,40(sp)
    802001ca:	6145                	addi	sp,sp,48
    802001cc:	8082                	ret

00000000802001ce <fdt_header_size_>:
    802001ce:	1101                	addi	sp,sp,-32
    802001d0:	ec22                	sd	s0,24(sp)
    802001d2:	1000                	addi	s0,sp,32
    802001d4:	87aa                	mv	a5,a0
    802001d6:	fef42623          	sw	a5,-20(s0)
    802001da:	fec42783          	lw	a5,-20(s0)
    802001de:	0007871b          	sext.w	a4,a5
    802001e2:	4785                	li	a5,1
    802001e4:	00e7e463          	bltu	a5,a4,802001ec <fdt_header_size_+0x1e>
    802001e8:	47f1                	li	a5,28
    802001ea:	a03d                	j	80200218 <fdt_header_size_+0x4a>
    802001ec:	fec42783          	lw	a5,-20(s0)
    802001f0:	0007871b          	sext.w	a4,a5
    802001f4:	4789                	li	a5,2
    802001f6:	00e7e563          	bltu	a5,a4,80200200 <fdt_header_size_+0x32>
    802001fa:	02000793          	li	a5,32
    802001fe:	a829                	j	80200218 <fdt_header_size_+0x4a>
    80200200:	fec42783          	lw	a5,-20(s0)
    80200204:	0007871b          	sext.w	a4,a5
    80200208:	478d                	li	a5,3
    8020020a:	00e7e563          	bltu	a5,a4,80200214 <fdt_header_size_+0x46>
    8020020e:	02400793          	li	a5,36
    80200212:	a019                	j	80200218 <fdt_header_size_+0x4a>
    80200214:	02800793          	li	a5,40
    80200218:	853e                	mv	a0,a5
    8020021a:	6462                	ld	s0,24(sp)
    8020021c:	6105                	addi	sp,sp,32
    8020021e:	8082                	ret

0000000080200220 <check_fdt_header>:
    80200220:	711d                	addi	sp,sp,-96
    80200222:	ec86                	sd	ra,88(sp)
    80200224:	e8a2                	sd	s0,80(sp)
    80200226:	e4a6                	sd	s1,72(sp)
    80200228:	1080                	addi	s0,sp,96
    8020022a:	faa43423          	sd	a0,-88(s0)
    8020022e:	fa843783          	ld	a5,-88(s0)
    80200232:	fcf43c23          	sd	a5,-40(s0)
    80200236:	fd843783          	ld	a5,-40(s0)
    8020023a:	439c                	lw	a5,0(a5)
    8020023c:	853e                	mv	a0,a5
    8020023e:	f21ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200242:	87aa                	mv	a5,a0
    80200244:	2781                	sext.w	a5,a5
    80200246:	faf42823          	sw	a5,-80(s0)
    8020024a:	fd843783          	ld	a5,-40(s0)
    8020024e:	43dc                	lw	a5,4(a5)
    80200250:	853e                	mv	a0,a5
    80200252:	f0dff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200256:	87aa                	mv	a5,a0
    80200258:	2781                	sext.w	a5,a5
    8020025a:	faf42a23          	sw	a5,-76(s0)
    8020025e:	fd843783          	ld	a5,-40(s0)
    80200262:	479c                	lw	a5,8(a5)
    80200264:	853e                	mv	a0,a5
    80200266:	ef9ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    8020026a:	87aa                	mv	a5,a0
    8020026c:	2781                	sext.w	a5,a5
    8020026e:	faf42c23          	sw	a5,-72(s0)
    80200272:	fd843783          	ld	a5,-40(s0)
    80200276:	47dc                	lw	a5,12(a5)
    80200278:	853e                	mv	a0,a5
    8020027a:	ee5ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    8020027e:	87aa                	mv	a5,a0
    80200280:	2781                	sext.w	a5,a5
    80200282:	faf42e23          	sw	a5,-68(s0)
    80200286:	fd843783          	ld	a5,-40(s0)
    8020028a:	4b9c                	lw	a5,16(a5)
    8020028c:	853e                	mv	a0,a5
    8020028e:	ed1ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200292:	87aa                	mv	a5,a0
    80200294:	2781                	sext.w	a5,a5
    80200296:	fcf42023          	sw	a5,-64(s0)
    8020029a:	fd843783          	ld	a5,-40(s0)
    8020029e:	4bdc                	lw	a5,20(a5)
    802002a0:	853e                	mv	a0,a5
    802002a2:	ebdff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    802002a6:	87aa                	mv	a5,a0
    802002a8:	2781                	sext.w	a5,a5
    802002aa:	fcf42223          	sw	a5,-60(s0)
    802002ae:	fd843783          	ld	a5,-40(s0)
    802002b2:	4f9c                	lw	a5,24(a5)
    802002b4:	853e                	mv	a0,a5
    802002b6:	ea9ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    802002ba:	87aa                	mv	a5,a0
    802002bc:	2781                	sext.w	a5,a5
    802002be:	fcf42423          	sw	a5,-56(s0)
    802002c2:	fd843783          	ld	a5,-40(s0)
    802002c6:	4fdc                	lw	a5,28(a5)
    802002c8:	853e                	mv	a0,a5
    802002ca:	e95ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    802002ce:	87aa                	mv	a5,a0
    802002d0:	2781                	sext.w	a5,a5
    802002d2:	fcf42623          	sw	a5,-52(s0)
    802002d6:	fd843783          	ld	a5,-40(s0)
    802002da:	539c                	lw	a5,32(a5)
    802002dc:	853e                	mv	a0,a5
    802002de:	e81ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    802002e2:	87aa                	mv	a5,a0
    802002e4:	2781                	sext.w	a5,a5
    802002e6:	fcf42823          	sw	a5,-48(s0)
    802002ea:	fd843783          	ld	a5,-40(s0)
    802002ee:	53dc                	lw	a5,36(a5)
    802002f0:	853e                	mv	a0,a5
    802002f2:	e6dff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    802002f6:	87aa                	mv	a5,a0
    802002f8:	2781                	sext.w	a5,a5
    802002fa:	fcf42a23          	sw	a5,-44(s0)
    802002fe:	fb042783          	lw	a5,-80(s0)
    80200302:	873e                	mv	a4,a5
    80200304:	d00e07b7          	lui	a5,0xd00e0
    80200308:	eed78793          	addi	a5,a5,-275 # ffffffffd00dfeed <kernel_end+0xffffffff4fec7eed>
    8020030c:	00f70d63          	beq	a4,a5,80200326 <check_fdt_header+0x106>
    80200310:	fb042783          	lw	a5,-80(s0)
    80200314:	85be                	mv	a1,a5
    80200316:	00003517          	auipc	a0,0x3
    8020031a:	db250513          	addi	a0,a0,-590 # 802030c8 <rodata_start+0xc8>
    8020031e:	37c020ef          	jal	ra,8020269a <kprintf>
    80200322:	57fd                	li	a5,-1
    80200324:	a271                	j	802004b0 <check_fdt_header+0x290>
    80200326:	fc442783          	lw	a5,-60(s0)
    8020032a:	873e                	mv	a4,a5
    8020032c:	4785                	li	a5,1
    8020032e:	00e7f863          	bgeu	a5,a4,8020033e <check_fdt_header+0x11e>
    80200332:	fc842783          	lw	a5,-56(s0)
    80200336:	873e                	mv	a4,a5
    80200338:	47c5                	li	a5,17
    8020033a:	02e7f063          	bgeu	a5,a4,8020035a <check_fdt_header+0x13a>
    8020033e:	fc442783          	lw	a5,-60(s0)
    80200342:	fc842703          	lw	a4,-56(s0)
    80200346:	863a                	mv	a2,a4
    80200348:	85be                	mv	a1,a5
    8020034a:	00003517          	auipc	a0,0x3
    8020034e:	d9e50513          	addi	a0,a0,-610 # 802030e8 <rodata_start+0xe8>
    80200352:	348020ef          	jal	ra,8020269a <kprintf>
    80200356:	57fd                	li	a5,-1
    80200358:	aaa1                	j	802004b0 <check_fdt_header+0x290>
    8020035a:	fc442703          	lw	a4,-60(s0)
    8020035e:	fc842783          	lw	a5,-56(s0)
    80200362:	02f77063          	bgeu	a4,a5,80200382 <check_fdt_header+0x162>
    80200366:	fc442783          	lw	a5,-60(s0)
    8020036a:	fc842703          	lw	a4,-56(s0)
    8020036e:	863a                	mv	a2,a4
    80200370:	85be                	mv	a1,a5
    80200372:	00003517          	auipc	a0,0x3
    80200376:	dae50513          	addi	a0,a0,-594 # 80203120 <rodata_start+0x120>
    8020037a:	320020ef          	jal	ra,8020269a <kprintf>
    8020037e:	57fd                	li	a5,-1
    80200380:	aa05                	j	802004b0 <check_fdt_header+0x290>
    80200382:	fb842703          	lw	a4,-72(s0)
    80200386:	fb442783          	lw	a5,-76(s0)
    8020038a:	00f77f63          	bgeu	a4,a5,802003a8 <check_fdt_header+0x188>
    8020038e:	fb842783          	lw	a5,-72(s0)
    80200392:	02079493          	slli	s1,a5,0x20
    80200396:	9081                	srli	s1,s1,0x20
    80200398:	fc442783          	lw	a5,-60(s0)
    8020039c:	853e                	mv	a0,a5
    8020039e:	e31ff0ef          	jal	ra,802001ce <fdt_header_size_>
    802003a2:	87aa                	mv	a5,a0
    802003a4:	0097ed63          	bltu	a5,s1,802003be <check_fdt_header+0x19e>
    802003a8:	fb842783          	lw	a5,-72(s0)
    802003ac:	85be                	mv	a1,a5
    802003ae:	00003517          	auipc	a0,0x3
    802003b2:	da250513          	addi	a0,a0,-606 # 80203150 <rodata_start+0x150>
    802003b6:	2e4020ef          	jal	ra,8020269a <kprintf>
    802003ba:	57fd                	li	a5,-1
    802003bc:	a8d5                	j	802004b0 <check_fdt_header+0x290>
    802003be:	fbc42703          	lw	a4,-68(s0)
    802003c2:	fb442783          	lw	a5,-76(s0)
    802003c6:	00f77f63          	bgeu	a4,a5,802003e4 <check_fdt_header+0x1c4>
    802003ca:	fbc42783          	lw	a5,-68(s0)
    802003ce:	02079493          	slli	s1,a5,0x20
    802003d2:	9081                	srli	s1,s1,0x20
    802003d4:	fc442783          	lw	a5,-60(s0)
    802003d8:	853e                	mv	a0,a5
    802003da:	df5ff0ef          	jal	ra,802001ce <fdt_header_size_>
    802003de:	87aa                	mv	a5,a0
    802003e0:	0097ed63          	bltu	a5,s1,802003fa <check_fdt_header+0x1da>
    802003e4:	fbc42783          	lw	a5,-68(s0)
    802003e8:	85be                	mv	a1,a5
    802003ea:	00003517          	auipc	a0,0x3
    802003ee:	d8650513          	addi	a0,a0,-634 # 80203170 <rodata_start+0x170>
    802003f2:	2a8020ef          	jal	ra,8020269a <kprintf>
    802003f6:	57fd                	li	a5,-1
    802003f8:	a865                	j	802004b0 <check_fdt_header+0x290>
    802003fa:	fb042783          	lw	a5,-80(s0)
    802003fe:	85be                	mv	a1,a5
    80200400:	00003517          	auipc	a0,0x3
    80200404:	d9050513          	addi	a0,a0,-624 # 80203190 <rodata_start+0x190>
    80200408:	292020ef          	jal	ra,8020269a <kprintf>
    8020040c:	fb442783          	lw	a5,-76(s0)
    80200410:	85be                	mv	a1,a5
    80200412:	00003517          	auipc	a0,0x3
    80200416:	d9650513          	addi	a0,a0,-618 # 802031a8 <rodata_start+0x1a8>
    8020041a:	280020ef          	jal	ra,8020269a <kprintf>
    8020041e:	fb842783          	lw	a5,-72(s0)
    80200422:	85be                	mv	a1,a5
    80200424:	00003517          	auipc	a0,0x3
    80200428:	da450513          	addi	a0,a0,-604 # 802031c8 <rodata_start+0x1c8>
    8020042c:	26e020ef          	jal	ra,8020269a <kprintf>
    80200430:	fbc42783          	lw	a5,-68(s0)
    80200434:	85be                	mv	a1,a5
    80200436:	00003517          	auipc	a0,0x3
    8020043a:	db250513          	addi	a0,a0,-590 # 802031e8 <rodata_start+0x1e8>
    8020043e:	25c020ef          	jal	ra,8020269a <kprintf>
    80200442:	fc042783          	lw	a5,-64(s0)
    80200446:	85be                	mv	a1,a5
    80200448:	00003517          	auipc	a0,0x3
    8020044c:	dc050513          	addi	a0,a0,-576 # 80203208 <rodata_start+0x208>
    80200450:	24a020ef          	jal	ra,8020269a <kprintf>
    80200454:	fc442783          	lw	a5,-60(s0)
    80200458:	85be                	mv	a1,a5
    8020045a:	00003517          	auipc	a0,0x3
    8020045e:	dd650513          	addi	a0,a0,-554 # 80203230 <rodata_start+0x230>
    80200462:	238020ef          	jal	ra,8020269a <kprintf>
    80200466:	fc842783          	lw	a5,-56(s0)
    8020046a:	85be                	mv	a1,a5
    8020046c:	00003517          	auipc	a0,0x3
    80200470:	ddc50513          	addi	a0,a0,-548 # 80203248 <rodata_start+0x248>
    80200474:	226020ef          	jal	ra,8020269a <kprintf>
    80200478:	fcc42783          	lw	a5,-52(s0)
    8020047c:	85be                	mv	a1,a5
    8020047e:	00003517          	auipc	a0,0x3
    80200482:	dea50513          	addi	a0,a0,-534 # 80203268 <rodata_start+0x268>
    80200486:	214020ef          	jal	ra,8020269a <kprintf>
    8020048a:	fd042783          	lw	a5,-48(s0)
    8020048e:	85be                	mv	a1,a5
    80200490:	00003517          	auipc	a0,0x3
    80200494:	df850513          	addi	a0,a0,-520 # 80203288 <rodata_start+0x288>
    80200498:	202020ef          	jal	ra,8020269a <kprintf>
    8020049c:	fd442783          	lw	a5,-44(s0)
    802004a0:	85be                	mv	a1,a5
    802004a2:	00003517          	auipc	a0,0x3
    802004a6:	e0e50513          	addi	a0,a0,-498 # 802032b0 <rodata_start+0x2b0>
    802004aa:	1f0020ef          	jal	ra,8020269a <kprintf>
    802004ae:	4781                	li	a5,0
    802004b0:	853e                	mv	a0,a5
    802004b2:	60e6                	ld	ra,88(sp)
    802004b4:	6446                	ld	s0,80(sp)
    802004b6:	64a6                	ld	s1,72(sp)
    802004b8:	6125                	addi	sp,sp,96
    802004ba:	8082                	ret

00000000802004bc <unflatten_dt_nodes>:
    802004bc:	711d                	addi	sp,sp,-96
    802004be:	ec86                	sd	ra,88(sp)
    802004c0:	e8a2                	sd	s0,80(sp)
    802004c2:	e4a6                	sd	s1,72(sp)
    802004c4:	1080                	addi	s0,sp,96
    802004c6:	faa43423          	sd	a0,-88(s0)
    802004ca:	fa843783          	ld	a5,-88(s0)
    802004ce:	fcf43023          	sd	a5,-64(s0)
    802004d2:	fc043783          	ld	a5,-64(s0)
    802004d6:	479c                	lw	a5,8(a5)
    802004d8:	853e                	mv	a0,a5
    802004da:	c85ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    802004de:	87aa                	mv	a5,a0
    802004e0:	2781                	sext.w	a5,a5
    802004e2:	1782                	slli	a5,a5,0x20
    802004e4:	9381                	srli	a5,a5,0x20
    802004e6:	fa843703          	ld	a4,-88(s0)
    802004ea:	97ba                	add	a5,a5,a4
    802004ec:	faf43c23          	sd	a5,-72(s0)
    802004f0:	fc043783          	ld	a5,-64(s0)
    802004f4:	47dc                	lw	a5,12(a5)
    802004f6:	853e                	mv	a0,a5
    802004f8:	c67ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    802004fc:	87aa                	mv	a5,a0
    802004fe:	2781                	sext.w	a5,a5
    80200500:	1782                	slli	a5,a5,0x20
    80200502:	9381                	srli	a5,a5,0x20
    80200504:	fa843703          	ld	a4,-88(s0)
    80200508:	97ba                	add	a5,a5,a4
    8020050a:	faf43823          	sd	a5,-80(s0)
    8020050e:	fb843783          	ld	a5,-72(s0)
    80200512:	fcf43c23          	sd	a5,-40(s0)
    80200516:	fc043823          	sd	zero,-48(s0)
    8020051a:	a3ed                	j	80200b04 <unflatten_dt_nodes+0x648>
    8020051c:	fd043783          	ld	a5,-48(s0)
    80200520:	0785                	addi	a5,a5,1
    80200522:	fcf43823          	sd	a5,-48(s0)
    80200526:	fc042623          	sw	zero,-52(s0)
    8020052a:	00004797          	auipc	a5,0x4
    8020052e:	ad678793          	addi	a5,a5,-1322 # 80204000 <node_used>
    80200532:	639c                	ld	a5,0(a5)
    80200534:	00178713          	addi	a4,a5,1
    80200538:	00004797          	auipc	a5,0x4
    8020053c:	ac878793          	addi	a5,a5,-1336 # 80204000 <node_used>
    80200540:	e398                	sd	a4,0(a5)
    80200542:	00004797          	auipc	a5,0x4
    80200546:	abe78793          	addi	a5,a5,-1346 # 80204000 <node_used>
    8020054a:	6398                	ld	a4,0(a5)
    8020054c:	00015697          	auipc	a3,0x15
    80200550:	ac468693          	addi	a3,a3,-1340 # 80215010 <node>
    80200554:	87ba                	mv	a5,a4
    80200556:	078e                	slli	a5,a5,0x3
    80200558:	97ba                	add	a5,a5,a4
    8020055a:	078e                	slli	a5,a5,0x3
    8020055c:	97b6                	add	a5,a5,a3
    8020055e:	0007b023          	sd	zero,0(a5)
    80200562:	00004797          	auipc	a5,0x4
    80200566:	a9e78793          	addi	a5,a5,-1378 # 80204000 <node_used>
    8020056a:	6398                	ld	a4,0(a5)
    8020056c:	00015697          	auipc	a3,0x15
    80200570:	aa468693          	addi	a3,a3,-1372 # 80215010 <node>
    80200574:	87ba                	mv	a5,a4
    80200576:	078e                	slli	a5,a5,0x3
    80200578:	97ba                	add	a5,a5,a4
    8020057a:	078e                	slli	a5,a5,0x3
    8020057c:	97b6                	add	a5,a5,a3
    8020057e:	0007b423          	sd	zero,8(a5)
    80200582:	00004797          	auipc	a5,0x4
    80200586:	a7e78793          	addi	a5,a5,-1410 # 80204000 <node_used>
    8020058a:	6398                	ld	a4,0(a5)
    8020058c:	00015697          	auipc	a3,0x15
    80200590:	a8468693          	addi	a3,a3,-1404 # 80215010 <node>
    80200594:	87ba                	mv	a5,a4
    80200596:	078e                	slli	a5,a5,0x3
    80200598:	97ba                	add	a5,a5,a4
    8020059a:	078e                	slli	a5,a5,0x3
    8020059c:	97b6                	add	a5,a5,a3
    8020059e:	0007b823          	sd	zero,16(a5)
    802005a2:	00004797          	auipc	a5,0x4
    802005a6:	a5e78793          	addi	a5,a5,-1442 # 80204000 <node_used>
    802005aa:	6398                	ld	a4,0(a5)
    802005ac:	00015697          	auipc	a3,0x15
    802005b0:	a6468693          	addi	a3,a3,-1436 # 80215010 <node>
    802005b4:	87ba                	mv	a5,a4
    802005b6:	078e                	slli	a5,a5,0x3
    802005b8:	97ba                	add	a5,a5,a4
    802005ba:	078e                	slli	a5,a5,0x3
    802005bc:	97b6                	add	a5,a5,a3
    802005be:	0007bc23          	sd	zero,24(a5)
    802005c2:	00004797          	auipc	a5,0x4
    802005c6:	a3e78793          	addi	a5,a5,-1474 # 80204000 <node_used>
    802005ca:	6398                	ld	a4,0(a5)
    802005cc:	00015697          	auipc	a3,0x15
    802005d0:	a4468693          	addi	a3,a3,-1468 # 80215010 <node>
    802005d4:	87ba                	mv	a5,a4
    802005d6:	078e                	slli	a5,a5,0x3
    802005d8:	97ba                	add	a5,a5,a4
    802005da:	078e                	slli	a5,a5,0x3
    802005dc:	97b6                	add	a5,a5,a3
    802005de:	0207b023          	sd	zero,32(a5)
    802005e2:	00004797          	auipc	a5,0x4
    802005e6:	a1e78793          	addi	a5,a5,-1506 # 80204000 <node_used>
    802005ea:	6398                	ld	a4,0(a5)
    802005ec:	00015697          	auipc	a3,0x15
    802005f0:	a2468693          	addi	a3,a3,-1500 # 80215010 <node>
    802005f4:	87ba                	mv	a5,a4
    802005f6:	078e                	slli	a5,a5,0x3
    802005f8:	97ba                	add	a5,a5,a4
    802005fa:	078e                	slli	a5,a5,0x3
    802005fc:	97b6                	add	a5,a5,a3
    802005fe:	0207b823          	sd	zero,48(a5)
    80200602:	00004797          	auipc	a5,0x4
    80200606:	9fe78793          	addi	a5,a5,-1538 # 80204000 <node_used>
    8020060a:	6398                	ld	a4,0(a5)
    8020060c:	00015697          	auipc	a3,0x15
    80200610:	a0468693          	addi	a3,a3,-1532 # 80215010 <node>
    80200614:	87ba                	mv	a5,a4
    80200616:	078e                	slli	a5,a5,0x3
    80200618:	97ba                	add	a5,a5,a4
    8020061a:	078e                	slli	a5,a5,0x3
    8020061c:	97b6                	add	a5,a5,a3
    8020061e:	0207b423          	sd	zero,40(a5)
    80200622:	00004797          	auipc	a5,0x4
    80200626:	9de78793          	addi	a5,a5,-1570 # 80204000 <node_used>
    8020062a:	6398                	ld	a4,0(a5)
    8020062c:	00015697          	auipc	a3,0x15
    80200630:	9e468693          	addi	a3,a3,-1564 # 80215010 <node>
    80200634:	87ba                	mv	a5,a4
    80200636:	078e                	slli	a5,a5,0x3
    80200638:	97ba                	add	a5,a5,a4
    8020063a:	078e                	slli	a5,a5,0x3
    8020063c:	97b6                	add	a5,a5,a3
    8020063e:	0407b023          	sd	zero,64(a5)
    80200642:	00004797          	auipc	a5,0x4
    80200646:	9be78793          	addi	a5,a5,-1602 # 80204000 <node_used>
    8020064a:	6398                	ld	a4,0(a5)
    8020064c:	fd043783          	ld	a5,-48(s0)
    80200650:	0007869b          	sext.w	a3,a5
    80200654:	00015617          	auipc	a2,0x15
    80200658:	9bc60613          	addi	a2,a2,-1604 # 80215010 <node>
    8020065c:	87ba                	mv	a5,a4
    8020065e:	078e                	slli	a5,a5,0x3
    80200660:	97ba                	add	a5,a5,a4
    80200662:	078e                	slli	a5,a5,0x3
    80200664:	97b2                	add	a5,a5,a2
    80200666:	df94                	sw	a3,56(a5)
    80200668:	00004797          	auipc	a5,0x4
    8020066c:	99878793          	addi	a5,a5,-1640 # 80204000 <node_used>
    80200670:	639c                	ld	a5,0(a5)
    80200672:	18078763          	beqz	a5,80200800 <unflatten_dt_nodes+0x344>
    80200676:	00004797          	auipc	a5,0x4
    8020067a:	98a78793          	addi	a5,a5,-1654 # 80204000 <node_used>
    8020067e:	6398                	ld	a4,0(a5)
    80200680:	00015697          	auipc	a3,0x15
    80200684:	99068693          	addi	a3,a3,-1648 # 80215010 <node>
    80200688:	87ba                	mv	a5,a4
    8020068a:	078e                	slli	a5,a5,0x3
    8020068c:	97ba                	add	a5,a5,a4
    8020068e:	078e                	slli	a5,a5,0x3
    80200690:	97b6                	add	a5,a5,a3
    80200692:	5f90                	lw	a2,56(a5)
    80200694:	00004797          	auipc	a5,0x4
    80200698:	96c78793          	addi	a5,a5,-1684 # 80204000 <node_used>
    8020069c:	639c                	ld	a5,0(a5)
    8020069e:	fff78713          	addi	a4,a5,-1
    802006a2:	00015697          	auipc	a3,0x15
    802006a6:	96e68693          	addi	a3,a3,-1682 # 80215010 <node>
    802006aa:	87ba                	mv	a5,a4
    802006ac:	078e                	slli	a5,a5,0x3
    802006ae:	97ba                	add	a5,a5,a4
    802006b0:	078e                	slli	a5,a5,0x3
    802006b2:	97b6                	add	a5,a5,a3
    802006b4:	5f9c                	lw	a5,56(a5)
    802006b6:	8732                	mv	a4,a2
    802006b8:	08e7f163          	bgeu	a5,a4,8020073a <unflatten_dt_nodes+0x27e>
    802006bc:	00004797          	auipc	a5,0x4
    802006c0:	94478793          	addi	a5,a5,-1724 # 80204000 <node_used>
    802006c4:	6394                	ld	a3,0(a5)
    802006c6:	00004797          	auipc	a5,0x4
    802006ca:	93a78793          	addi	a5,a5,-1734 # 80204000 <node_used>
    802006ce:	639c                	ld	a5,0(a5)
    802006d0:	fff78713          	addi	a4,a5,-1
    802006d4:	87b6                	mv	a5,a3
    802006d6:	078e                	slli	a5,a5,0x3
    802006d8:	97b6                	add	a5,a5,a3
    802006da:	078e                	slli	a5,a5,0x3
    802006dc:	00015697          	auipc	a3,0x15
    802006e0:	93468693          	addi	a3,a3,-1740 # 80215010 <node>
    802006e4:	96be                	add	a3,a3,a5
    802006e6:	00015617          	auipc	a2,0x15
    802006ea:	92a60613          	addi	a2,a2,-1750 # 80215010 <node>
    802006ee:	87ba                	mv	a5,a4
    802006f0:	078e                	slli	a5,a5,0x3
    802006f2:	97ba                	add	a5,a5,a4
    802006f4:	078e                	slli	a5,a5,0x3
    802006f6:	97b2                	add	a5,a5,a2
    802006f8:	f794                	sd	a3,40(a5)
    802006fa:	00004797          	auipc	a5,0x4
    802006fe:	90678793          	addi	a5,a5,-1786 # 80204000 <node_used>
    80200702:	639c                	ld	a5,0(a5)
    80200704:	fff78693          	addi	a3,a5,-1
    80200708:	00004797          	auipc	a5,0x4
    8020070c:	8f878793          	addi	a5,a5,-1800 # 80204000 <node_used>
    80200710:	6398                	ld	a4,0(a5)
    80200712:	87b6                	mv	a5,a3
    80200714:	078e                	slli	a5,a5,0x3
    80200716:	97b6                	add	a5,a5,a3
    80200718:	078e                	slli	a5,a5,0x3
    8020071a:	00015697          	auipc	a3,0x15
    8020071e:	8f668693          	addi	a3,a3,-1802 # 80215010 <node>
    80200722:	96be                	add	a3,a3,a5
    80200724:	00015617          	auipc	a2,0x15
    80200728:	8ec60613          	addi	a2,a2,-1812 # 80215010 <node>
    8020072c:	87ba                	mv	a5,a4
    8020072e:	078e                	slli	a5,a5,0x3
    80200730:	97ba                	add	a5,a5,a4
    80200732:	078e                	slli	a5,a5,0x3
    80200734:	97b2                	add	a5,a5,a2
    80200736:	f394                	sd	a3,32(a5)
    80200738:	a0e1                	j	80200800 <unflatten_dt_nodes+0x344>
    8020073a:	00004797          	auipc	a5,0x4
    8020073e:	8c678793          	addi	a5,a5,-1850 # 80204000 <node_used>
    80200742:	6398                	ld	a4,0(a5)
    80200744:	00015697          	auipc	a3,0x15
    80200748:	8cc68693          	addi	a3,a3,-1844 # 80215010 <node>
    8020074c:	87ba                	mv	a5,a4
    8020074e:	078e                	slli	a5,a5,0x3
    80200750:	97ba                	add	a5,a5,a4
    80200752:	078e                	slli	a5,a5,0x3
    80200754:	97b6                	add	a5,a5,a3
    80200756:	5f90                	lw	a2,56(a5)
    80200758:	00004797          	auipc	a5,0x4
    8020075c:	8a878793          	addi	a5,a5,-1880 # 80204000 <node_used>
    80200760:	639c                	ld	a5,0(a5)
    80200762:	fff78713          	addi	a4,a5,-1
    80200766:	00015697          	auipc	a3,0x15
    8020076a:	8aa68693          	addi	a3,a3,-1878 # 80215010 <node>
    8020076e:	87ba                	mv	a5,a4
    80200770:	078e                	slli	a5,a5,0x3
    80200772:	97ba                	add	a5,a5,a4
    80200774:	078e                	slli	a5,a5,0x3
    80200776:	97b6                	add	a5,a5,a3
    80200778:	5f9c                	lw	a5,56(a5)
    8020077a:	8732                	mv	a4,a2
    8020077c:	04f77363          	bgeu	a4,a5,802007c2 <unflatten_dt_nodes+0x306>
    80200780:	00004797          	auipc	a5,0x4
    80200784:	88078793          	addi	a5,a5,-1920 # 80204000 <node_used>
    80200788:	6398                	ld	a4,0(a5)
    8020078a:	00004797          	auipc	a5,0x4
    8020078e:	87678793          	addi	a5,a5,-1930 # 80204000 <node_used>
    80200792:	639c                	ld	a5,0(a5)
    80200794:	fff78693          	addi	a3,a5,-1
    80200798:	00015617          	auipc	a2,0x15
    8020079c:	87860613          	addi	a2,a2,-1928 # 80215010 <node>
    802007a0:	87b6                	mv	a5,a3
    802007a2:	078e                	slli	a5,a5,0x3
    802007a4:	97b6                	add	a5,a5,a3
    802007a6:	078e                	slli	a5,a5,0x3
    802007a8:	97b2                	add	a5,a5,a2
    802007aa:	7394                	ld	a3,32(a5)
    802007ac:	87ba                	mv	a5,a4
    802007ae:	078e                	slli	a5,a5,0x3
    802007b0:	97ba                	add	a5,a5,a4
    802007b2:	078e                	slli	a5,a5,0x3
    802007b4:	00015717          	auipc	a4,0x15
    802007b8:	85c70713          	addi	a4,a4,-1956 # 80215010 <node>
    802007bc:	97ba                	add	a5,a5,a4
    802007be:	fa9c                	sd	a5,48(a3)
    802007c0:	a081                	j	80200800 <unflatten_dt_nodes+0x344>
    802007c2:	00004797          	auipc	a5,0x4
    802007c6:	83e78793          	addi	a5,a5,-1986 # 80204000 <node_used>
    802007ca:	6394                	ld	a3,0(a5)
    802007cc:	00004797          	auipc	a5,0x4
    802007d0:	83478793          	addi	a5,a5,-1996 # 80204000 <node_used>
    802007d4:	639c                	ld	a5,0(a5)
    802007d6:	fff78713          	addi	a4,a5,-1
    802007da:	87b6                	mv	a5,a3
    802007dc:	078e                	slli	a5,a5,0x3
    802007de:	97b6                	add	a5,a5,a3
    802007e0:	078e                	slli	a5,a5,0x3
    802007e2:	00015697          	auipc	a3,0x15
    802007e6:	82e68693          	addi	a3,a3,-2002 # 80215010 <node>
    802007ea:	96be                	add	a3,a3,a5
    802007ec:	00015617          	auipc	a2,0x15
    802007f0:	82460613          	addi	a2,a2,-2012 # 80215010 <node>
    802007f4:	87ba                	mv	a5,a4
    802007f6:	078e                	slli	a5,a5,0x3
    802007f8:	97ba                	add	a5,a5,a4
    802007fa:	078e                	slli	a5,a5,0x3
    802007fc:	97b2                	add	a5,a5,a2
    802007fe:	fb94                	sd	a3,48(a5)
    80200800:	fd843783          	ld	a5,-40(s0)
    80200804:	0791                	addi	a5,a5,4
    80200806:	fcf43c23          	sd	a5,-40(s0)
    8020080a:	00003797          	auipc	a5,0x3
    8020080e:	7f678793          	addi	a5,a5,2038 # 80204000 <node_used>
    80200812:	6398                	ld	a4,0(a5)
    80200814:	00014697          	auipc	a3,0x14
    80200818:	7fc68693          	addi	a3,a3,2044 # 80215010 <node>
    8020081c:	87ba                	mv	a5,a4
    8020081e:	078e                	slli	a5,a5,0x3
    80200820:	97ba                	add	a5,a5,a4
    80200822:	078e                	slli	a5,a5,0x3
    80200824:	97b6                	add	a5,a5,a3
    80200826:	fd843703          	ld	a4,-40(s0)
    8020082a:	e398                	sd	a4,0(a5)
    8020082c:	00003797          	auipc	a5,0x3
    80200830:	7d478793          	addi	a5,a5,2004 # 80204000 <node_used>
    80200834:	6398                	ld	a4,0(a5)
    80200836:	00014697          	auipc	a3,0x14
    8020083a:	7da68693          	addi	a3,a3,2010 # 80215010 <node>
    8020083e:	87ba                	mv	a5,a4
    80200840:	078e                	slli	a5,a5,0x3
    80200842:	97ba                	add	a5,a5,a4
    80200844:	078e                	slli	a5,a5,0x3
    80200846:	97b6                	add	a5,a5,a3
    80200848:	639c                	ld	a5,0(a5)
    8020084a:	0007c783          	lbu	a5,0(a5)
    8020084e:	e7a9                	bnez	a5,80200898 <unflatten_dt_nodes+0x3dc>
    80200850:	00003797          	auipc	a5,0x3
    80200854:	7b078793          	addi	a5,a5,1968 # 80204000 <node_used>
    80200858:	639c                	ld	a5,0(a5)
    8020085a:	e785                	bnez	a5,80200882 <unflatten_dt_nodes+0x3c6>
    8020085c:	00003797          	auipc	a5,0x3
    80200860:	7a478793          	addi	a5,a5,1956 # 80204000 <node_used>
    80200864:	6398                	ld	a4,0(a5)
    80200866:	00014697          	auipc	a3,0x14
    8020086a:	7aa68693          	addi	a3,a3,1962 # 80215010 <node>
    8020086e:	87ba                	mv	a5,a4
    80200870:	078e                	slli	a5,a5,0x3
    80200872:	97ba                	add	a5,a5,a4
    80200874:	078e                	slli	a5,a5,0x3
    80200876:	97b6                	add	a5,a5,a3
    80200878:	00003717          	auipc	a4,0x3
    8020087c:	a6070713          	addi	a4,a4,-1440 # 802032d8 <rodata_start+0x2d8>
    80200880:	e398                	sd	a4,0(a5)
    80200882:	fd843783          	ld	a5,-40(s0)
    80200886:	0785                	addi	a5,a5,1
    80200888:	fcf43c23          	sd	a5,-40(s0)
    8020088c:	a819                	j	802008a2 <unflatten_dt_nodes+0x3e6>
    8020088e:	fd843783          	ld	a5,-40(s0)
    80200892:	0785                	addi	a5,a5,1
    80200894:	fcf43c23          	sd	a5,-40(s0)
    80200898:	fd843783          	ld	a5,-40(s0)
    8020089c:	0007c783          	lbu	a5,0(a5)
    802008a0:	f7fd                	bnez	a5,8020088e <unflatten_dt_nodes+0x3d2>
    802008a2:	fd843783          	ld	a5,-40(s0)
    802008a6:	0785                	addi	a5,a5,1
    802008a8:	fcf43c23          	sd	a5,-40(s0)
    802008ac:	a031                	j	802008b8 <unflatten_dt_nodes+0x3fc>
    802008ae:	fd843783          	ld	a5,-40(s0)
    802008b2:	0785                	addi	a5,a5,1
    802008b4:	fcf43c23          	sd	a5,-40(s0)
    802008b8:	fd843783          	ld	a5,-40(s0)
    802008bc:	8b8d                	andi	a5,a5,3
    802008be:	fbe5                	bnez	a5,802008ae <unflatten_dt_nodes+0x3f2>
    802008c0:	aafd                	j	80200abe <unflatten_dt_nodes+0x602>
    802008c2:	00003797          	auipc	a5,0x3
    802008c6:	74678793          	addi	a5,a5,1862 # 80204008 <prop_used>
    802008ca:	639c                	ld	a5,0(a5)
    802008cc:	00178713          	addi	a4,a5,1
    802008d0:	00003797          	auipc	a5,0x3
    802008d4:	73878793          	addi	a5,a5,1848 # 80204008 <prop_used>
    802008d8:	e398                	sd	a4,0(a5)
    802008da:	fcc42783          	lw	a5,-52(s0)
    802008de:	2781                	sext.w	a5,a5
    802008e0:	ef85                	bnez	a5,80200918 <unflatten_dt_nodes+0x45c>
    802008e2:	00003797          	auipc	a5,0x3
    802008e6:	72678793          	addi	a5,a5,1830 # 80204008 <prop_used>
    802008ea:	639c                	ld	a5,0(a5)
    802008ec:	00003717          	auipc	a4,0x3
    802008f0:	71470713          	addi	a4,a4,1812 # 80204000 <node_used>
    802008f4:	6318                	ld	a4,0(a4)
    802008f6:	00579693          	slli	a3,a5,0x5
    802008fa:	00016797          	auipc	a5,0x16
    802008fe:	33678793          	addi	a5,a5,822 # 80216c30 <prop>
    80200902:	96be                	add	a3,a3,a5
    80200904:	00014617          	auipc	a2,0x14
    80200908:	70c60613          	addi	a2,a2,1804 # 80215010 <node>
    8020090c:	87ba                	mv	a5,a4
    8020090e:	078e                	slli	a5,a5,0x3
    80200910:	97ba                	add	a5,a5,a4
    80200912:	078e                	slli	a5,a5,0x3
    80200914:	97b2                	add	a5,a5,a2
    80200916:	ef94                	sd	a3,24(a5)
    80200918:	fd843783          	ld	a5,-40(s0)
    8020091c:	0791                	addi	a5,a5,4
    8020091e:	fcf43c23          	sd	a5,-40(s0)
    80200922:	fd843783          	ld	a5,-40(s0)
    80200926:	4398                	lw	a4,0(a5)
    80200928:	00003797          	auipc	a5,0x3
    8020092c:	6e078793          	addi	a5,a5,1760 # 80204008 <prop_used>
    80200930:	6384                	ld	s1,0(a5)
    80200932:	853a                	mv	a0,a4
    80200934:	82bff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200938:	87aa                	mv	a5,a0
    8020093a:	0007871b          	sext.w	a4,a5
    8020093e:	00016697          	auipc	a3,0x16
    80200942:	2f268693          	addi	a3,a3,754 # 80216c30 <prop>
    80200946:	00549793          	slli	a5,s1,0x5
    8020094a:	97b6                	add	a5,a5,a3
    8020094c:	c798                	sw	a4,8(a5)
    8020094e:	fd843783          	ld	a5,-40(s0)
    80200952:	0791                	addi	a5,a5,4
    80200954:	fcf43c23          	sd	a5,-40(s0)
    80200958:	fd843783          	ld	a5,-40(s0)
    8020095c:	439c                	lw	a5,0(a5)
    8020095e:	853e                	mv	a0,a5
    80200960:	ffeff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200964:	87aa                	mv	a5,a0
    80200966:	2781                	sext.w	a5,a5
    80200968:	02079713          	slli	a4,a5,0x20
    8020096c:	9301                	srli	a4,a4,0x20
    8020096e:	00003797          	auipc	a5,0x3
    80200972:	69a78793          	addi	a5,a5,1690 # 80204008 <prop_used>
    80200976:	639c                	ld	a5,0(a5)
    80200978:	fb043683          	ld	a3,-80(s0)
    8020097c:	9736                	add	a4,a4,a3
    8020097e:	00016697          	auipc	a3,0x16
    80200982:	2b268693          	addi	a3,a3,690 # 80216c30 <prop>
    80200986:	0796                	slli	a5,a5,0x5
    80200988:	97b6                	add	a5,a5,a3
    8020098a:	e398                	sd	a4,0(a5)
    8020098c:	fd843783          	ld	a5,-40(s0)
    80200990:	0791                	addi	a5,a5,4
    80200992:	fcf43c23          	sd	a5,-40(s0)
    80200996:	00003797          	auipc	a5,0x3
    8020099a:	67278793          	addi	a5,a5,1650 # 80204008 <prop_used>
    8020099e:	639c                	ld	a5,0(a5)
    802009a0:	00016717          	auipc	a4,0x16
    802009a4:	29070713          	addi	a4,a4,656 # 80216c30 <prop>
    802009a8:	0796                	slli	a5,a5,0x5
    802009aa:	97ba                	add	a5,a5,a4
    802009ac:	fd843703          	ld	a4,-40(s0)
    802009b0:	eb98                	sd	a4,16(a5)
    802009b2:	00003797          	auipc	a5,0x3
    802009b6:	65678793          	addi	a5,a5,1622 # 80204008 <prop_used>
    802009ba:	639c                	ld	a5,0(a5)
    802009bc:	00016717          	auipc	a4,0x16
    802009c0:	27470713          	addi	a4,a4,628 # 80216c30 <prop>
    802009c4:	0796                	slli	a5,a5,0x5
    802009c6:	97ba                	add	a5,a5,a4
    802009c8:	639c                	ld	a5,0(a5)
    802009ca:	00003597          	auipc	a1,0x3
    802009ce:	91658593          	addi	a1,a1,-1770 # 802032e0 <rodata_start+0x2e0>
    802009d2:	853e                	mv	a0,a5
    802009d4:	33e020ef          	jal	ra,80202d12 <strcmp>
    802009d8:	87aa                	mv	a5,a0
    802009da:	ef85                	bnez	a5,80200a12 <unflatten_dt_nodes+0x556>
    802009dc:	00003797          	auipc	a5,0x3
    802009e0:	62c78793          	addi	a5,a5,1580 # 80204008 <prop_used>
    802009e4:	639c                	ld	a5,0(a5)
    802009e6:	00003717          	auipc	a4,0x3
    802009ea:	61a70713          	addi	a4,a4,1562 # 80204000 <node_used>
    802009ee:	6318                	ld	a4,0(a4)
    802009f0:	00016697          	auipc	a3,0x16
    802009f4:	24068693          	addi	a3,a3,576 # 80216c30 <prop>
    802009f8:	0796                	slli	a5,a5,0x5
    802009fa:	97b6                	add	a5,a5,a3
    802009fc:	6b94                	ld	a3,16(a5)
    802009fe:	00014617          	auipc	a2,0x14
    80200a02:	61260613          	addi	a2,a2,1554 # 80215010 <node>
    80200a06:	87ba                	mv	a5,a4
    80200a08:	078e                	slli	a5,a5,0x3
    80200a0a:	97ba                	add	a5,a5,a4
    80200a0c:	078e                	slli	a5,a5,0x3
    80200a0e:	97b2                	add	a5,a5,a2
    80200a10:	e794                	sd	a3,8(a5)
    80200a12:	00003797          	auipc	a5,0x3
    80200a16:	5f678793          	addi	a5,a5,1526 # 80204008 <prop_used>
    80200a1a:	639c                	ld	a5,0(a5)
    80200a1c:	00016717          	auipc	a4,0x16
    80200a20:	21470713          	addi	a4,a4,532 # 80216c30 <prop>
    80200a24:	0796                	slli	a5,a5,0x5
    80200a26:	97ba                	add	a5,a5,a4
    80200a28:	479c                	lw	a5,8(a5)
    80200a2a:	1782                	slli	a5,a5,0x20
    80200a2c:	9381                	srli	a5,a5,0x20
    80200a2e:	fd843703          	ld	a4,-40(s0)
    80200a32:	97ba                	add	a5,a5,a4
    80200a34:	fcf43c23          	sd	a5,-40(s0)
    80200a38:	a031                	j	80200a44 <unflatten_dt_nodes+0x588>
    80200a3a:	fd843783          	ld	a5,-40(s0)
    80200a3e:	0785                	addi	a5,a5,1
    80200a40:	fcf43c23          	sd	a5,-40(s0)
    80200a44:	fd843783          	ld	a5,-40(s0)
    80200a48:	8b8d                	andi	a5,a5,3
    80200a4a:	fbe5                	bnez	a5,80200a3a <unflatten_dt_nodes+0x57e>
    80200a4c:	fd843783          	ld	a5,-40(s0)
    80200a50:	439c                	lw	a5,0(a5)
    80200a52:	853e                	mv	a0,a5
    80200a54:	f0aff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200a58:	87aa                	mv	a5,a0
    80200a5a:	2781                	sext.w	a5,a5
    80200a5c:	873e                	mv	a4,a5
    80200a5e:	478d                	li	a5,3
    80200a60:	02f71d63          	bne	a4,a5,80200a9a <unflatten_dt_nodes+0x5de>
    80200a64:	00003797          	auipc	a5,0x3
    80200a68:	5a478793          	addi	a5,a5,1444 # 80204008 <prop_used>
    80200a6c:	639c                	ld	a5,0(a5)
    80200a6e:	00178713          	addi	a4,a5,1
    80200a72:	00003797          	auipc	a5,0x3
    80200a76:	59678793          	addi	a5,a5,1430 # 80204008 <prop_used>
    80200a7a:	639c                	ld	a5,0(a5)
    80200a7c:	00571693          	slli	a3,a4,0x5
    80200a80:	00016717          	auipc	a4,0x16
    80200a84:	1b070713          	addi	a4,a4,432 # 80216c30 <prop>
    80200a88:	9736                	add	a4,a4,a3
    80200a8a:	00016697          	auipc	a3,0x16
    80200a8e:	1a668693          	addi	a3,a3,422 # 80216c30 <prop>
    80200a92:	0796                	slli	a5,a5,0x5
    80200a94:	97b6                	add	a5,a5,a3
    80200a96:	ef98                	sd	a4,24(a5)
    80200a98:	a831                	j	80200ab4 <unflatten_dt_nodes+0x5f8>
    80200a9a:	00003797          	auipc	a5,0x3
    80200a9e:	56e78793          	addi	a5,a5,1390 # 80204008 <prop_used>
    80200aa2:	639c                	ld	a5,0(a5)
    80200aa4:	00016717          	auipc	a4,0x16
    80200aa8:	18c70713          	addi	a4,a4,396 # 80216c30 <prop>
    80200aac:	0796                	slli	a5,a5,0x5
    80200aae:	97ba                	add	a5,a5,a4
    80200ab0:	0007bc23          	sd	zero,24(a5)
    80200ab4:	fcc42783          	lw	a5,-52(s0)
    80200ab8:	2785                	addiw	a5,a5,1
    80200aba:	fcf42623          	sw	a5,-52(s0)
    80200abe:	fd843783          	ld	a5,-40(s0)
    80200ac2:	439c                	lw	a5,0(a5)
    80200ac4:	853e                	mv	a0,a5
    80200ac6:	e98ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200aca:	87aa                	mv	a5,a0
    80200acc:	2781                	sext.w	a5,a5
    80200ace:	873e                	mv	a4,a5
    80200ad0:	478d                	li	a5,3
    80200ad2:	def708e3          	beq	a4,a5,802008c2 <unflatten_dt_nodes+0x406>
    80200ad6:	a819                	j	80200aec <unflatten_dt_nodes+0x630>
    80200ad8:	fd043783          	ld	a5,-48(s0)
    80200adc:	17fd                	addi	a5,a5,-1
    80200ade:	fcf43823          	sd	a5,-48(s0)
    80200ae2:	fd843783          	ld	a5,-40(s0)
    80200ae6:	0791                	addi	a5,a5,4
    80200ae8:	fcf43c23          	sd	a5,-40(s0)
    80200aec:	fd843783          	ld	a5,-40(s0)
    80200af0:	439c                	lw	a5,0(a5)
    80200af2:	853e                	mv	a0,a5
    80200af4:	e6aff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200af8:	87aa                	mv	a5,a0
    80200afa:	2781                	sext.w	a5,a5
    80200afc:	873e                	mv	a4,a5
    80200afe:	4789                	li	a5,2
    80200b00:	fcf70ce3          	beq	a4,a5,80200ad8 <unflatten_dt_nodes+0x61c>
    80200b04:	fd843783          	ld	a5,-40(s0)
    80200b08:	439c                	lw	a5,0(a5)
    80200b0a:	853e                	mv	a0,a5
    80200b0c:	e52ff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200b10:	87aa                	mv	a5,a0
    80200b12:	2781                	sext.w	a5,a5
    80200b14:	873e                	mv	a4,a5
    80200b16:	4785                	li	a5,1
    80200b18:	a0f702e3          	beq	a4,a5,8020051c <unflatten_dt_nodes+0x60>
    80200b1c:	fd843783          	ld	a5,-40(s0)
    80200b20:	439c                	lw	a5,0(a5)
    80200b22:	853e                	mv	a0,a5
    80200b24:	e3aff0ef          	jal	ra,8020015e <fdt32_to_cpu>
    80200b28:	87aa                	mv	a5,a0
    80200b2a:	2781                	sext.w	a5,a5
    80200b2c:	873e                	mv	a4,a5
    80200b2e:	47a5                	li	a5,9
    80200b30:	00f70a63          	beq	a4,a5,80200b44 <unflatten_dt_nodes+0x688>
    80200b34:	00002517          	auipc	a0,0x2
    80200b38:	7bc50513          	addi	a0,a0,1980 # 802032f0 <rodata_start+0x2f0>
    80200b3c:	35f010ef          	jal	ra,8020269a <kprintf>
    80200b40:	57fd                	li	a5,-1
    80200b42:	a011                	j	80200b46 <unflatten_dt_nodes+0x68a>
    80200b44:	4781                	li	a5,0
    80200b46:	853e                	mv	a0,a5
    80200b48:	60e6                	ld	ra,88(sp)
    80200b4a:	6446                	ld	s0,80(sp)
    80200b4c:	64a6                	ld	s1,72(sp)
    80200b4e:	6125                	addi	sp,sp,96
    80200b50:	8082                	ret

0000000080200b52 <print_node_info>:
    80200b52:	7139                	addi	sp,sp,-64
    80200b54:	fc06                	sd	ra,56(sp)
    80200b56:	f822                	sd	s0,48(sp)
    80200b58:	0080                	addi	s0,sp,64
    80200b5a:	fca43423          	sd	a0,-56(s0)
    80200b5e:	00002797          	auipc	a5,0x2
    80200b62:	7fa78793          	addi	a5,a5,2042 # 80203358 <rodata_start+0x358>
    80200b66:	6398                	ld	a4,0(a5)
    80200b68:	fce43823          	sd	a4,-48(s0)
    80200b6c:	0087d783          	lhu	a5,8(a5)
    80200b70:	fcf41c23          	sh	a5,-40(s0)
    80200b74:	fc843783          	ld	a5,-56(s0)
    80200b78:	5f9c                	lw	a5,56(a5)
    80200b7a:	1782                	slli	a5,a5,0x20
    80200b7c:	9381                	srli	a5,a5,0x20
    80200b7e:	4725                	li	a4,9
    80200b80:	40f707b3          	sub	a5,a4,a5
    80200b84:	fd040713          	addi	a4,s0,-48
    80200b88:	973e                	add	a4,a4,a5
    80200b8a:	fc843783          	ld	a5,-56(s0)
    80200b8e:	639c                	ld	a5,0(a5)
    80200b90:	863e                	mv	a2,a5
    80200b92:	85ba                	mv	a1,a4
    80200b94:	00002517          	auipc	a0,0x2
    80200b98:	77450513          	addi	a0,a0,1908 # 80203308 <rodata_start+0x308>
    80200b9c:	2ff010ef          	jal	ra,8020269a <kprintf>
    80200ba0:	fc843783          	ld	a5,-56(s0)
    80200ba4:	679c                	ld	a5,8(a5)
    80200ba6:	c79d                	beqz	a5,80200bd4 <print_node_info+0x82>
    80200ba8:	fc843783          	ld	a5,-56(s0)
    80200bac:	5f9c                	lw	a5,56(a5)
    80200bae:	1782                	slli	a5,a5,0x20
    80200bb0:	9381                	srli	a5,a5,0x20
    80200bb2:	4725                	li	a4,9
    80200bb4:	40f707b3          	sub	a5,a4,a5
    80200bb8:	fd040713          	addi	a4,s0,-48
    80200bbc:	973e                	add	a4,a4,a5
    80200bbe:	fc843783          	ld	a5,-56(s0)
    80200bc2:	679c                	ld	a5,8(a5)
    80200bc4:	863e                	mv	a2,a5
    80200bc6:	85ba                	mv	a1,a4
    80200bc8:	00002517          	auipc	a0,0x2
    80200bcc:	74850513          	addi	a0,a0,1864 # 80203310 <rodata_start+0x310>
    80200bd0:	2cb010ef          	jal	ra,8020269a <kprintf>
    80200bd4:	fc843783          	ld	a5,-56(s0)
    80200bd8:	6b9c                	ld	a5,16(a5)
    80200bda:	c79d                	beqz	a5,80200c08 <print_node_info+0xb6>
    80200bdc:	fc843783          	ld	a5,-56(s0)
    80200be0:	5f9c                	lw	a5,56(a5)
    80200be2:	1782                	slli	a5,a5,0x20
    80200be4:	9381                	srli	a5,a5,0x20
    80200be6:	4725                	li	a4,9
    80200be8:	40f707b3          	sub	a5,a4,a5
    80200bec:	fd040713          	addi	a4,s0,-48
    80200bf0:	973e                	add	a4,a4,a5
    80200bf2:	fc843783          	ld	a5,-56(s0)
    80200bf6:	6b9c                	ld	a5,16(a5)
    80200bf8:	863e                	mv	a2,a5
    80200bfa:	85ba                	mv	a1,a4
    80200bfc:	00002517          	auipc	a0,0x2
    80200c00:	72450513          	addi	a0,a0,1828 # 80203320 <rodata_start+0x320>
    80200c04:	297010ef          	jal	ra,8020269a <kprintf>
    80200c08:	fc843783          	ld	a5,-56(s0)
    80200c0c:	6f9c                	ld	a5,24(a5)
    80200c0e:	cbb5                	beqz	a5,80200c82 <print_node_info+0x130>
    80200c10:	fc843783          	ld	a5,-56(s0)
    80200c14:	6f9c                	ld	a5,24(a5)
    80200c16:	fef43423          	sd	a5,-24(s0)
    80200c1a:	a08d                	j	80200c7c <print_node_info+0x12a>
    80200c1c:	fc843783          	ld	a5,-56(s0)
    80200c20:	5f9c                	lw	a5,56(a5)
    80200c22:	1782                	slli	a5,a5,0x20
    80200c24:	9381                	srli	a5,a5,0x20
    80200c26:	4721                	li	a4,8
    80200c28:	40f707b3          	sub	a5,a4,a5
    80200c2c:	fd040713          	addi	a4,s0,-48
    80200c30:	973e                	add	a4,a4,a5
    80200c32:	fe843783          	ld	a5,-24(s0)
    80200c36:	639c                	ld	a5,0(a5)
    80200c38:	863e                	mv	a2,a5
    80200c3a:	85ba                	mv	a1,a4
    80200c3c:	00002517          	auipc	a0,0x2
    80200c40:	6fc50513          	addi	a0,a0,1788 # 80203338 <rodata_start+0x338>
    80200c44:	257010ef          	jal	ra,8020269a <kprintf>
    80200c48:	fe843783          	ld	a5,-24(s0)
    80200c4c:	6b9c                	ld	a5,16(a5)
    80200c4e:	cf81                	beqz	a5,80200c66 <print_node_info+0x114>
    80200c50:	fe843783          	ld	a5,-24(s0)
    80200c54:	6b9c                	ld	a5,16(a5)
    80200c56:	85be                	mv	a1,a5
    80200c58:	00002517          	auipc	a0,0x2
    80200c5c:	6f050513          	addi	a0,a0,1776 # 80203348 <rodata_start+0x348>
    80200c60:	23b010ef          	jal	ra,8020269a <kprintf>
    80200c64:	a039                	j	80200c72 <print_node_info+0x120>
    80200c66:	00002517          	auipc	a0,0x2
    80200c6a:	6ea50513          	addi	a0,a0,1770 # 80203350 <rodata_start+0x350>
    80200c6e:	22d010ef          	jal	ra,8020269a <kprintf>
    80200c72:	fe843783          	ld	a5,-24(s0)
    80200c76:	6f9c                	ld	a5,24(a5)
    80200c78:	fef43423          	sd	a5,-24(s0)
    80200c7c:	fe843783          	ld	a5,-24(s0)
    80200c80:	ffd1                	bnez	a5,80200c1c <print_node_info+0xca>
    80200c82:	fc843783          	ld	a5,-56(s0)
    80200c86:	779c                	ld	a5,40(a5)
    80200c88:	c39d                	beqz	a5,80200cae <print_node_info+0x15c>
    80200c8a:	fc843783          	ld	a5,-56(s0)
    80200c8e:	779c                	ld	a5,40(a5)
    80200c90:	fef43023          	sd	a5,-32(s0)
    80200c94:	a811                	j	80200ca8 <print_node_info+0x156>
    80200c96:	fe043503          	ld	a0,-32(s0)
    80200c9a:	eb9ff0ef          	jal	ra,80200b52 <print_node_info>
    80200c9e:	fe043783          	ld	a5,-32(s0)
    80200ca2:	7b9c                	ld	a5,48(a5)
    80200ca4:	fef43023          	sd	a5,-32(s0)
    80200ca8:	fe043783          	ld	a5,-32(s0)
    80200cac:	f7ed                	bnez	a5,80200c96 <print_node_info+0x144>
    80200cae:	0001                	nop
    80200cb0:	70e2                	ld	ra,56(sp)
    80200cb2:	7442                	ld	s0,48(sp)
    80200cb4:	6121                	addi	sp,sp,64
    80200cb6:	8082                	ret

0000000080200cb8 <unflatten_device_tree>:
    80200cb8:	1101                	addi	sp,sp,-32
    80200cba:	ec06                	sd	ra,24(sp)
    80200cbc:	e822                	sd	s0,16(sp)
    80200cbe:	1000                	addi	s0,sp,32
    80200cc0:	fea43423          	sd	a0,-24(s0)
    80200cc4:	fe843503          	ld	a0,-24(s0)
    80200cc8:	d58ff0ef          	jal	ra,80200220 <check_fdt_header>
    80200ccc:	87aa                	mv	a5,a0
    80200cce:	2781                	sext.w	a5,a5
    80200cd0:	873e                	mv	a4,a5
    80200cd2:	57fd                	li	a5,-1
    80200cd4:	00f71963          	bne	a4,a5,80200ce6 <unflatten_device_tree+0x2e>
    80200cd8:	00002517          	auipc	a0,0x2
    80200cdc:	69050513          	addi	a0,a0,1680 # 80203368 <rodata_start+0x368>
    80200ce0:	1bb010ef          	jal	ra,8020269a <kprintf>
    80200ce4:	a819                	j	80200cfa <unflatten_device_tree+0x42>
    80200ce6:	fe843503          	ld	a0,-24(s0)
    80200cea:	fd2ff0ef          	jal	ra,802004bc <unflatten_dt_nodes>
    80200cee:	00014517          	auipc	a0,0x14
    80200cf2:	32250513          	addi	a0,a0,802 # 80215010 <node>
    80200cf6:	e5dff0ef          	jal	ra,80200b52 <print_node_info>
    80200cfa:	60e2                	ld	ra,24(sp)
    80200cfc:	6442                	ld	s0,16(sp)
    80200cfe:	6105                	addi	sp,sp,32
    80200d00:	8082                	ret

0000000080200d02 <plic_probe>:
    80200d02:	1101                	addi	sp,sp,-32
    80200d04:	ec06                	sd	ra,24(sp)
    80200d06:	e822                	sd	s0,16(sp)
    80200d08:	1000                	addi	s0,sp,32
    80200d0a:	fe043423          	sd	zero,-24(s0)
    80200d0e:	a041                	j	80200d8e <plic_probe+0x8c>
    80200d10:	00003717          	auipc	a4,0x3
    80200d14:	3e073703          	ld	a4,992(a4) # 802040f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80200d18:	fe843783          	ld	a5,-24(s0)
    80200d1c:	0796                	slli	a5,a5,0x5
    80200d1e:	97ba                	add	a5,a5,a4
    80200d20:	639c                	ld	a5,0(a5)
    80200d22:	00002597          	auipc	a1,0x2
    80200d26:	66658593          	addi	a1,a1,1638 # 80203388 <rodata_start+0x388>
    80200d2a:	853e                	mv	a0,a5
    80200d2c:	7e7010ef          	jal	ra,80202d12 <strcmp>
    80200d30:	87aa                	mv	a5,a0
    80200d32:	eba9                	bnez	a5,80200d84 <plic_probe+0x82>
    80200d34:	00003717          	auipc	a4,0x3
    80200d38:	3bc73703          	ld	a4,956(a4) # 802040f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80200d3c:	fe843783          	ld	a5,-24(s0)
    80200d40:	0796                	slli	a5,a5,0x5
    80200d42:	97ba                	add	a5,a5,a4
    80200d44:	6b9c                	ld	a5,16(a5)
    80200d46:	00002597          	auipc	a1,0x2
    80200d4a:	65258593          	addi	a1,a1,1618 # 80203398 <rodata_start+0x398>
    80200d4e:	853e                	mv	a0,a5
    80200d50:	7c3010ef          	jal	ra,80202d12 <strcmp>
    80200d54:	87aa                	mv	a5,a0
    80200d56:	e399                	bnez	a5,80200d5c <plic_probe+0x5a>
    80200d58:	4785                	li	a5,1
    80200d5a:	a0a9                	j	80200da4 <plic_probe+0xa2>
    80200d5c:	00003717          	auipc	a4,0x3
    80200d60:	39473703          	ld	a4,916(a4) # 802040f0 <_GLOBAL_OFFSET_TABLE_+0x40>
    80200d64:	fe843783          	ld	a5,-24(s0)
    80200d68:	0796                	slli	a5,a5,0x5
    80200d6a:	97ba                	add	a5,a5,a4
    80200d6c:	6b9c                	ld	a5,16(a5)
    80200d6e:	00002597          	auipc	a1,0x2
    80200d72:	63a58593          	addi	a1,a1,1594 # 802033a8 <rodata_start+0x3a8>
    80200d76:	853e                	mv	a0,a5
    80200d78:	79b010ef          	jal	ra,80202d12 <strcmp>
    80200d7c:	87aa                	mv	a5,a0
    80200d7e:	e399                	bnez	a5,80200d84 <plic_probe+0x82>
    80200d80:	4781                	li	a5,0
    80200d82:	a00d                	j	80200da4 <plic_probe+0xa2>
    80200d84:	fe843783          	ld	a5,-24(s0)
    80200d88:	0785                	addi	a5,a5,1
    80200d8a:	fef43423          	sd	a5,-24(s0)
    80200d8e:	00003797          	auipc	a5,0x3
    80200d92:	3527b783          	ld	a5,850(a5) # 802040e0 <_GLOBAL_OFFSET_TABLE_+0x30>
    80200d96:	639c                	ld	a5,0(a5)
    80200d98:	873e                	mv	a4,a5
    80200d9a:	fe843783          	ld	a5,-24(s0)
    80200d9e:	f6e7e9e3          	bltu	a5,a4,80200d10 <plic_probe+0xe>
    80200da2:	57fd                	li	a5,-1
    80200da4:	853e                	mv	a0,a5
    80200da6:	60e2                	ld	ra,24(sp)
    80200da8:	6442                	ld	s0,16(sp)
    80200daa:	6105                	addi	sp,sp,32
    80200dac:	8082                	ret

0000000080200dae <plic_init>:
    80200dae:	1101                	addi	sp,sp,-32
    80200db0:	ec06                	sd	ra,24(sp)
    80200db2:	e822                	sd	s0,16(sp)
    80200db4:	1000                	addi	s0,sp,32
    80200db6:	f4dff0ef          	jal	ra,80200d02 <plic_probe>
    80200dba:	87aa                	mv	a5,a0
    80200dbc:	0007871b          	sext.w	a4,a5
    80200dc0:	00017797          	auipc	a5,0x17
    80200dc4:	13078793          	addi	a5,a5,304 # 80217ef0 <plic_device>
    80200dc8:	c398                	sw	a4,0(a5)
    80200dca:	00017797          	auipc	a5,0x17
    80200dce:	12678793          	addi	a5,a5,294 # 80217ef0 <plic_device>
    80200dd2:	439c                	lw	a5,0(a5)
    80200dd4:	c791                	beqz	a5,80200de0 <plic_init+0x32>
    80200dd6:	873e                	mv	a4,a5
    80200dd8:	4785                	li	a5,1
    80200dda:	02f70963          	beq	a4,a5,80200e0c <plic_init+0x5e>
    80200dde:	a8b9                	j	80200e3c <plic_init+0x8e>
    80200de0:	00017797          	auipc	a5,0x17
    80200de4:	11078793          	addi	a5,a5,272 # 80217ef0 <plic_device>
    80200de8:	0c000737          	lui	a4,0xc000
    80200dec:	e798                	sd	a4,8(a5)
    80200dee:	452d                	li	a0,11
    80200df0:	068000ef          	jal	ra,80200e58 <plic_enable_interrupt>
    80200df4:	4529                	li	a0,10
    80200df6:	062000ef          	jal	ra,80200e58 <plic_enable_interrupt>
    80200dfa:	4585                	li	a1,1
    80200dfc:	452d                	li	a0,11
    80200dfe:	0d6000ef          	jal	ra,80200ed4 <plic_set_priority>
    80200e02:	4585                	li	a1,1
    80200e04:	4529                	li	a0,10
    80200e06:	0ce000ef          	jal	ra,80200ed4 <plic_set_priority>
    80200e0a:	a80d                	j	80200e3c <plic_init+0x8e>
    80200e0c:	00017797          	auipc	a5,0x17
    80200e10:	0e478793          	addi	a5,a5,228 # 80217ef0 <plic_device>
    80200e14:	10000737          	lui	a4,0x10000
    80200e18:	e798                	sd	a4,8(a5)
    80200e1a:	4549                	li	a0,18
    80200e1c:	03c000ef          	jal	ra,80200e58 <plic_enable_interrupt>
    80200e20:	0a000513          	li	a0,160
    80200e24:	034000ef          	jal	ra,80200e58 <plic_enable_interrupt>
    80200e28:	4585                	li	a1,1
    80200e2a:	4549                	li	a0,18
    80200e2c:	0a8000ef          	jal	ra,80200ed4 <plic_set_priority>
    80200e30:	4585                	li	a1,1
    80200e32:	0a000513          	li	a0,160
    80200e36:	09e000ef          	jal	ra,80200ed4 <plic_set_priority>
    80200e3a:	0001                	nop
    80200e3c:	4501                	li	a0,0
    80200e3e:	0d6000ef          	jal	ra,80200f14 <plic_set_threshold>
    80200e42:	20000793          	li	a5,512
    80200e46:	1047a7f3          	csrrs	a5,sie,a5
    80200e4a:	fef43423          	sd	a5,-24(s0)
    80200e4e:	0001                	nop
    80200e50:	60e2                	ld	ra,24(sp)
    80200e52:	6442                	ld	s0,16(sp)
    80200e54:	6105                	addi	sp,sp,32
    80200e56:	8082                	ret

0000000080200e58 <plic_enable_interrupt>:
    80200e58:	1101                	addi	sp,sp,-32
    80200e5a:	ec22                	sd	s0,24(sp)
    80200e5c:	1000                	addi	s0,sp,32
    80200e5e:	87aa                	mv	a5,a0
    80200e60:	fef42623          	sw	a5,-20(s0)
    80200e64:	00017797          	auipc	a5,0x17
    80200e68:	08c78793          	addi	a5,a5,140 # 80217ef0 <plic_device>
    80200e6c:	6798                	ld	a4,8(a5)
    80200e6e:	fec42783          	lw	a5,-20(s0)
    80200e72:	0057d79b          	srliw	a5,a5,0x5
    80200e76:	0007861b          	sext.w	a2,a5
    80200e7a:	02061693          	slli	a3,a2,0x20
    80200e7e:	9281                	srli	a3,a3,0x20
    80200e80:	6785                	lui	a5,0x1
    80200e82:	82078793          	addi	a5,a5,-2016 # 820 <XLENB+0x818>
    80200e86:	97b6                	add	a5,a5,a3
    80200e88:	078a                	slli	a5,a5,0x2
    80200e8a:	97ba                	add	a5,a5,a4
    80200e8c:	439c                	lw	a5,0(a5)
    80200e8e:	0007851b          	sext.w	a0,a5
    80200e92:	fec42783          	lw	a5,-20(s0)
    80200e96:	8bfd                	andi	a5,a5,31
    80200e98:	2781                	sext.w	a5,a5
    80200e9a:	4705                	li	a4,1
    80200e9c:	00f717bb          	sllw	a5,a4,a5
    80200ea0:	2781                	sext.w	a5,a5
    80200ea2:	0007859b          	sext.w	a1,a5
    80200ea6:	00017797          	auipc	a5,0x17
    80200eaa:	04a78793          	addi	a5,a5,74 # 80217ef0 <plic_device>
    80200eae:	6794                	ld	a3,8(a5)
    80200eb0:	872a                	mv	a4,a0
    80200eb2:	87ae                	mv	a5,a1
    80200eb4:	8fd9                	or	a5,a5,a4
    80200eb6:	0007871b          	sext.w	a4,a5
    80200eba:	1602                	slli	a2,a2,0x20
    80200ebc:	9201                	srli	a2,a2,0x20
    80200ebe:	6785                	lui	a5,0x1
    80200ec0:	82078793          	addi	a5,a5,-2016 # 820 <XLENB+0x818>
    80200ec4:	97b2                	add	a5,a5,a2
    80200ec6:	078a                	slli	a5,a5,0x2
    80200ec8:	97b6                	add	a5,a5,a3
    80200eca:	c398                	sw	a4,0(a5)
    80200ecc:	0001                	nop
    80200ece:	6462                	ld	s0,24(sp)
    80200ed0:	6105                	addi	sp,sp,32
    80200ed2:	8082                	ret

0000000080200ed4 <plic_set_priority>:
    80200ed4:	1101                	addi	sp,sp,-32
    80200ed6:	ec22                	sd	s0,24(sp)
    80200ed8:	1000                	addi	s0,sp,32
    80200eda:	87aa                	mv	a5,a0
    80200edc:	872e                	mv	a4,a1
    80200ede:	fef42623          	sw	a5,-20(s0)
    80200ee2:	87ba                	mv	a5,a4
    80200ee4:	fef405a3          	sb	a5,-21(s0)
    80200ee8:	feb44783          	lbu	a5,-21(s0)
    80200eec:	0007871b          	sext.w	a4,a5
    80200ef0:	00017797          	auipc	a5,0x17
    80200ef4:	00078793          	mv	a5,a5
    80200ef8:	6794                	ld	a3,8(a5)
    80200efa:	87ba                	mv	a5,a4
    80200efc:	8b9d                	andi	a5,a5,7
    80200efe:	0007871b          	sext.w	a4,a5
    80200f02:	fec46783          	lwu	a5,-20(s0)
    80200f06:	078a                	slli	a5,a5,0x2
    80200f08:	97b6                	add	a5,a5,a3
    80200f0a:	c398                	sw	a4,0(a5)
    80200f0c:	0001                	nop
    80200f0e:	6462                	ld	s0,24(sp)
    80200f10:	6105                	addi	sp,sp,32
    80200f12:	8082                	ret

0000000080200f14 <plic_set_threshold>:
    80200f14:	1101                	addi	sp,sp,-32
    80200f16:	ec22                	sd	s0,24(sp)
    80200f18:	1000                	addi	s0,sp,32
    80200f1a:	87aa                	mv	a5,a0
    80200f1c:	fef407a3          	sb	a5,-17(s0)
    80200f20:	fef44783          	lbu	a5,-17(s0)
    80200f24:	0007871b          	sext.w	a4,a5
    80200f28:	00017797          	auipc	a5,0x17
    80200f2c:	fc878793          	addi	a5,a5,-56 # 80217ef0 <plic_device>
    80200f30:	6794                	ld	a3,8(a5)
    80200f32:	87ba                	mv	a5,a4
    80200f34:	8b9d                	andi	a5,a5,7
    80200f36:	0007871b          	sext.w	a4,a5
    80200f3a:	002017b7          	lui	a5,0x201
    80200f3e:	97b6                	add	a5,a5,a3
    80200f40:	c398                	sw	a4,0(a5)
    80200f42:	0001                	nop
    80200f44:	6462                	ld	s0,24(sp)
    80200f46:	6105                	addi	sp,sp,32
    80200f48:	8082                	ret

0000000080200f4a <plic_claim>:
    80200f4a:	1141                	addi	sp,sp,-16
    80200f4c:	e422                	sd	s0,8(sp)
    80200f4e:	0800                	addi	s0,sp,16
    80200f50:	00017797          	auipc	a5,0x17
    80200f54:	fa078793          	addi	a5,a5,-96 # 80217ef0 <plic_device>
    80200f58:	6798                	ld	a4,8(a5)
    80200f5a:	002017b7          	lui	a5,0x201
    80200f5e:	97ba                	add	a5,a5,a4
    80200f60:	43dc                	lw	a5,4(a5)
    80200f62:	2781                	sext.w	a5,a5
    80200f64:	853e                	mv	a0,a5
    80200f66:	6422                	ld	s0,8(sp)
    80200f68:	0141                	addi	sp,sp,16
    80200f6a:	8082                	ret

0000000080200f6c <plic_complete>:
    80200f6c:	1101                	addi	sp,sp,-32
    80200f6e:	ec22                	sd	s0,24(sp)
    80200f70:	1000                	addi	s0,sp,32
    80200f72:	87aa                	mv	a5,a0
    80200f74:	fef42623          	sw	a5,-20(s0)
    80200f78:	00017797          	auipc	a5,0x17
    80200f7c:	f7878793          	addi	a5,a5,-136 # 80217ef0 <plic_device>
    80200f80:	6798                	ld	a4,8(a5)
    80200f82:	002017b7          	lui	a5,0x201
    80200f86:	97ba                	add	a5,a5,a4
    80200f88:	fec42703          	lw	a4,-20(s0)
    80200f8c:	c3d8                	sw	a4,4(a5)
    80200f8e:	0001                	nop
    80200f90:	6462                	ld	s0,24(sp)
    80200f92:	6105                	addi	sp,sp,32
    80200f94:	8082                	ret

0000000080200f96 <plic_is_pending>:
    80200f96:	7179                	addi	sp,sp,-48
    80200f98:	f422                	sd	s0,40(sp)
    80200f9a:	1800                	addi	s0,sp,48
    80200f9c:	87aa                	mv	a5,a0
    80200f9e:	fcf42e23          	sw	a5,-36(s0)
    80200fa2:	00017797          	auipc	a5,0x17
    80200fa6:	f4e78793          	addi	a5,a5,-178 # 80217ef0 <plic_device>
    80200faa:	6798                	ld	a4,8(a5)
    80200fac:	6785                	lui	a5,0x1
    80200fae:	97ba                	add	a5,a5,a4
    80200fb0:	fef43423          	sd	a5,-24(s0)
    80200fb4:	fdc42783          	lw	a5,-36(s0)
    80200fb8:	0057d79b          	srliw	a5,a5,0x5
    80200fbc:	2781                	sext.w	a5,a5
    80200fbe:	1782                	slli	a5,a5,0x20
    80200fc0:	9381                	srli	a5,a5,0x20
    80200fc2:	078a                	slli	a5,a5,0x2
    80200fc4:	fe843703          	ld	a4,-24(s0)
    80200fc8:	97ba                	add	a5,a5,a4
    80200fca:	439c                	lw	a5,0(a5)
    80200fcc:	0007869b          	sext.w	a3,a5
    80200fd0:	fdc42783          	lw	a5,-36(s0)
    80200fd4:	8bfd                	andi	a5,a5,31
    80200fd6:	2781                	sext.w	a5,a5
    80200fd8:	4705                	li	a4,1
    80200fda:	00f717bb          	sllw	a5,a4,a5
    80200fde:	2781                	sext.w	a5,a5
    80200fe0:	2781                	sext.w	a5,a5
    80200fe2:	8736                	mv	a4,a3
    80200fe4:	8ff9                	and	a5,a5,a4
    80200fe6:	2781                	sext.w	a5,a5
    80200fe8:	853e                	mv	a0,a5
    80200fea:	7422                	ld	s0,40(sp)
    80200fec:	6145                	addi	sp,sp,48
    80200fee:	8082                	ret

0000000080200ff0 <external_handler>:
    80200ff0:	7179                	addi	sp,sp,-48
    80200ff2:	f406                	sd	ra,40(sp)
    80200ff4:	f022                	sd	s0,32(sp)
    80200ff6:	1800                	addi	s0,sp,48
    80200ff8:	fca43c23          	sd	a0,-40(s0)
    80200ffc:	f4fff0ef          	jal	ra,80200f4a <plic_claim>
    80201000:	87aa                	mv	a5,a0
    80201002:	fef42623          	sw	a5,-20(s0)
    80201006:	fec42783          	lw	a5,-20(s0)
    8020100a:	0007871b          	sext.w	a4,a5
    8020100e:	0a000793          	li	a5,160
    80201012:	08f70463          	beq	a4,a5,8020109a <external_handler+0xaa>
    80201016:	fec42783          	lw	a5,-20(s0)
    8020101a:	0007871b          	sext.w	a4,a5
    8020101e:	0a000793          	li	a5,160
    80201022:	0ce7e463          	bltu	a5,a4,802010ea <external_handler+0xfa>
    80201026:	fec42783          	lw	a5,-20(s0)
    8020102a:	0007871b          	sext.w	a4,a5
    8020102e:	47c9                	li	a5,18
    80201030:	06f70263          	beq	a4,a5,80201094 <external_handler+0xa4>
    80201034:	fec42783          	lw	a5,-20(s0)
    80201038:	0007871b          	sext.w	a4,a5
    8020103c:	47c9                	li	a5,18
    8020103e:	0ae7e663          	bltu	a5,a4,802010ea <external_handler+0xfa>
    80201042:	fec42783          	lw	a5,-20(s0)
    80201046:	0007871b          	sext.w	a4,a5
    8020104a:	47ad                	li	a5,11
    8020104c:	04f70763          	beq	a4,a5,8020109a <external_handler+0xaa>
    80201050:	fec42783          	lw	a5,-20(s0)
    80201054:	0007871b          	sext.w	a4,a5
    80201058:	47ad                	li	a5,11
    8020105a:	08e7e863          	bltu	a5,a4,802010ea <external_handler+0xfa>
    8020105e:	fec42783          	lw	a5,-20(s0)
    80201062:	0007871b          	sext.w	a4,a5
    80201066:	47a1                	li	a5,8
    80201068:	00e7e763          	bltu	a5,a4,80201076 <external_handler+0x86>
    8020106c:	fec42783          	lw	a5,-20(s0)
    80201070:	2781                	sext.w	a5,a5
    80201072:	eb91                	bnez	a5,80201086 <external_handler+0x96>
    80201074:	a89d                	j	802010ea <external_handler+0xfa>
    80201076:	fec42783          	lw	a5,-20(s0)
    8020107a:	0007871b          	sext.w	a4,a5
    8020107e:	47a9                	li	a5,10
    80201080:	00f70a63          	beq	a4,a5,80201094 <external_handler+0xa4>
    80201084:	a09d                	j	802010ea <external_handler+0xfa>
    80201086:	00002517          	auipc	a0,0x2
    8020108a:	33a50513          	addi	a0,a0,826 # 802033c0 <rodata_start+0x3c0>
    8020108e:	60c010ef          	jal	ra,8020269a <kprintf>
    80201092:	a0ad                	j	802010fc <external_handler+0x10c>
    80201094:	361000ef          	jal	ra,80201bf4 <uart_interrupt_handler>
    80201098:	a095                	j	802010fc <external_handler+0x10c>
    8020109a:	1ab000ef          	jal	ra,80201a44 <rtc_interrupt_handler>
    8020109e:	00002517          	auipc	a0,0x2
    802010a2:	32a50513          	addi	a0,a0,810 # 802033c8 <rodata_start+0x3c8>
    802010a6:	5f4010ef          	jal	ra,8020269a <kprintf>
    802010aa:	10f000ef          	jal	ra,802019b8 <read_time>
    802010ae:	872a                	mv	a4,a0
    802010b0:	3b9ad7b7          	lui	a5,0x3b9ad
    802010b4:	a0078793          	addi	a5,a5,-1536 # 3b9aca00 <XLENB+0x3b9ac9f8>
    802010b8:	97ba                	add	a5,a5,a4
    802010ba:	853e                	mv	a0,a5
    802010bc:	163000ef          	jal	ra,80201a1e <set_alarm>
    802010c0:	0f9000ef          	jal	ra,802019b8 <read_time>
    802010c4:	87aa                	mv	a5,a0
    802010c6:	85be                	mv	a1,a5
    802010c8:	00002517          	auipc	a0,0x2
    802010cc:	31050513          	addi	a0,a0,784 # 802033d8 <rodata_start+0x3d8>
    802010d0:	5ca010ef          	jal	ra,8020269a <kprintf>
    802010d4:	12b000ef          	jal	ra,802019fe <read_alarm>
    802010d8:	87aa                	mv	a5,a0
    802010da:	85be                	mv	a1,a5
    802010dc:	00002517          	auipc	a0,0x2
    802010e0:	31450513          	addi	a0,a0,788 # 802033f0 <rodata_start+0x3f0>
    802010e4:	5b6010ef          	jal	ra,8020269a <kprintf>
    802010e8:	a811                	j	802010fc <external_handler+0x10c>
    802010ea:	fec42783          	lw	a5,-20(s0)
    802010ee:	85be                	mv	a1,a5
    802010f0:	00002517          	auipc	a0,0x2
    802010f4:	31850513          	addi	a0,a0,792 # 80203408 <rodata_start+0x408>
    802010f8:	5a2010ef          	jal	ra,8020269a <kprintf>
    802010fc:	fec42783          	lw	a5,-20(s0)
    80201100:	853e                	mv	a0,a5
    80201102:	e6bff0ef          	jal	ra,80200f6c <plic_complete>
    80201106:	fd843783          	ld	a5,-40(s0)
    8020110a:	853e                	mv	a0,a5
    8020110c:	70a2                	ld	ra,40(sp)
    8020110e:	7402                	ld	s0,32(sp)
    80201110:	6145                	addi	sp,sp,48
    80201112:	8082                	ret

0000000080201114 <set_stvec>:
    80201114:	1141                	addi	sp,sp,-16
    80201116:	e422                	sd	s0,8(sp)
    80201118:	0800                	addi	s0,sp,16
    8020111a:	00003797          	auipc	a5,0x3
    8020111e:	fa67b783          	ld	a5,-90(a5) # 802040c0 <_GLOBAL_OFFSET_TABLE_+0x10>
    80201122:	10579073          	csrw	stvec,a5
    80201126:	0001                	nop
    80201128:	6422                	ld	s0,8(sp)
    8020112a:	0141                	addi	sp,sp,16
    8020112c:	8082                	ret

000000008020112e <trap>:
    8020112e:	1101                	addi	sp,sp,-32
    80201130:	ec06                	sd	ra,24(sp)
    80201132:	e822                	sd	s0,16(sp)
    80201134:	1000                	addi	s0,sp,32
    80201136:	fea43423          	sd	a0,-24(s0)
    8020113a:	fe843503          	ld	a0,-24(s0)
    8020113e:	010000ef          	jal	ra,8020114e <trap_dispatch>
    80201142:	87aa                	mv	a5,a0
    80201144:	853e                	mv	a0,a5
    80201146:	60e2                	ld	ra,24(sp)
    80201148:	6442                	ld	s0,16(sp)
    8020114a:	6105                	addi	sp,sp,32
    8020114c:	8082                	ret

000000008020114e <trap_dispatch>:
    8020114e:	1101                	addi	sp,sp,-32
    80201150:	ec06                	sd	ra,24(sp)
    80201152:	e822                	sd	s0,16(sp)
    80201154:	1000                	addi	s0,sp,32
    80201156:	fea43423          	sd	a0,-24(s0)
    8020115a:	fe843783          	ld	a5,-24(s0)
    8020115e:	1187b783          	ld	a5,280(a5)
    80201162:	0007d863          	bgez	a5,80201172 <trap_dispatch+0x24>
    80201166:	fe843503          	ld	a0,-24(s0)
    8020116a:	01c000ef          	jal	ra,80201186 <interrupt_handler>
    8020116e:	87aa                	mv	a5,a0
    80201170:	a031                	j	8020117c <trap_dispatch+0x2e>
    80201172:	fe843503          	ld	a0,-24(s0)
    80201176:	17c000ef          	jal	ra,802012f2 <exception_handler>
    8020117a:	87aa                	mv	a5,a0
    8020117c:	853e                	mv	a0,a5
    8020117e:	60e2                	ld	ra,24(sp)
    80201180:	6442                	ld	s0,16(sp)
    80201182:	6105                	addi	sp,sp,32
    80201184:	8082                	ret

0000000080201186 <interrupt_handler>:
    80201186:	7179                	addi	sp,sp,-48
    80201188:	f406                	sd	ra,40(sp)
    8020118a:	f022                	sd	s0,32(sp)
    8020118c:	1800                	addi	s0,sp,48
    8020118e:	fca43c23          	sd	a0,-40(s0)
    80201192:	fd843783          	ld	a5,-40(s0)
    80201196:	1187b783          	ld	a5,280(a5)
    8020119a:	873e                	mv	a4,a5
    8020119c:	57fd                	li	a5,-1
    8020119e:	8385                	srli	a5,a5,0x1
    802011a0:	8ff9                	and	a5,a5,a4
    802011a2:	fef43423          	sd	a5,-24(s0)
    802011a6:	fe843703          	ld	a4,-24(s0)
    802011aa:	47ad                	li	a5,11
    802011ac:	12e7e763          	bltu	a5,a4,802012da <interrupt_handler+0x154>
    802011b0:	fe843783          	ld	a5,-24(s0)
    802011b4:	00279713          	slli	a4,a5,0x2
    802011b8:	00002797          	auipc	a5,0x2
    802011bc:	3b478793          	addi	a5,a5,948 # 8020356c <rodata_start+0x56c>
    802011c0:	97ba                	add	a5,a5,a4
    802011c2:	439c                	lw	a5,0(a5)
    802011c4:	0007871b          	sext.w	a4,a5
    802011c8:	00002797          	auipc	a5,0x2
    802011cc:	3a478793          	addi	a5,a5,932 # 8020356c <rodata_start+0x56c>
    802011d0:	97ba                	add	a5,a5,a4
    802011d2:	8782                	jr	a5
    802011d4:	00002517          	auipc	a0,0x2
    802011d8:	25450513          	addi	a0,a0,596 # 80203428 <rodata_start+0x428>
    802011dc:	460010ef          	jal	ra,8020263c <kputs>
    802011e0:	a211                	j	802012e4 <interrupt_handler+0x15e>
    802011e2:	00002517          	auipc	a0,0x2
    802011e6:	26650513          	addi	a0,a0,614 # 80203448 <rodata_start+0x448>
    802011ea:	452010ef          	jal	ra,8020263c <kputs>
    802011ee:	a8dd                	j	802012e4 <interrupt_handler+0x15e>
    802011f0:	00002517          	auipc	a0,0x2
    802011f4:	27850513          	addi	a0,a0,632 # 80203468 <rodata_start+0x468>
    802011f8:	444010ef          	jal	ra,8020263c <kputs>
    802011fc:	a0e5                	j	802012e4 <interrupt_handler+0x15e>
    802011fe:	00002517          	auipc	a0,0x2
    80201202:	28a50513          	addi	a0,a0,650 # 80203488 <rodata_start+0x488>
    80201206:	436010ef          	jal	ra,8020263c <kputs>
    8020120a:	a8e9                	j	802012e4 <interrupt_handler+0x15e>
    8020120c:	00002517          	auipc	a0,0x2
    80201210:	29c50513          	addi	a0,a0,668 # 802034a8 <rodata_start+0x4a8>
    80201214:	428010ef          	jal	ra,8020263c <kputs>
    80201218:	a0f1                	j	802012e4 <interrupt_handler+0x15e>
    8020121a:	f1bfe0ef          	jal	ra,80200134 <clock_set_next_event>
    8020121e:	00003797          	auipc	a5,0x3
    80201222:	eba7b783          	ld	a5,-326(a5) # 802040d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80201226:	639c                	ld	a5,0(a5)
    80201228:	0785                	addi	a5,a5,1
    8020122a:	00003717          	auipc	a4,0x3
    8020122e:	eae73703          	ld	a4,-338(a4) # 802040d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80201232:	e31c                	sd	a5,0(a4)
    80201234:	06400713          	li	a4,100
    80201238:	02e7f7b3          	remu	a5,a5,a4
    8020123c:	e3b1                	bnez	a5,80201280 <interrupt_handler+0xfa>
    8020123e:	00003797          	auipc	a5,0x3
    80201242:	e9a7b783          	ld	a5,-358(a5) # 802040d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    80201246:	639c                	ld	a5,0(a5)
    80201248:	85be                	mv	a1,a5
    8020124a:	00002517          	auipc	a0,0x2
    8020124e:	27650513          	addi	a0,a0,630 # 802034c0 <rodata_start+0x4c0>
    80201252:	448010ef          	jal	ra,8020269a <kprintf>
    80201256:	00003797          	auipc	a5,0x3
    8020125a:	e827b783          	ld	a5,-382(a5) # 802040d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    8020125e:	639c                	ld	a5,0(a5)
    80201260:	0785                	addi	a5,a5,1
    80201262:	00003717          	auipc	a4,0x3
    80201266:	e7673703          	ld	a4,-394(a4) # 802040d8 <_GLOBAL_OFFSET_TABLE_+0x28>
    8020126a:	e31c                	sd	a5,0(a4)
    8020126c:	06400713          	li	a4,100
    80201270:	02e7d733          	divu	a4,a5,a4
    80201274:	06400793          	li	a5,100
    80201278:	00f71463          	bne	a4,a5,80201280 <interrupt_handler+0xfa>
    8020127c:	0cb010ef          	jal	ra,80202b46 <sbi_shutdown>
    80201280:	100167f3          	csrrsi	a5,sstatus,2
    80201284:	fef43023          	sd	a5,-32(s0)
    80201288:	a8b1                	j	802012e4 <interrupt_handler+0x15e>
    8020128a:	00002517          	auipc	a0,0x2
    8020128e:	24650513          	addi	a0,a0,582 # 802034d0 <rodata_start+0x4d0>
    80201292:	3aa010ef          	jal	ra,8020263c <kputs>
    80201296:	a0b9                	j	802012e4 <interrupt_handler+0x15e>
    80201298:	00002517          	auipc	a0,0x2
    8020129c:	25850513          	addi	a0,a0,600 # 802034f0 <rodata_start+0x4f0>
    802012a0:	39c010ef          	jal	ra,8020263c <kputs>
    802012a4:	a081                	j	802012e4 <interrupt_handler+0x15e>
    802012a6:	00002517          	auipc	a0,0x2
    802012aa:	26a50513          	addi	a0,a0,618 # 80203510 <rodata_start+0x510>
    802012ae:	38e010ef          	jal	ra,8020263c <kputs>
    802012b2:	a80d                	j	802012e4 <interrupt_handler+0x15e>
    802012b4:	fd843503          	ld	a0,-40(s0)
    802012b8:	d39ff0ef          	jal	ra,80200ff0 <external_handler>
    802012bc:	a025                	j	802012e4 <interrupt_handler+0x15e>
    802012be:	00002517          	auipc	a0,0x2
    802012c2:	27250513          	addi	a0,a0,626 # 80203530 <rodata_start+0x530>
    802012c6:	376010ef          	jal	ra,8020263c <kputs>
    802012ca:	a829                	j	802012e4 <interrupt_handler+0x15e>
    802012cc:	00002517          	auipc	a0,0x2
    802012d0:	28450513          	addi	a0,a0,644 # 80203550 <rodata_start+0x550>
    802012d4:	368010ef          	jal	ra,8020263c <kputs>
    802012d8:	a031                	j	802012e4 <interrupt_handler+0x15e>
    802012da:	fd843503          	ld	a0,-40(s0)
    802012de:	1b2000ef          	jal	ra,80201490 <print_trapframe>
    802012e2:	0001                	nop
    802012e4:	fd843783          	ld	a5,-40(s0)
    802012e8:	853e                	mv	a0,a5
    802012ea:	70a2                	ld	ra,40(sp)
    802012ec:	7402                	ld	s0,32(sp)
    802012ee:	6145                	addi	sp,sp,48
    802012f0:	8082                	ret

00000000802012f2 <exception_handler>:
    802012f2:	1101                	addi	sp,sp,-32
    802012f4:	ec06                	sd	ra,24(sp)
    802012f6:	e822                	sd	s0,16(sp)
    802012f8:	1000                	addi	s0,sp,32
    802012fa:	fea43423          	sd	a0,-24(s0)
    802012fe:	fe843783          	ld	a5,-24(s0)
    80201302:	1187b783          	ld	a5,280(a5)
    80201306:	473d                	li	a4,15
    80201308:	14f76f63          	bltu	a4,a5,80201466 <exception_handler+0x174>
    8020130c:	00279713          	slli	a4,a5,0x2
    80201310:	00002797          	auipc	a5,0x2
    80201314:	38c78793          	addi	a5,a5,908 # 8020369c <rodata_start+0x69c>
    80201318:	97ba                	add	a5,a5,a4
    8020131a:	439c                	lw	a5,0(a5)
    8020131c:	0007871b          	sext.w	a4,a5
    80201320:	00002797          	auipc	a5,0x2
    80201324:	37c78793          	addi	a5,a5,892 # 8020369c <rodata_start+0x69c>
    80201328:	97ba                	add	a5,a5,a4
    8020132a:	8782                	jr	a5
    8020132c:	00002517          	auipc	a0,0x2
    80201330:	27450513          	addi	a0,a0,628 # 802035a0 <rodata_start+0x5a0>
    80201334:	308010ef          	jal	ra,8020263c <kputs>
    80201338:	fe843503          	ld	a0,-24(s0)
    8020133c:	154000ef          	jal	ra,80201490 <print_trapframe>
    80201340:	007010ef          	jal	ra,80202b46 <sbi_shutdown>
    80201344:	aa3d                	j	80201482 <exception_handler+0x190>
    80201346:	00002517          	auipc	a0,0x2
    8020134a:	27250513          	addi	a0,a0,626 # 802035b8 <rodata_start+0x5b8>
    8020134e:	2ee010ef          	jal	ra,8020263c <kputs>
    80201352:	fe843503          	ld	a0,-24(s0)
    80201356:	13a000ef          	jal	ra,80201490 <print_trapframe>
    8020135a:	7ec010ef          	jal	ra,80202b46 <sbi_shutdown>
    8020135e:	a215                	j	80201482 <exception_handler+0x190>
    80201360:	fe843783          	ld	a5,-24(s0)
    80201364:	1087b783          	ld	a5,264(a5)
    80201368:	85be                	mv	a1,a5
    8020136a:	00002517          	auipc	a0,0x2
    8020136e:	25e50513          	addi	a0,a0,606 # 802035c8 <rodata_start+0x5c8>
    80201372:	328010ef          	jal	ra,8020269a <kprintf>
    80201376:	a231                	j	80201482 <exception_handler+0x190>
    80201378:	00002517          	auipc	a0,0x2
    8020137c:	26850513          	addi	a0,a0,616 # 802035e0 <rodata_start+0x5e0>
    80201380:	2bc010ef          	jal	ra,8020263c <kputs>
    80201384:	fe843503          	ld	a0,-24(s0)
    80201388:	108000ef          	jal	ra,80201490 <print_trapframe>
    8020138c:	fe843783          	ld	a5,-24(s0)
    80201390:	1087b783          	ld	a5,264(a5)
    80201394:	00278713          	addi	a4,a5,2
    80201398:	fe843783          	ld	a5,-24(s0)
    8020139c:	10e7b423          	sd	a4,264(a5)
    802013a0:	a0cd                	j	80201482 <exception_handler+0x190>
    802013a2:	00002517          	auipc	a0,0x2
    802013a6:	24e50513          	addi	a0,a0,590 # 802035f0 <rodata_start+0x5f0>
    802013aa:	292010ef          	jal	ra,8020263c <kputs>
    802013ae:	fe843503          	ld	a0,-24(s0)
    802013b2:	0de000ef          	jal	ra,80201490 <print_trapframe>
    802013b6:	790010ef          	jal	ra,80202b46 <sbi_shutdown>
    802013ba:	a0e1                	j	80201482 <exception_handler+0x190>
    802013bc:	00002517          	auipc	a0,0x2
    802013c0:	24450513          	addi	a0,a0,580 # 80203600 <rodata_start+0x600>
    802013c4:	278010ef          	jal	ra,8020263c <kputs>
    802013c8:	fe843503          	ld	a0,-24(s0)
    802013cc:	0c4000ef          	jal	ra,80201490 <print_trapframe>
    802013d0:	776010ef          	jal	ra,80202b46 <sbi_shutdown>
    802013d4:	a07d                	j	80201482 <exception_handler+0x190>
    802013d6:	00002517          	auipc	a0,0x2
    802013da:	23a50513          	addi	a0,a0,570 # 80203610 <rodata_start+0x610>
    802013de:	25e010ef          	jal	ra,8020263c <kputs>
    802013e2:	fe843503          	ld	a0,-24(s0)
    802013e6:	0aa000ef          	jal	ra,80201490 <print_trapframe>
    802013ea:	75c010ef          	jal	ra,80202b46 <sbi_shutdown>
    802013ee:	a851                	j	80201482 <exception_handler+0x190>
    802013f0:	00002517          	auipc	a0,0x2
    802013f4:	23850513          	addi	a0,a0,568 # 80203628 <rodata_start+0x628>
    802013f8:	244010ef          	jal	ra,8020263c <kputs>
    802013fc:	fe843503          	ld	a0,-24(s0)
    80201400:	090000ef          	jal	ra,80201490 <print_trapframe>
    80201404:	742010ef          	jal	ra,80202b46 <sbi_shutdown>
    80201408:	a8ad                	j	80201482 <exception_handler+0x190>
    8020140a:	00002517          	auipc	a0,0x2
    8020140e:	22e50513          	addi	a0,a0,558 # 80203638 <rodata_start+0x638>
    80201412:	22a010ef          	jal	ra,8020263c <kputs>
    80201416:	a0b5                	j	80201482 <exception_handler+0x190>
    80201418:	00002517          	auipc	a0,0x2
    8020141c:	23050513          	addi	a0,a0,560 # 80203648 <rodata_start+0x648>
    80201420:	21c010ef          	jal	ra,8020263c <kputs>
    80201424:	fe843503          	ld	a0,-24(s0)
    80201428:	068000ef          	jal	ra,80201490 <print_trapframe>
    8020142c:	71a010ef          	jal	ra,80202b46 <sbi_shutdown>
    80201430:	a889                	j	80201482 <exception_handler+0x190>
    80201432:	00002517          	auipc	a0,0x2
    80201436:	22e50513          	addi	a0,a0,558 # 80203660 <rodata_start+0x660>
    8020143a:	202010ef          	jal	ra,8020263c <kputs>
    8020143e:	fe843503          	ld	a0,-24(s0)
    80201442:	04e000ef          	jal	ra,80201490 <print_trapframe>
    80201446:	700010ef          	jal	ra,80202b46 <sbi_shutdown>
    8020144a:	a825                	j	80201482 <exception_handler+0x190>
    8020144c:	00002517          	auipc	a0,0x2
    80201450:	22c50513          	addi	a0,a0,556 # 80203678 <rodata_start+0x678>
    80201454:	1e8010ef          	jal	ra,8020263c <kputs>
    80201458:	fe843503          	ld	a0,-24(s0)
    8020145c:	034000ef          	jal	ra,80201490 <print_trapframe>
    80201460:	6e6010ef          	jal	ra,80202b46 <sbi_shutdown>
    80201464:	a839                	j	80201482 <exception_handler+0x190>
    80201466:	00002517          	auipc	a0,0x2
    8020146a:	22250513          	addi	a0,a0,546 # 80203688 <rodata_start+0x688>
    8020146e:	1ce010ef          	jal	ra,8020263c <kputs>
    80201472:	fe843503          	ld	a0,-24(s0)
    80201476:	01a000ef          	jal	ra,80201490 <print_trapframe>
    8020147a:	6cc010ef          	jal	ra,80202b46 <sbi_shutdown>
    8020147e:	a011                	j	80201482 <exception_handler+0x190>
    80201480:	0001                	nop
    80201482:	fe843783          	ld	a5,-24(s0)
    80201486:	853e                	mv	a0,a5
    80201488:	60e2                	ld	ra,24(sp)
    8020148a:	6442                	ld	s0,16(sp)
    8020148c:	6105                	addi	sp,sp,32
    8020148e:	8082                	ret

0000000080201490 <print_trapframe>:
    80201490:	1101                	addi	sp,sp,-32
    80201492:	ec06                	sd	ra,24(sp)
    80201494:	e822                	sd	s0,16(sp)
    80201496:	1000                	addi	s0,sp,32
    80201498:	fea43423          	sd	a0,-24(s0)
    8020149c:	fe843583          	ld	a1,-24(s0)
    802014a0:	00002517          	auipc	a0,0x2
    802014a4:	24050513          	addi	a0,a0,576 # 802036e0 <rodata_start+0x6e0>
    802014a8:	1f2010ef          	jal	ra,8020269a <kprintf>
    802014ac:	fe843783          	ld	a5,-24(s0)
    802014b0:	853e                	mv	a0,a5
    802014b2:	072000ef          	jal	ra,80201524 <print_regs>
    802014b6:	00002517          	auipc	a0,0x2
    802014ba:	24250513          	addi	a0,a0,578 # 802036f8 <rodata_start+0x6f8>
    802014be:	1dc010ef          	jal	ra,8020269a <kprintf>
    802014c2:	fe843783          	ld	a5,-24(s0)
    802014c6:	1007b783          	ld	a5,256(a5)
    802014ca:	85be                	mv	a1,a5
    802014cc:	00002517          	auipc	a0,0x2
    802014d0:	24450513          	addi	a0,a0,580 # 80203710 <rodata_start+0x710>
    802014d4:	1c6010ef          	jal	ra,8020269a <kprintf>
    802014d8:	fe843783          	ld	a5,-24(s0)
    802014dc:	1087b783          	ld	a5,264(a5)
    802014e0:	85be                	mv	a1,a5
    802014e2:	00002517          	auipc	a0,0x2
    802014e6:	24650513          	addi	a0,a0,582 # 80203728 <rodata_start+0x728>
    802014ea:	1b0010ef          	jal	ra,8020269a <kprintf>
    802014ee:	fe843783          	ld	a5,-24(s0)
    802014f2:	1107b783          	ld	a5,272(a5)
    802014f6:	85be                	mv	a1,a5
    802014f8:	00002517          	auipc	a0,0x2
    802014fc:	24850513          	addi	a0,a0,584 # 80203740 <rodata_start+0x740>
    80201500:	19a010ef          	jal	ra,8020269a <kprintf>
    80201504:	fe843783          	ld	a5,-24(s0)
    80201508:	1187b783          	ld	a5,280(a5)
    8020150c:	85be                	mv	a1,a5
    8020150e:	00002517          	auipc	a0,0x2
    80201512:	24a50513          	addi	a0,a0,586 # 80203758 <rodata_start+0x758>
    80201516:	184010ef          	jal	ra,8020269a <kprintf>
    8020151a:	0001                	nop
    8020151c:	60e2                	ld	ra,24(sp)
    8020151e:	6442                	ld	s0,16(sp)
    80201520:	6105                	addi	sp,sp,32
    80201522:	8082                	ret

0000000080201524 <print_regs>:
    80201524:	1101                	addi	sp,sp,-32
    80201526:	ec06                	sd	ra,24(sp)
    80201528:	e822                	sd	s0,16(sp)
    8020152a:	1000                	addi	s0,sp,32
    8020152c:	fea43423          	sd	a0,-24(s0)
    80201530:	00002517          	auipc	a0,0x2
    80201534:	24050513          	addi	a0,a0,576 # 80203770 <rodata_start+0x770>
    80201538:	162010ef          	jal	ra,8020269a <kprintf>
    8020153c:	fe843783          	ld	a5,-24(s0)
    80201540:	639c                	ld	a5,0(a5)
    80201542:	85be                	mv	a1,a5
    80201544:	00002517          	auipc	a0,0x2
    80201548:	23c50513          	addi	a0,a0,572 # 80203780 <rodata_start+0x780>
    8020154c:	14e010ef          	jal	ra,8020269a <kprintf>
    80201550:	fe843783          	ld	a5,-24(s0)
    80201554:	679c                	ld	a5,8(a5)
    80201556:	85be                	mv	a1,a5
    80201558:	00002517          	auipc	a0,0x2
    8020155c:	24050513          	addi	a0,a0,576 # 80203798 <rodata_start+0x798>
    80201560:	13a010ef          	jal	ra,8020269a <kprintf>
    80201564:	fe843783          	ld	a5,-24(s0)
    80201568:	6b9c                	ld	a5,16(a5)
    8020156a:	85be                	mv	a1,a5
    8020156c:	00002517          	auipc	a0,0x2
    80201570:	24450513          	addi	a0,a0,580 # 802037b0 <rodata_start+0x7b0>
    80201574:	126010ef          	jal	ra,8020269a <kprintf>
    80201578:	fe843783          	ld	a5,-24(s0)
    8020157c:	6f9c                	ld	a5,24(a5)
    8020157e:	85be                	mv	a1,a5
    80201580:	00002517          	auipc	a0,0x2
    80201584:	24850513          	addi	a0,a0,584 # 802037c8 <rodata_start+0x7c8>
    80201588:	112010ef          	jal	ra,8020269a <kprintf>
    8020158c:	fe843783          	ld	a5,-24(s0)
    80201590:	739c                	ld	a5,32(a5)
    80201592:	85be                	mv	a1,a5
    80201594:	00002517          	auipc	a0,0x2
    80201598:	24c50513          	addi	a0,a0,588 # 802037e0 <rodata_start+0x7e0>
    8020159c:	0fe010ef          	jal	ra,8020269a <kprintf>
    802015a0:	fe843783          	ld	a5,-24(s0)
    802015a4:	779c                	ld	a5,40(a5)
    802015a6:	85be                	mv	a1,a5
    802015a8:	00002517          	auipc	a0,0x2
    802015ac:	25050513          	addi	a0,a0,592 # 802037f8 <rodata_start+0x7f8>
    802015b0:	0ea010ef          	jal	ra,8020269a <kprintf>
    802015b4:	fe843783          	ld	a5,-24(s0)
    802015b8:	7b9c                	ld	a5,48(a5)
    802015ba:	85be                	mv	a1,a5
    802015bc:	00002517          	auipc	a0,0x2
    802015c0:	25450513          	addi	a0,a0,596 # 80203810 <rodata_start+0x810>
    802015c4:	0d6010ef          	jal	ra,8020269a <kprintf>
    802015c8:	fe843783          	ld	a5,-24(s0)
    802015cc:	7f9c                	ld	a5,56(a5)
    802015ce:	85be                	mv	a1,a5
    802015d0:	00002517          	auipc	a0,0x2
    802015d4:	25850513          	addi	a0,a0,600 # 80203828 <rodata_start+0x828>
    802015d8:	0c2010ef          	jal	ra,8020269a <kprintf>
    802015dc:	fe843783          	ld	a5,-24(s0)
    802015e0:	63bc                	ld	a5,64(a5)
    802015e2:	85be                	mv	a1,a5
    802015e4:	00002517          	auipc	a0,0x2
    802015e8:	25c50513          	addi	a0,a0,604 # 80203840 <rodata_start+0x840>
    802015ec:	0ae010ef          	jal	ra,8020269a <kprintf>
    802015f0:	fe843783          	ld	a5,-24(s0)
    802015f4:	67bc                	ld	a5,72(a5)
    802015f6:	85be                	mv	a1,a5
    802015f8:	00002517          	auipc	a0,0x2
    802015fc:	26050513          	addi	a0,a0,608 # 80203858 <rodata_start+0x858>
    80201600:	09a010ef          	jal	ra,8020269a <kprintf>
    80201604:	fe843783          	ld	a5,-24(s0)
    80201608:	6bbc                	ld	a5,80(a5)
    8020160a:	85be                	mv	a1,a5
    8020160c:	00002517          	auipc	a0,0x2
    80201610:	26450513          	addi	a0,a0,612 # 80203870 <rodata_start+0x870>
    80201614:	086010ef          	jal	ra,8020269a <kprintf>
    80201618:	fe843783          	ld	a5,-24(s0)
    8020161c:	6fbc                	ld	a5,88(a5)
    8020161e:	85be                	mv	a1,a5
    80201620:	00002517          	auipc	a0,0x2
    80201624:	26850513          	addi	a0,a0,616 # 80203888 <rodata_start+0x888>
    80201628:	072010ef          	jal	ra,8020269a <kprintf>
    8020162c:	fe843783          	ld	a5,-24(s0)
    80201630:	73bc                	ld	a5,96(a5)
    80201632:	85be                	mv	a1,a5
    80201634:	00002517          	auipc	a0,0x2
    80201638:	26c50513          	addi	a0,a0,620 # 802038a0 <rodata_start+0x8a0>
    8020163c:	05e010ef          	jal	ra,8020269a <kprintf>
    80201640:	fe843783          	ld	a5,-24(s0)
    80201644:	77bc                	ld	a5,104(a5)
    80201646:	85be                	mv	a1,a5
    80201648:	00002517          	auipc	a0,0x2
    8020164c:	27050513          	addi	a0,a0,624 # 802038b8 <rodata_start+0x8b8>
    80201650:	04a010ef          	jal	ra,8020269a <kprintf>
    80201654:	fe843783          	ld	a5,-24(s0)
    80201658:	7bbc                	ld	a5,112(a5)
    8020165a:	85be                	mv	a1,a5
    8020165c:	00002517          	auipc	a0,0x2
    80201660:	27450513          	addi	a0,a0,628 # 802038d0 <rodata_start+0x8d0>
    80201664:	036010ef          	jal	ra,8020269a <kprintf>
    80201668:	fe843783          	ld	a5,-24(s0)
    8020166c:	7fbc                	ld	a5,120(a5)
    8020166e:	85be                	mv	a1,a5
    80201670:	00002517          	auipc	a0,0x2
    80201674:	27850513          	addi	a0,a0,632 # 802038e8 <rodata_start+0x8e8>
    80201678:	022010ef          	jal	ra,8020269a <kprintf>
    8020167c:	fe843783          	ld	a5,-24(s0)
    80201680:	63dc                	ld	a5,128(a5)
    80201682:	85be                	mv	a1,a5
    80201684:	00002517          	auipc	a0,0x2
    80201688:	27c50513          	addi	a0,a0,636 # 80203900 <rodata_start+0x900>
    8020168c:	00e010ef          	jal	ra,8020269a <kprintf>
    80201690:	fe843783          	ld	a5,-24(s0)
    80201694:	67dc                	ld	a5,136(a5)
    80201696:	85be                	mv	a1,a5
    80201698:	00002517          	auipc	a0,0x2
    8020169c:	28050513          	addi	a0,a0,640 # 80203918 <rodata_start+0x918>
    802016a0:	7fb000ef          	jal	ra,8020269a <kprintf>
    802016a4:	fe843783          	ld	a5,-24(s0)
    802016a8:	6bdc                	ld	a5,144(a5)
    802016aa:	85be                	mv	a1,a5
    802016ac:	00002517          	auipc	a0,0x2
    802016b0:	28450513          	addi	a0,a0,644 # 80203930 <rodata_start+0x930>
    802016b4:	7e7000ef          	jal	ra,8020269a <kprintf>
    802016b8:	fe843783          	ld	a5,-24(s0)
    802016bc:	6fdc                	ld	a5,152(a5)
    802016be:	85be                	mv	a1,a5
    802016c0:	00002517          	auipc	a0,0x2
    802016c4:	28850513          	addi	a0,a0,648 # 80203948 <rodata_start+0x948>
    802016c8:	7d3000ef          	jal	ra,8020269a <kprintf>
    802016cc:	fe843783          	ld	a5,-24(s0)
    802016d0:	73dc                	ld	a5,160(a5)
    802016d2:	85be                	mv	a1,a5
    802016d4:	00002517          	auipc	a0,0x2
    802016d8:	28c50513          	addi	a0,a0,652 # 80203960 <rodata_start+0x960>
    802016dc:	7bf000ef          	jal	ra,8020269a <kprintf>
    802016e0:	fe843783          	ld	a5,-24(s0)
    802016e4:	77dc                	ld	a5,168(a5)
    802016e6:	85be                	mv	a1,a5
    802016e8:	00002517          	auipc	a0,0x2
    802016ec:	29050513          	addi	a0,a0,656 # 80203978 <rodata_start+0x978>
    802016f0:	7ab000ef          	jal	ra,8020269a <kprintf>
    802016f4:	fe843783          	ld	a5,-24(s0)
    802016f8:	7bdc                	ld	a5,176(a5)
    802016fa:	85be                	mv	a1,a5
    802016fc:	00002517          	auipc	a0,0x2
    80201700:	29450513          	addi	a0,a0,660 # 80203990 <rodata_start+0x990>
    80201704:	797000ef          	jal	ra,8020269a <kprintf>
    80201708:	fe843783          	ld	a5,-24(s0)
    8020170c:	7fdc                	ld	a5,184(a5)
    8020170e:	85be                	mv	a1,a5
    80201710:	00002517          	auipc	a0,0x2
    80201714:	29850513          	addi	a0,a0,664 # 802039a8 <rodata_start+0x9a8>
    80201718:	783000ef          	jal	ra,8020269a <kprintf>
    8020171c:	fe843783          	ld	a5,-24(s0)
    80201720:	63fc                	ld	a5,192(a5)
    80201722:	85be                	mv	a1,a5
    80201724:	00002517          	auipc	a0,0x2
    80201728:	29c50513          	addi	a0,a0,668 # 802039c0 <rodata_start+0x9c0>
    8020172c:	76f000ef          	jal	ra,8020269a <kprintf>
    80201730:	fe843783          	ld	a5,-24(s0)
    80201734:	67fc                	ld	a5,200(a5)
    80201736:	85be                	mv	a1,a5
    80201738:	00002517          	auipc	a0,0x2
    8020173c:	2a050513          	addi	a0,a0,672 # 802039d8 <rodata_start+0x9d8>
    80201740:	75b000ef          	jal	ra,8020269a <kprintf>
    80201744:	fe843783          	ld	a5,-24(s0)
    80201748:	6bfc                	ld	a5,208(a5)
    8020174a:	85be                	mv	a1,a5
    8020174c:	00002517          	auipc	a0,0x2
    80201750:	2a450513          	addi	a0,a0,676 # 802039f0 <rodata_start+0x9f0>
    80201754:	747000ef          	jal	ra,8020269a <kprintf>
    80201758:	fe843783          	ld	a5,-24(s0)
    8020175c:	6ffc                	ld	a5,216(a5)
    8020175e:	85be                	mv	a1,a5
    80201760:	00002517          	auipc	a0,0x2
    80201764:	2a850513          	addi	a0,a0,680 # 80203a08 <rodata_start+0xa08>
    80201768:	733000ef          	jal	ra,8020269a <kprintf>
    8020176c:	fe843783          	ld	a5,-24(s0)
    80201770:	73fc                	ld	a5,224(a5)
    80201772:	85be                	mv	a1,a5
    80201774:	00002517          	auipc	a0,0x2
    80201778:	2ac50513          	addi	a0,a0,684 # 80203a20 <rodata_start+0xa20>
    8020177c:	71f000ef          	jal	ra,8020269a <kprintf>
    80201780:	fe843783          	ld	a5,-24(s0)
    80201784:	77fc                	ld	a5,232(a5)
    80201786:	85be                	mv	a1,a5
    80201788:	00002517          	auipc	a0,0x2
    8020178c:	2b050513          	addi	a0,a0,688 # 80203a38 <rodata_start+0xa38>
    80201790:	70b000ef          	jal	ra,8020269a <kprintf>
    80201794:	fe843783          	ld	a5,-24(s0)
    80201798:	7bfc                	ld	a5,240(a5)
    8020179a:	85be                	mv	a1,a5
    8020179c:	00002517          	auipc	a0,0x2
    802017a0:	2b450513          	addi	a0,a0,692 # 80203a50 <rodata_start+0xa50>
    802017a4:	6f7000ef          	jal	ra,8020269a <kprintf>
    802017a8:	fe843783          	ld	a5,-24(s0)
    802017ac:	7ffc                	ld	a5,248(a5)
    802017ae:	85be                	mv	a1,a5
    802017b0:	00002517          	auipc	a0,0x2
    802017b4:	2b850513          	addi	a0,a0,696 # 80203a68 <rodata_start+0xa68>
    802017b8:	6e3000ef          	jal	ra,8020269a <kprintf>
    802017bc:	0001                	nop
    802017be:	60e2                	ld	ra,24(sp)
    802017c0:	6442                	ld	s0,16(sp)
    802017c2:	6105                	addi	sp,sp,32
    802017c4:	8082                	ret
	...

00000000802017d0 <__alltraps>:
    802017d0:	14011073          	csrw	sscratch,sp
    802017d4:	712d                	addi	sp,sp,-288
    802017d6:	e406                	sd	ra,8(sp)
    802017d8:	ec0e                	sd	gp,24(sp)
    802017da:	f012                	sd	tp,32(sp)
    802017dc:	f416                	sd	t0,40(sp)
    802017de:	f81a                	sd	t1,48(sp)
    802017e0:	fc1e                	sd	t2,56(sp)
    802017e2:	e0a2                	sd	s0,64(sp)
    802017e4:	e4a6                	sd	s1,72(sp)
    802017e6:	e8aa                	sd	a0,80(sp)
    802017e8:	ecae                	sd	a1,88(sp)
    802017ea:	f0b2                	sd	a2,96(sp)
    802017ec:	f4b6                	sd	a3,104(sp)
    802017ee:	f8ba                	sd	a4,112(sp)
    802017f0:	fcbe                	sd	a5,120(sp)
    802017f2:	e142                	sd	a6,128(sp)
    802017f4:	e546                	sd	a7,136(sp)
    802017f6:	e94a                	sd	s2,144(sp)
    802017f8:	ed4e                	sd	s3,152(sp)
    802017fa:	f152                	sd	s4,160(sp)
    802017fc:	f556                	sd	s5,168(sp)
    802017fe:	f95a                	sd	s6,176(sp)
    80201800:	fd5e                	sd	s7,184(sp)
    80201802:	e1e2                	sd	s8,192(sp)
    80201804:	e5e6                	sd	s9,200(sp)
    80201806:	e9ea                	sd	s10,208(sp)
    80201808:	edee                	sd	s11,216(sp)
    8020180a:	f1f2                	sd	t3,224(sp)
    8020180c:	f5f6                	sd	t4,232(sp)
    8020180e:	f9fa                	sd	t5,240(sp)
    80201810:	fdfe                	sd	t6,248(sp)
    80201812:	14002473          	csrr	s0,sscratch
    80201816:	100024f3          	csrr	s1,sstatus
    8020181a:	14102973          	csrr	s2,sepc
    8020181e:	143029f3          	csrr	s3,stval
    80201822:	14202a73          	csrr	s4,scause
    80201826:	e822                	sd	s0,16(sp)
    80201828:	e226                	sd	s1,256(sp)
    8020182a:	e64a                	sd	s2,264(sp)
    8020182c:	ea4e                	sd	s3,272(sp)
    8020182e:	ee52                	sd	s4,280(sp)
    80201830:	850a                	mv	a0,sp
    80201832:	8fdff0ef          	jal	ra,8020112e <trap>

0000000080201836 <__trapret>:
    80201836:	812a                	mv	sp,a0
    80201838:	6492                	ld	s1,256(sp)
    8020183a:	6932                	ld	s2,264(sp)
    8020183c:	10049073          	csrw	sstatus,s1
    80201840:	14191073          	csrw	sepc,s2
    80201844:	60a2                	ld	ra,8(sp)
    80201846:	61e2                	ld	gp,24(sp)
    80201848:	7202                	ld	tp,32(sp)
    8020184a:	72a2                	ld	t0,40(sp)
    8020184c:	7342                	ld	t1,48(sp)
    8020184e:	73e2                	ld	t2,56(sp)
    80201850:	6406                	ld	s0,64(sp)
    80201852:	64a6                	ld	s1,72(sp)
    80201854:	6546                	ld	a0,80(sp)
    80201856:	65e6                	ld	a1,88(sp)
    80201858:	7606                	ld	a2,96(sp)
    8020185a:	76a6                	ld	a3,104(sp)
    8020185c:	7746                	ld	a4,112(sp)
    8020185e:	77e6                	ld	a5,120(sp)
    80201860:	680a                	ld	a6,128(sp)
    80201862:	68aa                	ld	a7,136(sp)
    80201864:	694a                	ld	s2,144(sp)
    80201866:	69ea                	ld	s3,152(sp)
    80201868:	7a0a                	ld	s4,160(sp)
    8020186a:	7aaa                	ld	s5,168(sp)
    8020186c:	7b4a                	ld	s6,176(sp)
    8020186e:	7bea                	ld	s7,184(sp)
    80201870:	6c0e                	ld	s8,192(sp)
    80201872:	6cae                	ld	s9,200(sp)
    80201874:	6d4e                	ld	s10,208(sp)
    80201876:	6dee                	ld	s11,216(sp)
    80201878:	7e0e                	ld	t3,224(sp)
    8020187a:	7eae                	ld	t4,232(sp)
    8020187c:	7f4e                	ld	t5,240(sp)
    8020187e:	7fee                	ld	t6,248(sp)
    80201880:	6142                	ld	sp,16(sp)
    80201882:	10200073          	sret
	...

000000008020188e <rtc_probe>:
    8020188e:	1101                	addi	sp,sp,-32
    80201890:	ec06                	sd	ra,24(sp)
    80201892:	e822                	sd	s0,16(sp)
    80201894:	1000                	addi	s0,sp,32
    80201896:	fe043423          	sd	zero,-24(s0)
    8020189a:	a855                	j	8020194e <rtc_probe+0xc0>
    8020189c:	00003697          	auipc	a3,0x3
    802018a0:	82c6b683          	ld	a3,-2004(a3) # 802040c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    802018a4:	fe843703          	ld	a4,-24(s0)
    802018a8:	87ba                	mv	a5,a4
    802018aa:	078e                	slli	a5,a5,0x3
    802018ac:	97ba                	add	a5,a5,a4
    802018ae:	078e                	slli	a5,a5,0x3
    802018b0:	97b6                	add	a5,a5,a3
    802018b2:	639c                	ld	a5,0(a5)
    802018b4:	00002597          	auipc	a1,0x2
    802018b8:	1cc58593          	addi	a1,a1,460 # 80203a80 <rodata_start+0xa80>
    802018bc:	853e                	mv	a0,a5
    802018be:	4c4010ef          	jal	ra,80202d82 <is_begin_with>
    802018c2:	87aa                	mv	a5,a0
    802018c4:	c3c1                	beqz	a5,80201944 <rtc_probe+0xb6>
    802018c6:	00003697          	auipc	a3,0x3
    802018ca:	8026b683          	ld	a3,-2046(a3) # 802040c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    802018ce:	fe843703          	ld	a4,-24(s0)
    802018d2:	87ba                	mv	a5,a4
    802018d4:	078e                	slli	a5,a5,0x3
    802018d6:	97ba                	add	a5,a5,a4
    802018d8:	078e                	slli	a5,a5,0x3
    802018da:	97b6                	add	a5,a5,a3
    802018dc:	6f9c                	ld	a5,24(a5)
    802018de:	fef43023          	sd	a5,-32(s0)
    802018e2:	a8b1                	j	8020193e <rtc_probe+0xb0>
    802018e4:	fe043783          	ld	a5,-32(s0)
    802018e8:	639c                	ld	a5,0(a5)
    802018ea:	00002597          	auipc	a1,0x2
    802018ee:	19e58593          	addi	a1,a1,414 # 80203a88 <rodata_start+0xa88>
    802018f2:	853e                	mv	a0,a5
    802018f4:	41e010ef          	jal	ra,80202d12 <strcmp>
    802018f8:	87aa                	mv	a5,a0
    802018fa:	ef8d                	bnez	a5,80201934 <rtc_probe+0xa6>
    802018fc:	fe043783          	ld	a5,-32(s0)
    80201900:	6b9c                	ld	a5,16(a5)
    80201902:	00002597          	auipc	a1,0x2
    80201906:	19658593          	addi	a1,a1,406 # 80203a98 <rodata_start+0xa98>
    8020190a:	853e                	mv	a0,a5
    8020190c:	406010ef          	jal	ra,80202d12 <strcmp>
    80201910:	87aa                	mv	a5,a0
    80201912:	e399                	bnez	a5,80201918 <rtc_probe+0x8a>
    80201914:	4781                	li	a5,0
    80201916:	a881                	j	80201966 <rtc_probe+0xd8>
    80201918:	fe043783          	ld	a5,-32(s0)
    8020191c:	6b9c                	ld	a5,16(a5)
    8020191e:	00002597          	auipc	a1,0x2
    80201922:	19258593          	addi	a1,a1,402 # 80203ab0 <rodata_start+0xab0>
    80201926:	853e                	mv	a0,a5
    80201928:	3ea010ef          	jal	ra,80202d12 <strcmp>
    8020192c:	87aa                	mv	a5,a0
    8020192e:	e399                	bnez	a5,80201934 <rtc_probe+0xa6>
    80201930:	4785                	li	a5,1
    80201932:	a815                	j	80201966 <rtc_probe+0xd8>
    80201934:	fe043783          	ld	a5,-32(s0)
    80201938:	6f9c                	ld	a5,24(a5)
    8020193a:	fef43023          	sd	a5,-32(s0)
    8020193e:	fe043783          	ld	a5,-32(s0)
    80201942:	f3cd                	bnez	a5,802018e4 <rtc_probe+0x56>
    80201944:	fe843783          	ld	a5,-24(s0)
    80201948:	0785                	addi	a5,a5,1
    8020194a:	fef43423          	sd	a5,-24(s0)
    8020194e:	00002797          	auipc	a5,0x2
    80201952:	7827b783          	ld	a5,1922(a5) # 802040d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80201956:	639c                	ld	a5,0(a5)
    80201958:	07d1                	addi	a5,a5,20
    8020195a:	873e                	mv	a4,a5
    8020195c:	fe843783          	ld	a5,-24(s0)
    80201960:	f2e7eee3          	bltu	a5,a4,8020189c <rtc_probe+0xe>
    80201964:	57fd                	li	a5,-1
    80201966:	853e                	mv	a0,a5
    80201968:	60e2                	ld	ra,24(sp)
    8020196a:	6442                	ld	s0,16(sp)
    8020196c:	6105                	addi	sp,sp,32
    8020196e:	8082                	ret

0000000080201970 <rtc_init>:
    80201970:	1141                	addi	sp,sp,-16
    80201972:	e406                	sd	ra,8(sp)
    80201974:	e022                	sd	s0,0(sp)
    80201976:	0800                	addi	s0,sp,16
    80201978:	f17ff0ef          	jal	ra,8020188e <rtc_probe>
    8020197c:	87aa                	mv	a5,a0
    8020197e:	0007871b          	sext.w	a4,a5
    80201982:	00016797          	auipc	a5,0x16
    80201986:	57e78793          	addi	a5,a5,1406 # 80217f00 <rtc_device>
    8020198a:	c398                	sw	a4,0(a5)
    8020198c:	00016797          	auipc	a5,0x16
    80201990:	57478793          	addi	a5,a5,1396 # 80217f00 <rtc_device>
    80201994:	439c                	lw	a5,0(a5)
    80201996:	c791                	beqz	a5,802019a2 <rtc_init+0x32>
    80201998:	873e                	mv	a4,a5
    8020199a:	4785                	li	a5,1
    8020199c:	00f70663          	beq	a4,a5,802019a8 <rtc_init+0x38>
    802019a0:	a039                	j	802019ae <rtc_init+0x3e>
    802019a2:	0c1000ef          	jal	ra,80202262 <goldfish_rtc_init>
    802019a6:	a021                	j	802019ae <rtc_init+0x3e>
    802019a8:	439000ef          	jal	ra,802025e0 <sunxi_rtc_init>
    802019ac:	0001                	nop
    802019ae:	0001                	nop
    802019b0:	60a2                	ld	ra,8(sp)
    802019b2:	6402                	ld	s0,0(sp)
    802019b4:	0141                	addi	sp,sp,16
    802019b6:	8082                	ret

00000000802019b8 <read_time>:
    802019b8:	1141                	addi	sp,sp,-16
    802019ba:	e406                	sd	ra,8(sp)
    802019bc:	e022                	sd	s0,0(sp)
    802019be:	0800                	addi	s0,sp,16
    802019c0:	00016797          	auipc	a5,0x16
    802019c4:	54078793          	addi	a5,a5,1344 # 80217f00 <rtc_device>
    802019c8:	679c                	ld	a5,8(a5)
    802019ca:	9782                	jalr	a5
    802019cc:	87aa                	mv	a5,a0
    802019ce:	853e                	mv	a0,a5
    802019d0:	60a2                	ld	ra,8(sp)
    802019d2:	6402                	ld	s0,0(sp)
    802019d4:	0141                	addi	sp,sp,16
    802019d6:	8082                	ret

00000000802019d8 <set_time>:
    802019d8:	1101                	addi	sp,sp,-32
    802019da:	ec06                	sd	ra,24(sp)
    802019dc:	e822                	sd	s0,16(sp)
    802019de:	1000                	addi	s0,sp,32
    802019e0:	fea43423          	sd	a0,-24(s0)
    802019e4:	00016797          	auipc	a5,0x16
    802019e8:	51c78793          	addi	a5,a5,1308 # 80217f00 <rtc_device>
    802019ec:	6b9c                	ld	a5,16(a5)
    802019ee:	fe843503          	ld	a0,-24(s0)
    802019f2:	9782                	jalr	a5
    802019f4:	0001                	nop
    802019f6:	60e2                	ld	ra,24(sp)
    802019f8:	6442                	ld	s0,16(sp)
    802019fa:	6105                	addi	sp,sp,32
    802019fc:	8082                	ret

00000000802019fe <read_alarm>:
    802019fe:	1141                	addi	sp,sp,-16
    80201a00:	e406                	sd	ra,8(sp)
    80201a02:	e022                	sd	s0,0(sp)
    80201a04:	0800                	addi	s0,sp,16
    80201a06:	00016797          	auipc	a5,0x16
    80201a0a:	4fa78793          	addi	a5,a5,1274 # 80217f00 <rtc_device>
    80201a0e:	6f9c                	ld	a5,24(a5)
    80201a10:	9782                	jalr	a5
    80201a12:	87aa                	mv	a5,a0
    80201a14:	853e                	mv	a0,a5
    80201a16:	60a2                	ld	ra,8(sp)
    80201a18:	6402                	ld	s0,0(sp)
    80201a1a:	0141                	addi	sp,sp,16
    80201a1c:	8082                	ret

0000000080201a1e <set_alarm>:
    80201a1e:	1101                	addi	sp,sp,-32
    80201a20:	ec06                	sd	ra,24(sp)
    80201a22:	e822                	sd	s0,16(sp)
    80201a24:	1000                	addi	s0,sp,32
    80201a26:	fea43423          	sd	a0,-24(s0)
    80201a2a:	00016797          	auipc	a5,0x16
    80201a2e:	4d678793          	addi	a5,a5,1238 # 80217f00 <rtc_device>
    80201a32:	739c                	ld	a5,32(a5)
    80201a34:	fe843503          	ld	a0,-24(s0)
    80201a38:	9782                	jalr	a5
    80201a3a:	0001                	nop
    80201a3c:	60e2                	ld	ra,24(sp)
    80201a3e:	6442                	ld	s0,16(sp)
    80201a40:	6105                	addi	sp,sp,32
    80201a42:	8082                	ret

0000000080201a44 <rtc_interrupt_handler>:
    80201a44:	1141                	addi	sp,sp,-16
    80201a46:	e406                	sd	ra,8(sp)
    80201a48:	e022                	sd	s0,0(sp)
    80201a4a:	0800                	addi	s0,sp,16
    80201a4c:	00016797          	auipc	a5,0x16
    80201a50:	4b478793          	addi	a5,a5,1204 # 80217f00 <rtc_device>
    80201a54:	779c                	ld	a5,40(a5)
    80201a56:	9782                	jalr	a5
    80201a58:	0001                	nop
    80201a5a:	60a2                	ld	ra,8(sp)
    80201a5c:	6402                	ld	s0,0(sp)
    80201a5e:	0141                	addi	sp,sp,16
    80201a60:	8082                	ret

0000000080201a62 <clear_alarm>:
    80201a62:	1141                	addi	sp,sp,-16
    80201a64:	e406                	sd	ra,8(sp)
    80201a66:	e022                	sd	s0,0(sp)
    80201a68:	0800                	addi	s0,sp,16
    80201a6a:	00016797          	auipc	a5,0x16
    80201a6e:	49678793          	addi	a5,a5,1174 # 80217f00 <rtc_device>
    80201a72:	7b9c                	ld	a5,48(a5)
    80201a74:	9782                	jalr	a5
    80201a76:	0001                	nop
    80201a78:	60a2                	ld	ra,8(sp)
    80201a7a:	6402                	ld	s0,0(sp)
    80201a7c:	0141                	addi	sp,sp,16
    80201a7e:	8082                	ret

0000000080201a80 <uart_probe>:
    80201a80:	1101                	addi	sp,sp,-32
    80201a82:	ec06                	sd	ra,24(sp)
    80201a84:	e822                	sd	s0,16(sp)
    80201a86:	1000                	addi	s0,sp,32
    80201a88:	fe043423          	sd	zero,-24(s0)
    80201a8c:	a855                	j	80201b40 <uart_probe+0xc0>
    80201a8e:	00002697          	auipc	a3,0x2
    80201a92:	63a6b683          	ld	a3,1594(a3) # 802040c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80201a96:	fe843703          	ld	a4,-24(s0)
    80201a9a:	87ba                	mv	a5,a4
    80201a9c:	078e                	slli	a5,a5,0x3
    80201a9e:	97ba                	add	a5,a5,a4
    80201aa0:	078e                	slli	a5,a5,0x3
    80201aa2:	97b6                	add	a5,a5,a3
    80201aa4:	639c                	ld	a5,0(a5)
    80201aa6:	00002597          	auipc	a1,0x2
    80201aaa:	02258593          	addi	a1,a1,34 # 80203ac8 <rodata_start+0xac8>
    80201aae:	853e                	mv	a0,a5
    80201ab0:	2d2010ef          	jal	ra,80202d82 <is_begin_with>
    80201ab4:	87aa                	mv	a5,a0
    80201ab6:	c3c1                	beqz	a5,80201b36 <uart_probe+0xb6>
    80201ab8:	00002697          	auipc	a3,0x2
    80201abc:	6106b683          	ld	a3,1552(a3) # 802040c8 <_GLOBAL_OFFSET_TABLE_+0x18>
    80201ac0:	fe843703          	ld	a4,-24(s0)
    80201ac4:	87ba                	mv	a5,a4
    80201ac6:	078e                	slli	a5,a5,0x3
    80201ac8:	97ba                	add	a5,a5,a4
    80201aca:	078e                	slli	a5,a5,0x3
    80201acc:	97b6                	add	a5,a5,a3
    80201ace:	6f9c                	ld	a5,24(a5)
    80201ad0:	fef43023          	sd	a5,-32(s0)
    80201ad4:	a8b1                	j	80201b30 <uart_probe+0xb0>
    80201ad6:	fe043783          	ld	a5,-32(s0)
    80201ada:	639c                	ld	a5,0(a5)
    80201adc:	00002597          	auipc	a1,0x2
    80201ae0:	ff458593          	addi	a1,a1,-12 # 80203ad0 <rodata_start+0xad0>
    80201ae4:	853e                	mv	a0,a5
    80201ae6:	22c010ef          	jal	ra,80202d12 <strcmp>
    80201aea:	87aa                	mv	a5,a0
    80201aec:	ef8d                	bnez	a5,80201b26 <uart_probe+0xa6>
    80201aee:	fe043783          	ld	a5,-32(s0)
    80201af2:	6b9c                	ld	a5,16(a5)
    80201af4:	00002597          	auipc	a1,0x2
    80201af8:	fec58593          	addi	a1,a1,-20 # 80203ae0 <rodata_start+0xae0>
    80201afc:	853e                	mv	a0,a5
    80201afe:	214010ef          	jal	ra,80202d12 <strcmp>
    80201b02:	87aa                	mv	a5,a0
    80201b04:	e399                	bnez	a5,80201b0a <uart_probe+0x8a>
    80201b06:	4781                	li	a5,0
    80201b08:	a881                	j	80201b58 <uart_probe+0xd8>
    80201b0a:	fe043783          	ld	a5,-32(s0)
    80201b0e:	6b9c                	ld	a5,16(a5)
    80201b10:	00002597          	auipc	a1,0x2
    80201b14:	fe058593          	addi	a1,a1,-32 # 80203af0 <rodata_start+0xaf0>
    80201b18:	853e                	mv	a0,a5
    80201b1a:	1f8010ef          	jal	ra,80202d12 <strcmp>
    80201b1e:	87aa                	mv	a5,a0
    80201b20:	e399                	bnez	a5,80201b26 <uart_probe+0xa6>
    80201b22:	4785                	li	a5,1
    80201b24:	a815                	j	80201b58 <uart_probe+0xd8>
    80201b26:	fe043783          	ld	a5,-32(s0)
    80201b2a:	6f9c                	ld	a5,24(a5)
    80201b2c:	fef43023          	sd	a5,-32(s0)
    80201b30:	fe043783          	ld	a5,-32(s0)
    80201b34:	f3cd                	bnez	a5,80201ad6 <uart_probe+0x56>
    80201b36:	fe843783          	ld	a5,-24(s0)
    80201b3a:	0785                	addi	a5,a5,1
    80201b3c:	fef43423          	sd	a5,-24(s0)
    80201b40:	00002797          	auipc	a5,0x2
    80201b44:	5907b783          	ld	a5,1424(a5) # 802040d0 <_GLOBAL_OFFSET_TABLE_+0x20>
    80201b48:	639c                	ld	a5,0(a5)
    80201b4a:	07d1                	addi	a5,a5,20
    80201b4c:	873e                	mv	a4,a5
    80201b4e:	fe843783          	ld	a5,-24(s0)
    80201b52:	f2e7eee3          	bltu	a5,a4,80201a8e <uart_probe+0xe>
    80201b56:	57fd                	li	a5,-1
    80201b58:	853e                	mv	a0,a5
    80201b5a:	60e2                	ld	ra,24(sp)
    80201b5c:	6442                	ld	s0,16(sp)
    80201b5e:	6105                	addi	sp,sp,32
    80201b60:	8082                	ret

0000000080201b62 <uart_init>:
    80201b62:	1141                	addi	sp,sp,-16
    80201b64:	e406                	sd	ra,8(sp)
    80201b66:	e022                	sd	s0,0(sp)
    80201b68:	0800                	addi	s0,sp,16
    80201b6a:	f17ff0ef          	jal	ra,80201a80 <uart_probe>
    80201b6e:	87aa                	mv	a5,a0
    80201b70:	0007871b          	sext.w	a4,a5
    80201b74:	00016797          	auipc	a5,0x16
    80201b78:	3c478793          	addi	a5,a5,964 # 80217f38 <uart_device>
    80201b7c:	c398                	sw	a4,0(a5)
    80201b7e:	00016797          	auipc	a5,0x16
    80201b82:	3ba78793          	addi	a5,a5,954 # 80217f38 <uart_device>
    80201b86:	439c                	lw	a5,0(a5)
    80201b88:	c791                	beqz	a5,80201b94 <uart_init+0x32>
    80201b8a:	873e                	mv	a4,a5
    80201b8c:	4785                	li	a5,1
    80201b8e:	00f70663          	beq	a4,a5,80201b9a <uart_init+0x38>
    80201b92:	a039                	j	80201ba0 <uart_init+0x3e>
    80201b94:	354000ef          	jal	ra,80201ee8 <uart_qemu_init>
    80201b98:	a021                	j	80201ba0 <uart_init+0x3e>
    80201b9a:	0a2000ef          	jal	ra,80201c3c <uart_sunxi_init>
    80201b9e:	0001                	nop
    80201ba0:	0001                	nop
    80201ba2:	60a2                	ld	ra,8(sp)
    80201ba4:	6402                	ld	s0,0(sp)
    80201ba6:	0141                	addi	sp,sp,16
    80201ba8:	8082                	ret

0000000080201baa <uart_read>:
    80201baa:	1141                	addi	sp,sp,-16
    80201bac:	e406                	sd	ra,8(sp)
    80201bae:	e022                	sd	s0,0(sp)
    80201bb0:	0800                	addi	s0,sp,16
    80201bb2:	00016797          	auipc	a5,0x16
    80201bb6:	38678793          	addi	a5,a5,902 # 80217f38 <uart_device>
    80201bba:	779c                	ld	a5,40(a5)
    80201bbc:	9782                	jalr	a5
    80201bbe:	87aa                	mv	a5,a0
    80201bc0:	853e                	mv	a0,a5
    80201bc2:	60a2                	ld	ra,8(sp)
    80201bc4:	6402                	ld	s0,0(sp)
    80201bc6:	0141                	addi	sp,sp,16
    80201bc8:	8082                	ret

0000000080201bca <uart_directly_write>:
    80201bca:	1101                	addi	sp,sp,-32
    80201bcc:	ec06                	sd	ra,24(sp)
    80201bce:	e822                	sd	s0,16(sp)
    80201bd0:	1000                	addi	s0,sp,32
    80201bd2:	87aa                	mv	a5,a0
    80201bd4:	fef407a3          	sb	a5,-17(s0)
    80201bd8:	00016797          	auipc	a5,0x16
    80201bdc:	36078793          	addi	a5,a5,864 # 80217f38 <uart_device>
    80201be0:	6f9c                	ld	a5,24(a5)
    80201be2:	fef40703          	lb	a4,-17(s0)
    80201be6:	853a                	mv	a0,a4
    80201be8:	9782                	jalr	a5
    80201bea:	0001                	nop
    80201bec:	60e2                	ld	ra,24(sp)
    80201bee:	6442                	ld	s0,16(sp)
    80201bf0:	6105                	addi	sp,sp,32
    80201bf2:	8082                	ret

0000000080201bf4 <uart_interrupt_handler>:
    80201bf4:	1141                	addi	sp,sp,-16
    80201bf6:	e406                	sd	ra,8(sp)
    80201bf8:	e022                	sd	s0,0(sp)
    80201bfa:	0800                	addi	s0,sp,16
    80201bfc:	00016797          	auipc	a5,0x16
    80201c00:	33c78793          	addi	a5,a5,828 # 80217f38 <uart_device>
    80201c04:	7b9c                	ld	a5,48(a5)
    80201c06:	9782                	jalr	a5
    80201c08:	0001                	nop
    80201c0a:	60a2                	ld	ra,8(sp)
    80201c0c:	6402                	ld	s0,0(sp)
    80201c0e:	0141                	addi	sp,sp,16
    80201c10:	8082                	ret

0000000080201c12 <uart_putc>:
    80201c12:	1101                	addi	sp,sp,-32
    80201c14:	ec06                	sd	ra,24(sp)
    80201c16:	e822                	sd	s0,16(sp)
    80201c18:	1000                	addi	s0,sp,32
    80201c1a:	87aa                	mv	a5,a0
    80201c1c:	fef407a3          	sb	a5,-17(s0)
    80201c20:	00016797          	auipc	a5,0x16
    80201c24:	31878793          	addi	a5,a5,792 # 80217f38 <uart_device>
    80201c28:	739c                	ld	a5,32(a5)
    80201c2a:	fef40703          	lb	a4,-17(s0)
    80201c2e:	853a                	mv	a0,a4
    80201c30:	9782                	jalr	a5
    80201c32:	0001                	nop
    80201c34:	60e2                	ld	ra,24(sp)
    80201c36:	6442                	ld	s0,16(sp)
    80201c38:	6105                	addi	sp,sp,32
    80201c3a:	8082                	ret

0000000080201c3c <uart_sunxi_init>:
    80201c3c:	1141                	addi	sp,sp,-16
    80201c3e:	e406                	sd	ra,8(sp)
    80201c40:	e022                	sd	s0,0(sp)
    80201c42:	0800                	addi	s0,sp,16
    80201c44:	00002797          	auipc	a5,0x2
    80201c48:	4747b783          	ld	a5,1140(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201c4c:	02500737          	lui	a4,0x2500
    80201c50:	e798                	sd	a4,8(a5)
    80201c52:	00002797          	auipc	a5,0x2
    80201c56:	4667b783          	ld	a5,1126(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201c5a:	4735                	li	a4,13
    80201c5c:	00e79823          	sh	a4,16(a5)
    80201c60:	00e000ef          	jal	ra,80201c6e <uart_16550a_init>
    80201c64:	0001                	nop
    80201c66:	60a2                	ld	ra,8(sp)
    80201c68:	6402                	ld	s0,0(sp)
    80201c6a:	0141                	addi	sp,sp,16
    80201c6c:	8082                	ret

0000000080201c6e <uart_16550a_init>:
    80201c6e:	1101                	addi	sp,sp,-32
    80201c70:	ec22                	sd	s0,24(sp)
    80201c72:	1000                	addi	s0,sp,32
    80201c74:	00002797          	auipc	a5,0x2
    80201c78:	4447b783          	ld	a5,1092(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201c7c:	679c                	ld	a5,8(a5)
    80201c7e:	fef43423          	sd	a5,-24(s0)
    80201c82:	fe843783          	ld	a5,-24(s0)
    80201c86:	0007a223          	sw	zero,4(a5)
    80201c8a:	0001                	nop
    80201c8c:	fe843783          	ld	a5,-24(s0)
    80201c90:	4bdc                	lw	a5,20(a5)
    80201c92:	2781                	sext.w	a5,a5
    80201c94:	0207f793          	andi	a5,a5,32
    80201c98:	2781                	sext.w	a5,a5
    80201c9a:	dbed                	beqz	a5,80201c8c <uart_16550a_init+0x1e>
    80201c9c:	00002797          	auipc	a5,0x2
    80201ca0:	41c7b783          	ld	a5,1052(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201ca4:	0107d783          	lhu	a5,16(a5)
    80201ca8:	fef403a3          	sb	a5,-25(s0)
    80201cac:	00002797          	auipc	a5,0x2
    80201cb0:	40c7b783          	ld	a5,1036(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201cb4:	0107d783          	lhu	a5,16(a5)
    80201cb8:	0087d79b          	srliw	a5,a5,0x8
    80201cbc:	17c2                	slli	a5,a5,0x30
    80201cbe:	93c1                	srli	a5,a5,0x30
    80201cc0:	fef40323          	sb	a5,-26(s0)
    80201cc4:	fe843783          	ld	a5,-24(s0)
    80201cc8:	0a47a783          	lw	a5,164(a5)
    80201ccc:	2781                	sext.w	a5,a5
    80201cce:	0017e793          	ori	a5,a5,1
    80201cd2:	0007871b          	sext.w	a4,a5
    80201cd6:	fe843783          	ld	a5,-24(s0)
    80201cda:	0ae7a223          	sw	a4,164(a5)
    80201cde:	fe843783          	ld	a5,-24(s0)
    80201ce2:	0a47a783          	lw	a5,164(a5)
    80201ce6:	2781                	sext.w	a5,a5
    80201ce8:	0027e793          	ori	a5,a5,2
    80201cec:	0007871b          	sext.w	a4,a5
    80201cf0:	fe843783          	ld	a5,-24(s0)
    80201cf4:	0ae7a223          	sw	a4,164(a5)
    80201cf8:	fe843783          	ld	a5,-24(s0)
    80201cfc:	47dc                	lw	a5,12(a5)
    80201cfe:	2781                	sext.w	a5,a5
    80201d00:	0807e793          	ori	a5,a5,128
    80201d04:	0007871b          	sext.w	a4,a5
    80201d08:	fe843783          	ld	a5,-24(s0)
    80201d0c:	c7d8                	sw	a4,12(a5)
    80201d0e:	0001                	nop
    80201d10:	fe843783          	ld	a5,-24(s0)
    80201d14:	5ffc                	lw	a5,124(a5)
    80201d16:	2781                	sext.w	a5,a5
    80201d18:	8b85                	andi	a5,a5,1
    80201d1a:	2781                	sext.w	a5,a5
    80201d1c:	fbf5                	bnez	a5,80201d10 <uart_16550a_init+0xa2>
    80201d1e:	fe744783          	lbu	a5,-25(s0)
    80201d22:	0007871b          	sext.w	a4,a5
    80201d26:	fe843783          	ld	a5,-24(s0)
    80201d2a:	c398                	sw	a4,0(a5)
    80201d2c:	fe644783          	lbu	a5,-26(s0)
    80201d30:	0007871b          	sext.w	a4,a5
    80201d34:	fe843783          	ld	a5,-24(s0)
    80201d38:	c3d8                	sw	a4,4(a5)
    80201d3a:	fe843783          	ld	a5,-24(s0)
    80201d3e:	0a47a783          	lw	a5,164(a5)
    80201d42:	2781                	sext.w	a5,a5
    80201d44:	0047e793          	ori	a5,a5,4
    80201d48:	0007871b          	sext.w	a4,a5
    80201d4c:	fe843783          	ld	a5,-24(s0)
    80201d50:	0ae7a223          	sw	a4,164(a5)
    80201d54:	0001                	nop
    80201d56:	fe843783          	ld	a5,-24(s0)
    80201d5a:	0a47a783          	lw	a5,164(a5)
    80201d5e:	2781                	sext.w	a5,a5
    80201d60:	8b91                	andi	a5,a5,4
    80201d62:	2781                	sext.w	a5,a5
    80201d64:	fbed                	bnez	a5,80201d56 <uart_16550a_init+0xe8>
    80201d66:	fe843783          	ld	a5,-24(s0)
    80201d6a:	0a47a783          	lw	a5,164(a5)
    80201d6e:	2781                	sext.w	a5,a5
    80201d70:	9bf9                	andi	a5,a5,-2
    80201d72:	0007871b          	sext.w	a4,a5
    80201d76:	fe843783          	ld	a5,-24(s0)
    80201d7a:	0ae7a223          	sw	a4,164(a5)
    80201d7e:	fe843783          	ld	a5,-24(s0)
    80201d82:	470d                	li	a4,3
    80201d84:	c7d8                	sw	a4,12(a5)
    80201d86:	fe843783          	ld	a5,-24(s0)
    80201d8a:	479c                	lw	a5,8(a5)
    80201d8c:	2781                	sext.w	a5,a5
    80201d8e:	0017e793          	ori	a5,a5,1
    80201d92:	0007871b          	sext.w	a4,a5
    80201d96:	fe843783          	ld	a5,-24(s0)
    80201d9a:	c798                	sw	a4,8(a5)
    80201d9c:	fe843783          	ld	a5,-24(s0)
    80201da0:	43dc                	lw	a5,4(a5)
    80201da2:	2781                	sext.w	a5,a5
    80201da4:	0017e793          	ori	a5,a5,1
    80201da8:	0007871b          	sext.w	a4,a5
    80201dac:	fe843783          	ld	a5,-24(s0)
    80201db0:	c3d8                	sw	a4,4(a5)
    80201db2:	00002797          	auipc	a5,0x2
    80201db6:	3067b783          	ld	a5,774(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201dba:	00002717          	auipc	a4,0x2
    80201dbe:	25670713          	addi	a4,a4,598 # 80204010 <uart_16550a_ops>
    80201dc2:	630c                	ld	a1,0(a4)
    80201dc4:	6710                	ld	a2,8(a4)
    80201dc6:	6b14                	ld	a3,16(a4)
    80201dc8:	6f18                	ld	a4,24(a4)
    80201dca:	ef8c                	sd	a1,24(a5)
    80201dcc:	f390                	sd	a2,32(a5)
    80201dce:	f794                	sd	a3,40(a5)
    80201dd0:	fb98                	sd	a4,48(a5)
    80201dd2:	0001                	nop
    80201dd4:	6462                	ld	s0,24(sp)
    80201dd6:	6105                	addi	sp,sp,32
    80201dd8:	8082                	ret

0000000080201dda <uart_16550a_read>:
    80201dda:	1101                	addi	sp,sp,-32
    80201ddc:	ec22                	sd	s0,24(sp)
    80201dde:	1000                	addi	s0,sp,32
    80201de0:	00002797          	auipc	a5,0x2
    80201de4:	2d87b783          	ld	a5,728(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201de8:	679c                	ld	a5,8(a5)
    80201dea:	fef43423          	sd	a5,-24(s0)
    80201dee:	fe843783          	ld	a5,-24(s0)
    80201df2:	439c                	lw	a5,0(a5)
    80201df4:	2781                	sext.w	a5,a5
    80201df6:	0187979b          	slliw	a5,a5,0x18
    80201dfa:	4187d79b          	sraiw	a5,a5,0x18
    80201dfe:	853e                	mv	a0,a5
    80201e00:	6462                	ld	s0,24(sp)
    80201e02:	6105                	addi	sp,sp,32
    80201e04:	8082                	ret

0000000080201e06 <uart_16550a_directly_write>:
    80201e06:	7179                	addi	sp,sp,-48
    80201e08:	f422                	sd	s0,40(sp)
    80201e0a:	1800                	addi	s0,sp,48
    80201e0c:	87aa                	mv	a5,a0
    80201e0e:	fcf40fa3          	sb	a5,-33(s0)
    80201e12:	00002797          	auipc	a5,0x2
    80201e16:	2a67b783          	ld	a5,678(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201e1a:	679c                	ld	a5,8(a5)
    80201e1c:	fef43423          	sd	a5,-24(s0)
    80201e20:	fdf40783          	lb	a5,-33(s0)
    80201e24:	0007871b          	sext.w	a4,a5
    80201e28:	fe843783          	ld	a5,-24(s0)
    80201e2c:	c398                	sw	a4,0(a5)
    80201e2e:	0001                	nop
    80201e30:	7422                	ld	s0,40(sp)
    80201e32:	6145                	addi	sp,sp,48
    80201e34:	8082                	ret

0000000080201e36 <uart_16550a_putc>:
    80201e36:	7179                	addi	sp,sp,-48
    80201e38:	f406                	sd	ra,40(sp)
    80201e3a:	f022                	sd	s0,32(sp)
    80201e3c:	1800                	addi	s0,sp,48
    80201e3e:	87aa                	mv	a5,a0
    80201e40:	fcf40fa3          	sb	a5,-33(s0)
    80201e44:	00002797          	auipc	a5,0x2
    80201e48:	2747b783          	ld	a5,628(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201e4c:	679c                	ld	a5,8(a5)
    80201e4e:	fef43423          	sd	a5,-24(s0)
    80201e52:	0001                	nop
    80201e54:	fe843783          	ld	a5,-24(s0)
    80201e58:	4bdc                	lw	a5,20(a5)
    80201e5a:	2781                	sext.w	a5,a5
    80201e5c:	0207f793          	andi	a5,a5,32
    80201e60:	2781                	sext.w	a5,a5
    80201e62:	dbed                	beqz	a5,80201e54 <uart_16550a_putc+0x1e>
    80201e64:	fdf40783          	lb	a5,-33(s0)
    80201e68:	853e                	mv	a0,a5
    80201e6a:	f9dff0ef          	jal	ra,80201e06 <uart_16550a_directly_write>
    80201e6e:	0001                	nop
    80201e70:	70a2                	ld	ra,40(sp)
    80201e72:	7402                	ld	s0,32(sp)
    80201e74:	6145                	addi	sp,sp,48
    80201e76:	8082                	ret

0000000080201e78 <uart_16550a_interrupt_handler>:
    80201e78:	1101                	addi	sp,sp,-32
    80201e7a:	ec06                	sd	ra,24(sp)
    80201e7c:	e822                	sd	s0,16(sp)
    80201e7e:	1000                	addi	s0,sp,32
    80201e80:	00002797          	auipc	a5,0x2
    80201e84:	2387b783          	ld	a5,568(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201e88:	679c                	ld	a5,8(a5)
    80201e8a:	fef43423          	sd	a5,-24(s0)
    80201e8e:	fe843783          	ld	a5,-24(s0)
    80201e92:	479c                	lw	a5,8(a5)
    80201e94:	2781                	sext.w	a5,a5
    80201e96:	8bbd                	andi	a5,a5,15
    80201e98:	2781                	sext.w	a5,a5
    80201e9a:	873e                	mv	a4,a5
    80201e9c:	479d                	li	a5,7
    80201e9e:	02f71863          	bne	a4,a5,80201ece <uart_16550a_interrupt_handler+0x56>
    80201ea2:	fe843783          	ld	a5,-24(s0)
    80201ea6:	5ffc                	lw	a5,124(a5)
    80201ea8:	a01d                	j	80201ece <uart_16550a_interrupt_handler+0x56>
    80201eaa:	d01ff0ef          	jal	ra,80201baa <uart_read>
    80201eae:	87aa                	mv	a5,a0
    80201eb0:	fef403a3          	sb	a5,-25(s0)
    80201eb4:	fe744783          	lbu	a5,-25(s0)
    80201eb8:	0187979b          	slliw	a5,a5,0x18
    80201ebc:	4187d79b          	sraiw	a5,a5,0x18
    80201ec0:	0007c763          	bltz	a5,80201ece <uart_16550a_interrupt_handler+0x56>
    80201ec4:	fe740783          	lb	a5,-25(s0)
    80201ec8:	853e                	mv	a0,a5
    80201eca:	f6dff0ef          	jal	ra,80201e36 <uart_16550a_putc>
    80201ece:	fe843783          	ld	a5,-24(s0)
    80201ed2:	4bdc                	lw	a5,20(a5)
    80201ed4:	2781                	sext.w	a5,a5
    80201ed6:	8b85                	andi	a5,a5,1
    80201ed8:	2781                	sext.w	a5,a5
    80201eda:	fbe1                	bnez	a5,80201eaa <uart_16550a_interrupt_handler+0x32>
    80201edc:	0001                	nop
    80201ede:	0001                	nop
    80201ee0:	60e2                	ld	ra,24(sp)
    80201ee2:	6442                	ld	s0,16(sp)
    80201ee4:	6105                	addi	sp,sp,32
    80201ee6:	8082                	ret

0000000080201ee8 <uart_qemu_init>:
    80201ee8:	1141                	addi	sp,sp,-16
    80201eea:	e406                	sd	ra,8(sp)
    80201eec:	e022                	sd	s0,0(sp)
    80201eee:	0800                	addi	s0,sp,16
    80201ef0:	00002797          	auipc	a5,0x2
    80201ef4:	1c87b783          	ld	a5,456(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201ef8:	10000737          	lui	a4,0x10000
    80201efc:	e798                	sd	a4,8(a5)
    80201efe:	00002797          	auipc	a5,0x2
    80201f02:	1ba7b783          	ld	a5,442(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201f06:	25000713          	li	a4,592
    80201f0a:	00e79823          	sh	a4,16(a5)
    80201f0e:	00e000ef          	jal	ra,80201f1c <uart_16550a_init>
    80201f12:	0001                	nop
    80201f14:	60a2                	ld	ra,8(sp)
    80201f16:	6402                	ld	s0,0(sp)
    80201f18:	0141                	addi	sp,sp,16
    80201f1a:	8082                	ret

0000000080201f1c <uart_16550a_init>:
    80201f1c:	1101                	addi	sp,sp,-32
    80201f1e:	ec22                	sd	s0,24(sp)
    80201f20:	1000                	addi	s0,sp,32
    80201f22:	00002797          	auipc	a5,0x2
    80201f26:	1967b783          	ld	a5,406(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201f2a:	679c                	ld	a5,8(a5)
    80201f2c:	fef43423          	sd	a5,-24(s0)
    80201f30:	fe843783          	ld	a5,-24(s0)
    80201f34:	000780a3          	sb	zero,1(a5)
    80201f38:	0001                	nop
    80201f3a:	fe843783          	ld	a5,-24(s0)
    80201f3e:	0057c783          	lbu	a5,5(a5)
    80201f42:	0ff7f793          	zext.b	a5,a5
    80201f46:	2781                	sext.w	a5,a5
    80201f48:	0207f793          	andi	a5,a5,32
    80201f4c:	2781                	sext.w	a5,a5
    80201f4e:	d7f5                	beqz	a5,80201f3a <uart_16550a_init+0x1e>
    80201f50:	00002797          	auipc	a5,0x2
    80201f54:	1687b783          	ld	a5,360(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201f58:	0107d783          	lhu	a5,16(a5)
    80201f5c:	fef403a3          	sb	a5,-25(s0)
    80201f60:	00002797          	auipc	a5,0x2
    80201f64:	1587b783          	ld	a5,344(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201f68:	0107d783          	lhu	a5,16(a5)
    80201f6c:	0087d79b          	srliw	a5,a5,0x8
    80201f70:	17c2                	slli	a5,a5,0x30
    80201f72:	93c1                	srli	a5,a5,0x30
    80201f74:	fef40323          	sb	a5,-26(s0)
    80201f78:	fe843783          	ld	a5,-24(s0)
    80201f7c:	0037c783          	lbu	a5,3(a5)
    80201f80:	0ff7f793          	zext.b	a5,a5
    80201f84:	f807e793          	ori	a5,a5,-128
    80201f88:	0ff7f713          	zext.b	a4,a5
    80201f8c:	fe843783          	ld	a5,-24(s0)
    80201f90:	00e781a3          	sb	a4,3(a5)
    80201f94:	fe843783          	ld	a5,-24(s0)
    80201f98:	fe744703          	lbu	a4,-25(s0)
    80201f9c:	00e78023          	sb	a4,0(a5)
    80201fa0:	fe843783          	ld	a5,-24(s0)
    80201fa4:	fe644703          	lbu	a4,-26(s0)
    80201fa8:	00e780a3          	sb	a4,1(a5)
    80201fac:	fe843783          	ld	a5,-24(s0)
    80201fb0:	470d                	li	a4,3
    80201fb2:	00e781a3          	sb	a4,3(a5)
    80201fb6:	fe843783          	ld	a5,-24(s0)
    80201fba:	0027c783          	lbu	a5,2(a5)
    80201fbe:	0ff7f793          	zext.b	a5,a5
    80201fc2:	0017e793          	ori	a5,a5,1
    80201fc6:	0ff7f713          	zext.b	a4,a5
    80201fca:	fe843783          	ld	a5,-24(s0)
    80201fce:	00e78123          	sb	a4,2(a5)
    80201fd2:	fe843783          	ld	a5,-24(s0)
    80201fd6:	0017c783          	lbu	a5,1(a5)
    80201fda:	0ff7f793          	zext.b	a5,a5
    80201fde:	0017e793          	ori	a5,a5,1
    80201fe2:	0ff7f713          	zext.b	a4,a5
    80201fe6:	fe843783          	ld	a5,-24(s0)
    80201fea:	00e780a3          	sb	a4,1(a5)
    80201fee:	00002797          	auipc	a5,0x2
    80201ff2:	0ca7b783          	ld	a5,202(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80201ff6:	00002717          	auipc	a4,0x2
    80201ffa:	03a70713          	addi	a4,a4,58 # 80204030 <uart_16550a_ops>
    80201ffe:	630c                	ld	a1,0(a4)
    80202000:	6710                	ld	a2,8(a4)
    80202002:	6b14                	ld	a3,16(a4)
    80202004:	6f18                	ld	a4,24(a4)
    80202006:	ef8c                	sd	a1,24(a5)
    80202008:	f390                	sd	a2,32(a5)
    8020200a:	f794                	sd	a3,40(a5)
    8020200c:	fb98                	sd	a4,48(a5)
    8020200e:	0001                	nop
    80202010:	6462                	ld	s0,24(sp)
    80202012:	6105                	addi	sp,sp,32
    80202014:	8082                	ret

0000000080202016 <uart_16550a_read>:
    80202016:	1101                	addi	sp,sp,-32
    80202018:	ec22                	sd	s0,24(sp)
    8020201a:	1000                	addi	s0,sp,32
    8020201c:	00002797          	auipc	a5,0x2
    80202020:	09c7b783          	ld	a5,156(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    80202024:	679c                	ld	a5,8(a5)
    80202026:	fef43423          	sd	a5,-24(s0)
    8020202a:	fe843783          	ld	a5,-24(s0)
    8020202e:	0007c783          	lbu	a5,0(a5)
    80202032:	0ff7f793          	zext.b	a5,a5
    80202036:	0187979b          	slliw	a5,a5,0x18
    8020203a:	4187d79b          	sraiw	a5,a5,0x18
    8020203e:	853e                	mv	a0,a5
    80202040:	6462                	ld	s0,24(sp)
    80202042:	6105                	addi	sp,sp,32
    80202044:	8082                	ret

0000000080202046 <uart_16550a_directly_write>:
    80202046:	7179                	addi	sp,sp,-48
    80202048:	f422                	sd	s0,40(sp)
    8020204a:	1800                	addi	s0,sp,48
    8020204c:	87aa                	mv	a5,a0
    8020204e:	fcf40fa3          	sb	a5,-33(s0)
    80202052:	00002797          	auipc	a5,0x2
    80202056:	0667b783          	ld	a5,102(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8020205a:	679c                	ld	a5,8(a5)
    8020205c:	fef43423          	sd	a5,-24(s0)
    80202060:	fdf44703          	lbu	a4,-33(s0)
    80202064:	fe843783          	ld	a5,-24(s0)
    80202068:	00e78023          	sb	a4,0(a5)
    8020206c:	0001                	nop
    8020206e:	7422                	ld	s0,40(sp)
    80202070:	6145                	addi	sp,sp,48
    80202072:	8082                	ret

0000000080202074 <uart_16550a_putc>:
    80202074:	7179                	addi	sp,sp,-48
    80202076:	f406                	sd	ra,40(sp)
    80202078:	f022                	sd	s0,32(sp)
    8020207a:	1800                	addi	s0,sp,48
    8020207c:	87aa                	mv	a5,a0
    8020207e:	fcf40fa3          	sb	a5,-33(s0)
    80202082:	00002797          	auipc	a5,0x2
    80202086:	0367b783          	ld	a5,54(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    8020208a:	679c                	ld	a5,8(a5)
    8020208c:	fef43423          	sd	a5,-24(s0)
    80202090:	0001                	nop
    80202092:	fe843783          	ld	a5,-24(s0)
    80202096:	0057c783          	lbu	a5,5(a5)
    8020209a:	0ff7f793          	zext.b	a5,a5
    8020209e:	2781                	sext.w	a5,a5
    802020a0:	0207f793          	andi	a5,a5,32
    802020a4:	2781                	sext.w	a5,a5
    802020a6:	d7f5                	beqz	a5,80202092 <uart_16550a_putc+0x1e>
    802020a8:	fdf40783          	lb	a5,-33(s0)
    802020ac:	853e                	mv	a0,a5
    802020ae:	f99ff0ef          	jal	ra,80202046 <uart_16550a_directly_write>
    802020b2:	0001                	nop
    802020b4:	70a2                	ld	ra,40(sp)
    802020b6:	7402                	ld	s0,32(sp)
    802020b8:	6145                	addi	sp,sp,48
    802020ba:	8082                	ret

00000000802020bc <uart_16550a_interrupt_handler>:
    802020bc:	1101                	addi	sp,sp,-32
    802020be:	ec06                	sd	ra,24(sp)
    802020c0:	e822                	sd	s0,16(sp)
    802020c2:	1000                	addi	s0,sp,32
    802020c4:	00002797          	auipc	a5,0x2
    802020c8:	ff47b783          	ld	a5,-12(a5) # 802040b8 <_GLOBAL_OFFSET_TABLE_+0x8>
    802020cc:	679c                	ld	a5,8(a5)
    802020ce:	fef43423          	sd	a5,-24(s0)
    802020d2:	a01d                	j	802020f8 <uart_16550a_interrupt_handler+0x3c>
    802020d4:	ad7ff0ef          	jal	ra,80201baa <uart_read>
    802020d8:	87aa                	mv	a5,a0
    802020da:	fef403a3          	sb	a5,-25(s0)
    802020de:	fe744783          	lbu	a5,-25(s0)
    802020e2:	0187979b          	slliw	a5,a5,0x18
    802020e6:	4187d79b          	sraiw	a5,a5,0x18
    802020ea:	0007c763          	bltz	a5,802020f8 <uart_16550a_interrupt_handler+0x3c>
    802020ee:	fe740783          	lb	a5,-25(s0)
    802020f2:	853e                	mv	a0,a5
    802020f4:	f81ff0ef          	jal	ra,80202074 <uart_16550a_putc>
    802020f8:	fe843783          	ld	a5,-24(s0)
    802020fc:	0057c783          	lbu	a5,5(a5)
    80202100:	0ff7f793          	zext.b	a5,a5
    80202104:	2781                	sext.w	a5,a5
    80202106:	8b85                	andi	a5,a5,1
    80202108:	2781                	sext.w	a5,a5
    8020210a:	f7e9                	bnez	a5,802020d4 <uart_16550a_interrupt_handler+0x18>
    8020210c:	0001                	nop
    8020210e:	0001                	nop
    80202110:	60e2                	ld	ra,24(sp)
    80202112:	6442                	ld	s0,16(sp)
    80202114:	6105                	addi	sp,sp,32
    80202116:	8082                	ret

0000000080202118 <goldfish_rtc_read_time>:
    80202118:	7179                	addi	sp,sp,-48
    8020211a:	f422                	sd	s0,40(sp)
    8020211c:	1800                	addi	s0,sp,48
    8020211e:	001017b7          	lui	a5,0x101
    80202122:	fef43423          	sd	a5,-24(s0)
    80202126:	fe843783          	ld	a5,-24(s0)
    8020212a:	439c                	lw	a5,0(a5)
    8020212c:	fef42223          	sw	a5,-28(s0)
    80202130:	fe843783          	ld	a5,-24(s0)
    80202134:	43dc                	lw	a5,4(a5)
    80202136:	fef42023          	sw	a5,-32(s0)
    8020213a:	fe046783          	lwu	a5,-32(s0)
    8020213e:	02079713          	slli	a4,a5,0x20
    80202142:	fe446783          	lwu	a5,-28(s0)
    80202146:	8fd9                	or	a5,a5,a4
    80202148:	fcf43c23          	sd	a5,-40(s0)
    8020214c:	fd843783          	ld	a5,-40(s0)
    80202150:	853e                	mv	a0,a5
    80202152:	7422                	ld	s0,40(sp)
    80202154:	6145                	addi	sp,sp,48
    80202156:	8082                	ret

0000000080202158 <goldfish_rtc_set_time>:
    80202158:	7179                	addi	sp,sp,-48
    8020215a:	f422                	sd	s0,40(sp)
    8020215c:	1800                	addi	s0,sp,48
    8020215e:	fca43c23          	sd	a0,-40(s0)
    80202162:	001017b7          	lui	a5,0x101
    80202166:	fef43423          	sd	a5,-24(s0)
    8020216a:	fd843783          	ld	a5,-40(s0)
    8020216e:	9381                	srli	a5,a5,0x20
    80202170:	0007871b          	sext.w	a4,a5
    80202174:	fe843783          	ld	a5,-24(s0)
    80202178:	c3d8                	sw	a4,4(a5)
    8020217a:	fd843783          	ld	a5,-40(s0)
    8020217e:	0007871b          	sext.w	a4,a5
    80202182:	fe843783          	ld	a5,-24(s0)
    80202186:	c398                	sw	a4,0(a5)
    80202188:	0001                	nop
    8020218a:	7422                	ld	s0,40(sp)
    8020218c:	6145                	addi	sp,sp,48
    8020218e:	8082                	ret

0000000080202190 <goldfish_rtc_read_alarm>:
    80202190:	7179                	addi	sp,sp,-48
    80202192:	f422                	sd	s0,40(sp)
    80202194:	1800                	addi	s0,sp,48
    80202196:	001017b7          	lui	a5,0x101
    8020219a:	fef43423          	sd	a5,-24(s0)
    8020219e:	fe843783          	ld	a5,-24(s0)
    802021a2:	479c                	lw	a5,8(a5)
    802021a4:	fef42223          	sw	a5,-28(s0)
    802021a8:	fe843783          	ld	a5,-24(s0)
    802021ac:	47dc                	lw	a5,12(a5)
    802021ae:	fef42023          	sw	a5,-32(s0)
    802021b2:	fe046783          	lwu	a5,-32(s0)
    802021b6:	02079713          	slli	a4,a5,0x20
    802021ba:	fe446783          	lwu	a5,-28(s0)
    802021be:	8fd9                	or	a5,a5,a4
    802021c0:	fcf43c23          	sd	a5,-40(s0)
    802021c4:	fd843783          	ld	a5,-40(s0)
    802021c8:	853e                	mv	a0,a5
    802021ca:	7422                	ld	s0,40(sp)
    802021cc:	6145                	addi	sp,sp,48
    802021ce:	8082                	ret

00000000802021d0 <goldfish_rtc_set_alarm>:
    802021d0:	7179                	addi	sp,sp,-48
    802021d2:	f422                	sd	s0,40(sp)
    802021d4:	1800                	addi	s0,sp,48
    802021d6:	fca43c23          	sd	a0,-40(s0)
    802021da:	001017b7          	lui	a5,0x101
    802021de:	fef43423          	sd	a5,-24(s0)
    802021e2:	fd843783          	ld	a5,-40(s0)
    802021e6:	9381                	srli	a5,a5,0x20
    802021e8:	0007871b          	sext.w	a4,a5
    802021ec:	fe843783          	ld	a5,-24(s0)
    802021f0:	c7d8                	sw	a4,12(a5)
    802021f2:	fd843783          	ld	a5,-40(s0)
    802021f6:	0007871b          	sext.w	a4,a5
    802021fa:	fe843783          	ld	a5,-24(s0)
    802021fe:	c798                	sw	a4,8(a5)
    80202200:	fe843783          	ld	a5,-24(s0)
    80202204:	4705                	li	a4,1
    80202206:	cb98                	sw	a4,16(a5)
    80202208:	0001                	nop
    8020220a:	7422                	ld	s0,40(sp)
    8020220c:	6145                	addi	sp,sp,48
    8020220e:	8082                	ret

0000000080202210 <goldfish_rtc_clear_alarm>:
    80202210:	1101                	addi	sp,sp,-32
    80202212:	ec22                	sd	s0,24(sp)
    80202214:	1000                	addi	s0,sp,32
    80202216:	001017b7          	lui	a5,0x101
    8020221a:	fef43423          	sd	a5,-24(s0)
    8020221e:	fe843783          	ld	a5,-24(s0)
    80202222:	4f9c                	lw	a5,24(a5)
    80202224:	2781                	sext.w	a5,a5
    80202226:	1782                	slli	a5,a5,0x20
    80202228:	9381                	srli	a5,a5,0x20
    8020222a:	fef43023          	sd	a5,-32(s0)
    8020222e:	fe043783          	ld	a5,-32(s0)
    80202232:	c789                	beqz	a5,8020223c <goldfish_rtc_clear_alarm+0x2c>
    80202234:	fe843783          	ld	a5,-24(s0)
    80202238:	4705                	li	a4,1
    8020223a:	cbd8                	sw	a4,20(a5)
    8020223c:	0001                	nop
    8020223e:	6462                	ld	s0,24(sp)
    80202240:	6105                	addi	sp,sp,32
    80202242:	8082                	ret

0000000080202244 <goldfish_rtc_interrupt_handler>:
    80202244:	1101                	addi	sp,sp,-32
    80202246:	ec22                	sd	s0,24(sp)
    80202248:	1000                	addi	s0,sp,32
    8020224a:	001017b7          	lui	a5,0x101
    8020224e:	fef43423          	sd	a5,-24(s0)
    80202252:	fe843783          	ld	a5,-24(s0)
    80202256:	4705                	li	a4,1
    80202258:	cfd8                	sw	a4,28(a5)
    8020225a:	0001                	nop
    8020225c:	6462                	ld	s0,24(sp)
    8020225e:	6105                	addi	sp,sp,32
    80202260:	8082                	ret

0000000080202262 <goldfish_rtc_init>:
    80202262:	1141                	addi	sp,sp,-16
    80202264:	e422                	sd	s0,8(sp)
    80202266:	0800                	addi	s0,sp,16
    80202268:	00002797          	auipc	a5,0x2
    8020226c:	e807b783          	ld	a5,-384(a5) # 802040e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    80202270:	00002717          	auipc	a4,0x2
    80202274:	de070713          	addi	a4,a4,-544 # 80204050 <goldfish_rtc_ops>
    80202278:	00073803          	ld	a6,0(a4)
    8020227c:	6708                	ld	a0,8(a4)
    8020227e:	6b0c                	ld	a1,16(a4)
    80202280:	6f10                	ld	a2,24(a4)
    80202282:	7314                	ld	a3,32(a4)
    80202284:	7718                	ld	a4,40(a4)
    80202286:	0107b423          	sd	a6,8(a5)
    8020228a:	eb88                	sd	a0,16(a5)
    8020228c:	ef8c                	sd	a1,24(a5)
    8020228e:	f390                	sd	a2,32(a5)
    80202290:	f794                	sd	a3,40(a5)
    80202292:	fb98                	sd	a4,48(a5)
    80202294:	0001                	nop
    80202296:	6422                	ld	s0,8(sp)
    80202298:	0141                	addi	sp,sp,16
    8020229a:	8082                	ret

000000008020229c <timestamp_to_day_hh_mm_ss>:
    8020229c:	7139                	addi	sp,sp,-64
    8020229e:	fc22                	sd	s0,56(sp)
    802022a0:	0080                	addi	s0,sp,64
    802022a2:	fea43423          	sd	a0,-24(s0)
    802022a6:	feb43023          	sd	a1,-32(s0)
    802022aa:	fcc43c23          	sd	a2,-40(s0)
    802022ae:	fcd43823          	sd	a3,-48(s0)
    802022b2:	fce43423          	sd	a4,-56(s0)
    802022b6:	fe843703          	ld	a4,-24(s0)
    802022ba:	3b9ad7b7          	lui	a5,0x3b9ad
    802022be:	a0078793          	addi	a5,a5,-1536 # 3b9aca00 <XLENB+0x3b9ac9f8>
    802022c2:	02f757b3          	divu	a5,a4,a5
    802022c6:	fef43423          	sd	a5,-24(s0)
    802022ca:	fe843703          	ld	a4,-24(s0)
    802022ce:	67d5                	lui	a5,0x15
    802022d0:	18078793          	addi	a5,a5,384 # 15180 <XLENB+0x15178>
    802022d4:	02f75733          	divu	a4,a4,a5
    802022d8:	fe043783          	ld	a5,-32(s0)
    802022dc:	e398                	sd	a4,0(a5)
    802022de:	fe843703          	ld	a4,-24(s0)
    802022e2:	67d5                	lui	a5,0x15
    802022e4:	18078793          	addi	a5,a5,384 # 15180 <XLENB+0x15178>
    802022e8:	02f77733          	remu	a4,a4,a5
    802022ec:	6785                	lui	a5,0x1
    802022ee:	e1078793          	addi	a5,a5,-496 # e10 <XLENB+0xe08>
    802022f2:	02f75733          	divu	a4,a4,a5
    802022f6:	fd843783          	ld	a5,-40(s0)
    802022fa:	e398                	sd	a4,0(a5)
    802022fc:	fe843703          	ld	a4,-24(s0)
    80202300:	6785                	lui	a5,0x1
    80202302:	e1078793          	addi	a5,a5,-496 # e10 <XLENB+0xe08>
    80202306:	02f77733          	remu	a4,a4,a5
    8020230a:	03c00793          	li	a5,60
    8020230e:	02f75733          	divu	a4,a4,a5
    80202312:	fd043783          	ld	a5,-48(s0)
    80202316:	e398                	sd	a4,0(a5)
    80202318:	fe843703          	ld	a4,-24(s0)
    8020231c:	03c00793          	li	a5,60
    80202320:	02f77733          	remu	a4,a4,a5
    80202324:	fc843783          	ld	a5,-56(s0)
    80202328:	e398                	sd	a4,0(a5)
    8020232a:	0001                	nop
    8020232c:	7462                	ld	s0,56(sp)
    8020232e:	6121                	addi	sp,sp,64
    80202330:	8082                	ret

0000000080202332 <day_hh_mm_ss_to_timestamp>:
    80202332:	7139                	addi	sp,sp,-64
    80202334:	fc22                	sd	s0,56(sp)
    80202336:	0080                	addi	s0,sp,64
    80202338:	fca43c23          	sd	a0,-40(s0)
    8020233c:	fcb43823          	sd	a1,-48(s0)
    80202340:	fcc43423          	sd	a2,-56(s0)
    80202344:	fcd43023          	sd	a3,-64(s0)
    80202348:	fd843703          	ld	a4,-40(s0)
    8020234c:	67d5                	lui	a5,0x15
    8020234e:	18078793          	addi	a5,a5,384 # 15180 <XLENB+0x15178>
    80202352:	02f70733          	mul	a4,a4,a5
    80202356:	fd043683          	ld	a3,-48(s0)
    8020235a:	6785                	lui	a5,0x1
    8020235c:	e1078793          	addi	a5,a5,-496 # e10 <XLENB+0xe08>
    80202360:	02f687b3          	mul	a5,a3,a5
    80202364:	00f706b3          	add	a3,a4,a5
    80202368:	fc843703          	ld	a4,-56(s0)
    8020236c:	87ba                	mv	a5,a4
    8020236e:	0792                	slli	a5,a5,0x4
    80202370:	8f99                	sub	a5,a5,a4
    80202372:	078a                	slli	a5,a5,0x2
    80202374:	97b6                	add	a5,a5,a3
    80202376:	fc043703          	ld	a4,-64(s0)
    8020237a:	97ba                	add	a5,a5,a4
    8020237c:	fef43423          	sd	a5,-24(s0)
    80202380:	fe843703          	ld	a4,-24(s0)
    80202384:	3b9ad7b7          	lui	a5,0x3b9ad
    80202388:	a0078793          	addi	a5,a5,-1536 # 3b9aca00 <XLENB+0x3b9ac9f8>
    8020238c:	02f707b3          	mul	a5,a4,a5
    80202390:	853e                	mv	a0,a5
    80202392:	7462                	ld	s0,56(sp)
    80202394:	6121                	addi	sp,sp,64
    80202396:	8082                	ret

0000000080202398 <sunxi_rtc_read_time>:
    80202398:	7179                	addi	sp,sp,-48
    8020239a:	f406                	sd	ra,40(sp)
    8020239c:	f022                	sd	s0,32(sp)
    8020239e:	1800                	addi	s0,sp,48
    802023a0:	070907b7          	lui	a5,0x7090
    802023a4:	fef43423          	sd	a5,-24(s0)
    802023a8:	fe843783          	ld	a5,-24(s0)
    802023ac:	4b9c                	lw	a5,16(a5)
    802023ae:	2781                	sext.w	a5,a5
    802023b0:	1782                	slli	a5,a5,0x20
    802023b2:	9381                	srli	a5,a5,0x20
    802023b4:	fef43023          	sd	a5,-32(s0)
    802023b8:	fe843783          	ld	a5,-24(s0)
    802023bc:	4bdc                	lw	a5,20(a5)
    802023be:	2781                	sext.w	a5,a5
    802023c0:	1782                	slli	a5,a5,0x20
    802023c2:	9381                	srli	a5,a5,0x20
    802023c4:	fcf43c23          	sd	a5,-40(s0)
    802023c8:	fd843783          	ld	a5,-40(s0)
    802023cc:	83c1                	srli	a5,a5,0x10
    802023ce:	01f7f713          	andi	a4,a5,31
    802023d2:	fd843783          	ld	a5,-40(s0)
    802023d6:	83a1                	srli	a5,a5,0x8
    802023d8:	03f7f613          	andi	a2,a5,63
    802023dc:	fd843783          	ld	a5,-40(s0)
    802023e0:	03f7f793          	andi	a5,a5,63
    802023e4:	86be                	mv	a3,a5
    802023e6:	85ba                	mv	a1,a4
    802023e8:	fe043503          	ld	a0,-32(s0)
    802023ec:	f47ff0ef          	jal	ra,80202332 <day_hh_mm_ss_to_timestamp>
    802023f0:	87aa                	mv	a5,a0
    802023f2:	853e                	mv	a0,a5
    802023f4:	70a2                	ld	ra,40(sp)
    802023f6:	7402                	ld	s0,32(sp)
    802023f8:	6145                	addi	sp,sp,48
    802023fa:	8082                	ret

00000000802023fc <sunxi_rtc_set_time>:
    802023fc:	715d                	addi	sp,sp,-80
    802023fe:	e486                	sd	ra,72(sp)
    80202400:	e0a2                	sd	s0,64(sp)
    80202402:	0880                	addi	s0,sp,80
    80202404:	faa43c23          	sd	a0,-72(s0)
    80202408:	070907b7          	lui	a5,0x7090
    8020240c:	fef43423          	sd	a5,-24(s0)
    80202410:	fc840713          	addi	a4,s0,-56
    80202414:	fd040693          	addi	a3,s0,-48
    80202418:	fd840613          	addi	a2,s0,-40
    8020241c:	fe040793          	addi	a5,s0,-32
    80202420:	85be                	mv	a1,a5
    80202422:	fb843503          	ld	a0,-72(s0)
    80202426:	e77ff0ef          	jal	ra,8020229c <timestamp_to_day_hh_mm_ss>
    8020242a:	fe843783          	ld	a5,-24(s0)
    8020242e:	439c                	lw	a5,0(a5)
    80202430:	2781                	sext.w	a5,a5
    80202432:	1807f793          	andi	a5,a5,384
    80202436:	2781                	sext.w	a5,a5
    80202438:	cb81                	beqz	a5,80202448 <sunxi_rtc_set_time+0x4c>
    8020243a:	00001517          	auipc	a0,0x1
    8020243e:	6ce50513          	addi	a0,a0,1742 # 80203b08 <rodata_start+0xb08>
    80202442:	258000ef          	jal	ra,8020269a <kprintf>
    80202446:	a0b1                	j	80202492 <sunxi_rtc_set_time+0x96>
    80202448:	fb843783          	ld	a5,-72(s0)
    8020244c:	83a5                	srli	a5,a5,0x9
    8020244e:	faf43c23          	sd	a5,-72(s0)
    80202452:	fe043783          	ld	a5,-32(s0)
    80202456:	0007871b          	sext.w	a4,a5
    8020245a:	fe843783          	ld	a5,-24(s0)
    8020245e:	cb98                	sw	a4,16(a5)
    80202460:	fd843783          	ld	a5,-40(s0)
    80202464:	2781                	sext.w	a5,a5
    80202466:	0107979b          	slliw	a5,a5,0x10
    8020246a:	0007871b          	sext.w	a4,a5
    8020246e:	fd043783          	ld	a5,-48(s0)
    80202472:	2781                	sext.w	a5,a5
    80202474:	0087979b          	slliw	a5,a5,0x8
    80202478:	2781                	sext.w	a5,a5
    8020247a:	8fd9                	or	a5,a5,a4
    8020247c:	0007871b          	sext.w	a4,a5
    80202480:	fc843783          	ld	a5,-56(s0)
    80202484:	2781                	sext.w	a5,a5
    80202486:	8fd9                	or	a5,a5,a4
    80202488:	0007871b          	sext.w	a4,a5
    8020248c:	fe843783          	ld	a5,-24(s0)
    80202490:	cbd8                	sw	a4,20(a5)
    80202492:	60a6                	ld	ra,72(sp)
    80202494:	6406                	ld	s0,64(sp)
    80202496:	6161                	addi	sp,sp,80
    80202498:	8082                	ret

000000008020249a <sunxi_rtc_set_alarm>:
    8020249a:	715d                	addi	sp,sp,-80
    8020249c:	e486                	sd	ra,72(sp)
    8020249e:	e0a2                	sd	s0,64(sp)
    802024a0:	0880                	addi	s0,sp,80
    802024a2:	faa43c23          	sd	a0,-72(s0)
    802024a6:	070907b7          	lui	a5,0x7090
    802024aa:	fef43423          	sd	a5,-24(s0)
    802024ae:	fe843783          	ld	a5,-24(s0)
    802024b2:	4705                	li	a4,1
    802024b4:	d7d8                	sw	a4,44(a5)
    802024b6:	fb843783          	ld	a5,-72(s0)
    802024ba:	c1878793          	addi	a5,a5,-1000 # 708fc18 <XLENB+0x708fc10>
    802024be:	fc840713          	addi	a4,s0,-56
    802024c2:	fd040693          	addi	a3,s0,-48
    802024c6:	fd840613          	addi	a2,s0,-40
    802024ca:	fe040593          	addi	a1,s0,-32
    802024ce:	853e                	mv	a0,a5
    802024d0:	dcdff0ef          	jal	ra,8020229c <timestamp_to_day_hh_mm_ss>
    802024d4:	fb843783          	ld	a5,-72(s0)
    802024d8:	83a5                	srli	a5,a5,0x9
    802024da:	faf43c23          	sd	a5,-72(s0)
    802024de:	fe043783          	ld	a5,-32(s0)
    802024e2:	0007871b          	sext.w	a4,a5
    802024e6:	fe843783          	ld	a5,-24(s0)
    802024ea:	d398                	sw	a4,32(a5)
    802024ec:	fd843783          	ld	a5,-40(s0)
    802024f0:	2781                	sext.w	a5,a5
    802024f2:	0107979b          	slliw	a5,a5,0x10
    802024f6:	0007871b          	sext.w	a4,a5
    802024fa:	fd043783          	ld	a5,-48(s0)
    802024fe:	2781                	sext.w	a5,a5
    80202500:	0087979b          	slliw	a5,a5,0x8
    80202504:	2781                	sext.w	a5,a5
    80202506:	8fd9                	or	a5,a5,a4
    80202508:	0007871b          	sext.w	a4,a5
    8020250c:	fc843783          	ld	a5,-56(s0)
    80202510:	2781                	sext.w	a5,a5
    80202512:	8fd9                	or	a5,a5,a4
    80202514:	0007871b          	sext.w	a4,a5
    80202518:	fe843783          	ld	a5,-24(s0)
    8020251c:	d3d8                	sw	a4,36(a5)
    8020251e:	fe843783          	ld	a5,-24(s0)
    80202522:	4705                	li	a4,1
    80202524:	d798                	sw	a4,40(a5)
    80202526:	0001                	nop
    80202528:	60a6                	ld	ra,72(sp)
    8020252a:	6406                	ld	s0,64(sp)
    8020252c:	6161                	addi	sp,sp,80
    8020252e:	8082                	ret

0000000080202530 <sunxi_rtc_read_alarm>:
    80202530:	7179                	addi	sp,sp,-48
    80202532:	f406                	sd	ra,40(sp)
    80202534:	f022                	sd	s0,32(sp)
    80202536:	1800                	addi	s0,sp,48
    80202538:	070907b7          	lui	a5,0x7090
    8020253c:	fef43423          	sd	a5,-24(s0)
    80202540:	fe843783          	ld	a5,-24(s0)
    80202544:	539c                	lw	a5,32(a5)
    80202546:	2781                	sext.w	a5,a5
    80202548:	1782                	slli	a5,a5,0x20
    8020254a:	9381                	srli	a5,a5,0x20
    8020254c:	fef43023          	sd	a5,-32(s0)
    80202550:	fe843783          	ld	a5,-24(s0)
    80202554:	53dc                	lw	a5,36(a5)
    80202556:	2781                	sext.w	a5,a5
    80202558:	1782                	slli	a5,a5,0x20
    8020255a:	9381                	srli	a5,a5,0x20
    8020255c:	fcf43c23          	sd	a5,-40(s0)
    80202560:	fd843783          	ld	a5,-40(s0)
    80202564:	83c1                	srli	a5,a5,0x10
    80202566:	01f7f713          	andi	a4,a5,31
    8020256a:	fd843783          	ld	a5,-40(s0)
    8020256e:	83a1                	srli	a5,a5,0x8
    80202570:	03f7f613          	andi	a2,a5,63
    80202574:	fd843783          	ld	a5,-40(s0)
    80202578:	03f7f793          	andi	a5,a5,63
    8020257c:	86be                	mv	a3,a5
    8020257e:	85ba                	mv	a1,a4
    80202580:	fe043503          	ld	a0,-32(s0)
    80202584:	dafff0ef          	jal	ra,80202332 <day_hh_mm_ss_to_timestamp>
    80202588:	87aa                	mv	a5,a0
    8020258a:	853e                	mv	a0,a5
    8020258c:	70a2                	ld	ra,40(sp)
    8020258e:	7402                	ld	s0,32(sp)
    80202590:	6145                	addi	sp,sp,48
    80202592:	8082                	ret

0000000080202594 <sunxi_rtc_interrupt_handler>:
    80202594:	1101                	addi	sp,sp,-32
    80202596:	ec22                	sd	s0,24(sp)
    80202598:	1000                	addi	s0,sp,32
    8020259a:	070907b7          	lui	a5,0x7090
    8020259e:	fef43423          	sd	a5,-24(s0)
    802025a2:	fe843783          	ld	a5,-24(s0)
    802025a6:	4705                	li	a4,1
    802025a8:	db98                	sw	a4,48(a5)
    802025aa:	0001                	nop
    802025ac:	6462                	ld	s0,24(sp)
    802025ae:	6105                	addi	sp,sp,32
    802025b0:	8082                	ret

00000000802025b2 <sunxi_rtc_clear_alarm>:
    802025b2:	1101                	addi	sp,sp,-32
    802025b4:	ec22                	sd	s0,24(sp)
    802025b6:	1000                	addi	s0,sp,32
    802025b8:	070907b7          	lui	a5,0x7090
    802025bc:	fef43423          	sd	a5,-24(s0)
    802025c0:	fe843783          	ld	a5,-24(s0)
    802025c4:	0207a623          	sw	zero,44(a5) # 709002c <XLENB+0x7090024>
    802025c8:	fe843783          	ld	a5,-24(s0)
    802025cc:	4705                	li	a4,1
    802025ce:	db98                	sw	a4,48(a5)
    802025d0:	fe843783          	ld	a5,-24(s0)
    802025d4:	0207a423          	sw	zero,40(a5)
    802025d8:	0001                	nop
    802025da:	6462                	ld	s0,24(sp)
    802025dc:	6105                	addi	sp,sp,32
    802025de:	8082                	ret

00000000802025e0 <sunxi_rtc_init>:
    802025e0:	1141                	addi	sp,sp,-16
    802025e2:	e422                	sd	s0,8(sp)
    802025e4:	0800                	addi	s0,sp,16
    802025e6:	00002797          	auipc	a5,0x2
    802025ea:	b027b783          	ld	a5,-1278(a5) # 802040e8 <_GLOBAL_OFFSET_TABLE_+0x38>
    802025ee:	00002717          	auipc	a4,0x2
    802025f2:	a9270713          	addi	a4,a4,-1390 # 80204080 <sunxi_rtc_ops>
    802025f6:	00073803          	ld	a6,0(a4)
    802025fa:	6708                	ld	a0,8(a4)
    802025fc:	6b0c                	ld	a1,16(a4)
    802025fe:	6f10                	ld	a2,24(a4)
    80202600:	7314                	ld	a3,32(a4)
    80202602:	7718                	ld	a4,40(a4)
    80202604:	0107b423          	sd	a6,8(a5)
    80202608:	eb88                	sd	a0,16(a5)
    8020260a:	ef8c                	sd	a1,24(a5)
    8020260c:	f390                	sd	a2,32(a5)
    8020260e:	f794                	sd	a3,40(a5)
    80202610:	fb98                	sd	a4,48(a5)
    80202612:	0001                	nop
    80202614:	6422                	ld	s0,8(sp)
    80202616:	0141                	addi	sp,sp,16
    80202618:	8082                	ret

000000008020261a <kputchar>:
    8020261a:	1101                	addi	sp,sp,-32
    8020261c:	ec06                	sd	ra,24(sp)
    8020261e:	e822                	sd	s0,16(sp)
    80202620:	1000                	addi	s0,sp,32
    80202622:	87aa                	mv	a5,a0
    80202624:	fef407a3          	sb	a5,-17(s0)
    80202628:	fef44783          	lbu	a5,-17(s0)
    8020262c:	853e                	mv	a0,a5
    8020262e:	3f8000ef          	jal	ra,80202a26 <sbi_console_putchar>
    80202632:	0001                	nop
    80202634:	60e2                	ld	ra,24(sp)
    80202636:	6442                	ld	s0,16(sp)
    80202638:	6105                	addi	sp,sp,32
    8020263a:	8082                	ret

000000008020263c <kputs>:
    8020263c:	7179                	addi	sp,sp,-48
    8020263e:	f406                	sd	ra,40(sp)
    80202640:	f022                	sd	s0,32(sp)
    80202642:	1800                	addi	s0,sp,48
    80202644:	fca43c23          	sd	a0,-40(s0)
    80202648:	fd843783          	ld	a5,-40(s0)
    8020264c:	fef43423          	sd	a5,-24(s0)
    80202650:	a829                	j	8020266a <kputs+0x2e>
    80202652:	fd843783          	ld	a5,-40(s0)
    80202656:	0007c783          	lbu	a5,0(a5)
    8020265a:	853e                	mv	a0,a5
    8020265c:	fbfff0ef          	jal	ra,8020261a <kputchar>
    80202660:	fd843783          	ld	a5,-40(s0)
    80202664:	0785                	addi	a5,a5,1
    80202666:	fcf43c23          	sd	a5,-40(s0)
    8020266a:	fd843783          	ld	a5,-40(s0)
    8020266e:	0007c783          	lbu	a5,0(a5)
    80202672:	f3e5                	bnez	a5,80202652 <kputs+0x16>
    80202674:	4529                	li	a0,10
    80202676:	fa5ff0ef          	jal	ra,8020261a <kputchar>
    8020267a:	fe843703          	ld	a4,-24(s0)
    8020267e:	fd843783          	ld	a5,-40(s0)
    80202682:	40f707b3          	sub	a5,a4,a5
    80202686:	0017b793          	seqz	a5,a5
    8020268a:	0ff7f793          	zext.b	a5,a5
    8020268e:	2781                	sext.w	a5,a5
    80202690:	853e                	mv	a0,a5
    80202692:	70a2                	ld	ra,40(sp)
    80202694:	7402                	ld	s0,32(sp)
    80202696:	6145                	addi	sp,sp,48
    80202698:	8082                	ret

000000008020269a <kprintf>:
    8020269a:	7135                	addi	sp,sp,-160
    8020269c:	ec86                	sd	ra,88(sp)
    8020269e:	e8a2                	sd	s0,80(sp)
    802026a0:	1080                	addi	s0,sp,96
    802026a2:	faa43423          	sd	a0,-88(s0)
    802026a6:	e40c                	sd	a1,8(s0)
    802026a8:	e810                	sd	a2,16(s0)
    802026aa:	ec14                	sd	a3,24(s0)
    802026ac:	f018                	sd	a4,32(s0)
    802026ae:	f41c                	sd	a5,40(s0)
    802026b0:	03043823          	sd	a6,48(s0)
    802026b4:	03143c23          	sd	a7,56(s0)
    802026b8:	fc043c23          	sd	zero,-40(s0)
    802026bc:	fc043823          	sd	zero,-48(s0)
    802026c0:	04040793          	addi	a5,s0,64
    802026c4:	faf43023          	sd	a5,-96(s0)
    802026c8:	fa043783          	ld	a5,-96(s0)
    802026cc:	fc878793          	addi	a5,a5,-56
    802026d0:	faf43c23          	sd	a5,-72(s0)
    802026d4:	acc9                	j	802029a6 <kprintf+0x30c>
    802026d6:	fa843783          	ld	a5,-88(s0)
    802026da:	0007c783          	lbu	a5,0(a5)
    802026de:	2781                	sext.w	a5,a5
    802026e0:	86be                	mv	a3,a5
    802026e2:	02500713          	li	a4,37
    802026e6:	02e68863          	beq	a3,a4,80202716 <kprintf+0x7c>
    802026ea:	86be                	mv	a3,a5
    802026ec:	02500713          	li	a4,37
    802026f0:	28d74f63          	blt	a4,a3,8020298e <kprintf+0x2f4>
    802026f4:	86be                	mv	a3,a5
    802026f6:	4735                	li	a4,13
    802026f8:	26e68963          	beq	a3,a4,8020296a <kprintf+0x2d0>
    802026fc:	86be                	mv	a3,a5
    802026fe:	4735                	li	a4,13
    80202700:	28d74763          	blt	a4,a3,8020298e <kprintf+0x2f4>
    80202704:	86be                	mv	a3,a5
    80202706:	4725                	li	a4,9
    80202708:	26e68a63          	beq	a3,a4,8020297c <kprintf+0x2e2>
    8020270c:	873e                	mv	a4,a5
    8020270e:	47a9                	li	a5,10
    80202710:	24f70463          	beq	a4,a5,80202958 <kprintf+0x2be>
    80202714:	acad                	j	8020298e <kprintf+0x2f4>
    80202716:	fa843783          	ld	a5,-88(s0)
    8020271a:	0785                	addi	a5,a5,1
    8020271c:	faf43423          	sd	a5,-88(s0)
    80202720:	fa843783          	ld	a5,-88(s0)
    80202724:	0007c783          	lbu	a5,0(a5)
    80202728:	2781                	sext.w	a5,a5
    8020272a:	f9d7869b          	addiw	a3,a5,-99
    8020272e:	0006871b          	sext.w	a4,a3
    80202732:	47d5                	li	a5,21
    80202734:	22e7e063          	bltu	a5,a4,80202954 <kprintf+0x2ba>
    80202738:	02069793          	slli	a5,a3,0x20
    8020273c:	9381                	srli	a5,a5,0x20
    8020273e:	00279713          	slli	a4,a5,0x2
    80202742:	00001797          	auipc	a5,0x1
    80202746:	3f678793          	addi	a5,a5,1014 # 80203b38 <rodata_start+0xb38>
    8020274a:	97ba                	add	a5,a5,a4
    8020274c:	439c                	lw	a5,0(a5)
    8020274e:	0007871b          	sext.w	a4,a5
    80202752:	00001797          	auipc	a5,0x1
    80202756:	3e678793          	addi	a5,a5,998 # 80203b38 <rodata_start+0xb38>
    8020275a:	97ba                	add	a5,a5,a4
    8020275c:	8782                	jr	a5
    8020275e:	fb843783          	ld	a5,-72(s0)
    80202762:	00878713          	addi	a4,a5,8
    80202766:	fae43c23          	sd	a4,-72(s0)
    8020276a:	639c                	ld	a5,0(a5)
    8020276c:	fcf43423          	sd	a5,-56(s0)
    80202770:	fc843783          	ld	a5,-56(s0)
    80202774:	fef43423          	sd	a5,-24(s0)
    80202778:	fe043023          	sd	zero,-32(s0)
    8020277c:	fe043783          	ld	a5,-32(s0)
    80202780:	0785                	addi	a5,a5,1
    80202782:	fef43023          	sd	a5,-32(s0)
    80202786:	fe843703          	ld	a4,-24(s0)
    8020278a:	47a9                	li	a5,10
    8020278c:	02f757b3          	divu	a5,a4,a5
    80202790:	fef43423          	sd	a5,-24(s0)
    80202794:	fe843783          	ld	a5,-24(s0)
    80202798:	f3f5                	bnez	a5,8020277c <kprintf+0xe2>
    8020279a:	fd843703          	ld	a4,-40(s0)
    8020279e:	fe043783          	ld	a5,-32(s0)
    802027a2:	97ba                	add	a5,a5,a4
    802027a4:	fcf43c23          	sd	a5,-40(s0)
    802027a8:	fc843783          	ld	a5,-56(s0)
    802027ac:	fef43423          	sd	a5,-24(s0)
    802027b0:	a8a9                	j	8020280a <kprintf+0x170>
    802027b2:	fe043783          	ld	a5,-32(s0)
    802027b6:	17fd                	addi	a5,a5,-1
    802027b8:	85be                	mv	a1,a5
    802027ba:	4529                	li	a0,10
    802027bc:	206000ef          	jal	ra,802029c2 <kpow>
    802027c0:	872a                	mv	a4,a0
    802027c2:	fe843783          	ld	a5,-24(s0)
    802027c6:	02e7d7b3          	divu	a5,a5,a4
    802027ca:	fcf42223          	sw	a5,-60(s0)
    802027ce:	fe043783          	ld	a5,-32(s0)
    802027d2:	17fd                	addi	a5,a5,-1
    802027d4:	85be                	mv	a1,a5
    802027d6:	4529                	li	a0,10
    802027d8:	1ea000ef          	jal	ra,802029c2 <kpow>
    802027dc:	872a                	mv	a4,a0
    802027de:	fe843783          	ld	a5,-24(s0)
    802027e2:	02e7f7b3          	remu	a5,a5,a4
    802027e6:	fef43423          	sd	a5,-24(s0)
    802027ea:	fc442783          	lw	a5,-60(s0)
    802027ee:	0ff7f793          	zext.b	a5,a5
    802027f2:	0307879b          	addiw	a5,a5,48
    802027f6:	0ff7f793          	zext.b	a5,a5
    802027fa:	853e                	mv	a0,a5
    802027fc:	e1fff0ef          	jal	ra,8020261a <kputchar>
    80202800:	fe043783          	ld	a5,-32(s0)
    80202804:	17fd                	addi	a5,a5,-1
    80202806:	fef43023          	sd	a5,-32(s0)
    8020280a:	fe043783          	ld	a5,-32(s0)
    8020280e:	f3d5                	bnez	a5,802027b2 <kprintf+0x118>
    80202810:	a299                	j	80202956 <kprintf+0x2bc>
    80202812:	03000513          	li	a0,48
    80202816:	e05ff0ef          	jal	ra,8020261a <kputchar>
    8020281a:	07800513          	li	a0,120
    8020281e:	dfdff0ef          	jal	ra,8020261a <kputchar>
    80202822:	fb843783          	ld	a5,-72(s0)
    80202826:	00878713          	addi	a4,a5,8
    8020282a:	fae43c23          	sd	a4,-72(s0)
    8020282e:	639c                	ld	a5,0(a5)
    80202830:	fcf43423          	sd	a5,-56(s0)
    80202834:	fc843783          	ld	a5,-56(s0)
    80202838:	fef43423          	sd	a5,-24(s0)
    8020283c:	fe043023          	sd	zero,-32(s0)
    80202840:	fe043783          	ld	a5,-32(s0)
    80202844:	0785                	addi	a5,a5,1
    80202846:	fef43023          	sd	a5,-32(s0)
    8020284a:	fe843783          	ld	a5,-24(s0)
    8020284e:	8391                	srli	a5,a5,0x4
    80202850:	fef43423          	sd	a5,-24(s0)
    80202854:	fe843783          	ld	a5,-24(s0)
    80202858:	f7e5                	bnez	a5,80202840 <kprintf+0x1a6>
    8020285a:	fd843703          	ld	a4,-40(s0)
    8020285e:	fe043783          	ld	a5,-32(s0)
    80202862:	97ba                	add	a5,a5,a4
    80202864:	fcf43c23          	sd	a5,-40(s0)
    80202868:	fc843783          	ld	a5,-56(s0)
    8020286c:	fef43423          	sd	a5,-24(s0)
    80202870:	a041                	j	802028f0 <kprintf+0x256>
    80202872:	fe043783          	ld	a5,-32(s0)
    80202876:	17fd                	addi	a5,a5,-1
    80202878:	85be                	mv	a1,a5
    8020287a:	4541                	li	a0,16
    8020287c:	146000ef          	jal	ra,802029c2 <kpow>
    80202880:	872a                	mv	a4,a0
    80202882:	fe843783          	ld	a5,-24(s0)
    80202886:	02e7d7b3          	divu	a5,a5,a4
    8020288a:	fcf42223          	sw	a5,-60(s0)
    8020288e:	fe043783          	ld	a5,-32(s0)
    80202892:	17fd                	addi	a5,a5,-1
    80202894:	85be                	mv	a1,a5
    80202896:	4541                	li	a0,16
    80202898:	12a000ef          	jal	ra,802029c2 <kpow>
    8020289c:	872a                	mv	a4,a0
    8020289e:	fe843783          	ld	a5,-24(s0)
    802028a2:	02e7f7b3          	remu	a5,a5,a4
    802028a6:	fef43423          	sd	a5,-24(s0)
    802028aa:	fc442783          	lw	a5,-60(s0)
    802028ae:	0007871b          	sext.w	a4,a5
    802028b2:	47a5                	li	a5,9
    802028b4:	00e7ce63          	blt	a5,a4,802028d0 <kprintf+0x236>
    802028b8:	fc442783          	lw	a5,-60(s0)
    802028bc:	0ff7f793          	zext.b	a5,a5
    802028c0:	0307879b          	addiw	a5,a5,48
    802028c4:	0ff7f793          	zext.b	a5,a5
    802028c8:	853e                	mv	a0,a5
    802028ca:	d51ff0ef          	jal	ra,8020261a <kputchar>
    802028ce:	a821                	j	802028e6 <kprintf+0x24c>
    802028d0:	fc442783          	lw	a5,-60(s0)
    802028d4:	0ff7f793          	zext.b	a5,a5
    802028d8:	0577879b          	addiw	a5,a5,87
    802028dc:	0ff7f793          	zext.b	a5,a5
    802028e0:	853e                	mv	a0,a5
    802028e2:	d39ff0ef          	jal	ra,8020261a <kputchar>
    802028e6:	fe043783          	ld	a5,-32(s0)
    802028ea:	17fd                	addi	a5,a5,-1
    802028ec:	fef43023          	sd	a5,-32(s0)
    802028f0:	fe043783          	ld	a5,-32(s0)
    802028f4:	ffbd                	bnez	a5,80202872 <kprintf+0x1d8>
    802028f6:	a085                	j	80202956 <kprintf+0x2bc>
    802028f8:	fb843783          	ld	a5,-72(s0)
    802028fc:	00878713          	addi	a4,a5,8
    80202900:	fae43c23          	sd	a4,-72(s0)
    80202904:	639c                	ld	a5,0(a5)
    80202906:	fcf43823          	sd	a5,-48(s0)
    8020290a:	a829                	j	80202924 <kprintf+0x28a>
    8020290c:	fd043783          	ld	a5,-48(s0)
    80202910:	0007c783          	lbu	a5,0(a5)
    80202914:	853e                	mv	a0,a5
    80202916:	d05ff0ef          	jal	ra,8020261a <kputchar>
    8020291a:	fd043783          	ld	a5,-48(s0)
    8020291e:	0785                	addi	a5,a5,1
    80202920:	fcf43823          	sd	a5,-48(s0)
    80202924:	fd043783          	ld	a5,-48(s0)
    80202928:	0007c783          	lbu	a5,0(a5)
    8020292c:	f3e5                	bnez	a5,8020290c <kprintf+0x272>
    8020292e:	a025                	j	80202956 <kprintf+0x2bc>
    80202930:	fb843783          	ld	a5,-72(s0)
    80202934:	00878713          	addi	a4,a5,8
    80202938:	fae43c23          	sd	a4,-72(s0)
    8020293c:	439c                	lw	a5,0(a5)
    8020293e:	0ff7f793          	zext.b	a5,a5
    80202942:	853e                	mv	a0,a5
    80202944:	cd7ff0ef          	jal	ra,8020261a <kputchar>
    80202948:	fd843783          	ld	a5,-40(s0)
    8020294c:	0785                	addi	a5,a5,1
    8020294e:	fcf43c23          	sd	a5,-40(s0)
    80202952:	a011                	j	80202956 <kprintf+0x2bc>
    80202954:	0001                	nop
    80202956:	a099                	j	8020299c <kprintf+0x302>
    80202958:	4529                	li	a0,10
    8020295a:	cc1ff0ef          	jal	ra,8020261a <kputchar>
    8020295e:	fd843783          	ld	a5,-40(s0)
    80202962:	0785                	addi	a5,a5,1
    80202964:	fcf43c23          	sd	a5,-40(s0)
    80202968:	a815                	j	8020299c <kprintf+0x302>
    8020296a:	4535                	li	a0,13
    8020296c:	cafff0ef          	jal	ra,8020261a <kputchar>
    80202970:	fd843783          	ld	a5,-40(s0)
    80202974:	0785                	addi	a5,a5,1
    80202976:	fcf43c23          	sd	a5,-40(s0)
    8020297a:	a00d                	j	8020299c <kprintf+0x302>
    8020297c:	4525                	li	a0,9
    8020297e:	c9dff0ef          	jal	ra,8020261a <kputchar>
    80202982:	fd843783          	ld	a5,-40(s0)
    80202986:	0785                	addi	a5,a5,1
    80202988:	fcf43c23          	sd	a5,-40(s0)
    8020298c:	a801                	j	8020299c <kprintf+0x302>
    8020298e:	fa843783          	ld	a5,-88(s0)
    80202992:	0007c783          	lbu	a5,0(a5)
    80202996:	853e                	mv	a0,a5
    80202998:	c83ff0ef          	jal	ra,8020261a <kputchar>
    8020299c:	fa843783          	ld	a5,-88(s0)
    802029a0:	0785                	addi	a5,a5,1
    802029a2:	faf43423          	sd	a5,-88(s0)
    802029a6:	fa843783          	ld	a5,-88(s0)
    802029aa:	0007c783          	lbu	a5,0(a5)
    802029ae:	d20794e3          	bnez	a5,802026d6 <kprintf+0x3c>
    802029b2:	fd843783          	ld	a5,-40(s0)
    802029b6:	2781                	sext.w	a5,a5
    802029b8:	853e                	mv	a0,a5
    802029ba:	60e6                	ld	ra,88(sp)
    802029bc:	6446                	ld	s0,80(sp)
    802029be:	610d                	addi	sp,sp,160
    802029c0:	8082                	ret

00000000802029c2 <kpow>:
    802029c2:	7179                	addi	sp,sp,-48
    802029c4:	f422                	sd	s0,40(sp)
    802029c6:	1800                	addi	s0,sp,48
    802029c8:	fca43c23          	sd	a0,-40(s0)
    802029cc:	fcb43823          	sd	a1,-48(s0)
    802029d0:	4785                	li	a5,1
    802029d2:	fef43423          	sd	a5,-24(s0)
    802029d6:	a809                	j	802029e8 <kpow+0x26>
    802029d8:	fe843703          	ld	a4,-24(s0)
    802029dc:	fd843783          	ld	a5,-40(s0)
    802029e0:	02f707b3          	mul	a5,a4,a5
    802029e4:	fef43423          	sd	a5,-24(s0)
    802029e8:	fd043783          	ld	a5,-48(s0)
    802029ec:	fff78713          	addi	a4,a5,-1
    802029f0:	fce43823          	sd	a4,-48(s0)
    802029f4:	f3f5                	bnez	a5,802029d8 <kpow+0x16>
    802029f6:	fe843783          	ld	a5,-24(s0)
    802029fa:	853e                	mv	a0,a5
    802029fc:	7422                	ld	s0,40(sp)
    802029fe:	6145                	addi	sp,sp,48
    80202a00:	8082                	ret

0000000080202a02 <sbi_set_timer>:
    80202a02:	1101                	addi	sp,sp,-32
    80202a04:	ec22                	sd	s0,24(sp)
    80202a06:	1000                	addi	s0,sp,32
    80202a08:	fea43423          	sd	a0,-24(s0)
    80202a0c:	fe843503          	ld	a0,-24(s0)
    80202a10:	4801                	li	a6,0
    80202a12:	544957b7          	lui	a5,0x54495
    80202a16:	d4578893          	addi	a7,a5,-699 # 54494d45 <XLENB+0x54494d3d>
    80202a1a:	00000073          	ecall
    80202a1e:	0001                	nop
    80202a20:	6462                	ld	s0,24(sp)
    80202a22:	6105                	addi	sp,sp,32
    80202a24:	8082                	ret

0000000080202a26 <sbi_console_putchar>:
    80202a26:	1101                	addi	sp,sp,-32
    80202a28:	ec22                	sd	s0,24(sp)
    80202a2a:	1000                	addi	s0,sp,32
    80202a2c:	87aa                	mv	a5,a0
    80202a2e:	fef407a3          	sb	a5,-17(s0)
    80202a32:	fef44783          	lbu	a5,-17(s0)
    80202a36:	853e                	mv	a0,a5
    80202a38:	4801                	li	a6,0
    80202a3a:	4885                	li	a7,1
    80202a3c:	00000073          	ecall
    80202a40:	0001                	nop
    80202a42:	6462                	ld	s0,24(sp)
    80202a44:	6105                	addi	sp,sp,32
    80202a46:	8082                	ret

0000000080202a48 <sbi_console_getchar>:
    80202a48:	1141                	addi	sp,sp,-16
    80202a4a:	e422                	sd	s0,8(sp)
    80202a4c:	0800                	addi	s0,sp,16
    80202a4e:	4801                	li	a6,0
    80202a50:	4889                	li	a7,2
    80202a52:	00000073          	ecall
    80202a56:	87aa                	mv	a5,a0
    80202a58:	0ff7f793          	zext.b	a5,a5
    80202a5c:	853e                	mv	a0,a5
    80202a5e:	6422                	ld	s0,8(sp)
    80202a60:	0141                	addi	sp,sp,16
    80202a62:	8082                	ret

0000000080202a64 <sbi_get_spec_version>:
    80202a64:	7179                	addi	sp,sp,-48
    80202a66:	f422                	sd	s0,40(sp)
    80202a68:	1800                	addi	s0,sp,48
    80202a6a:	48c1                	li	a7,16
    80202a6c:	4801                	li	a6,0
    80202a6e:	00000073          	ecall
    80202a72:	87aa                	mv	a5,a0
    80202a74:	873e                	mv	a4,a5
    80202a76:	87ae                	mv	a5,a1
    80202a78:	fee43023          	sd	a4,-32(s0)
    80202a7c:	fef43423          	sd	a5,-24(s0)
    80202a80:	fe043703          	ld	a4,-32(s0)
    80202a84:	fe843783          	ld	a5,-24(s0)
    80202a88:	863a                	mv	a2,a4
    80202a8a:	86be                	mv	a3,a5
    80202a8c:	8732                	mv	a4,a2
    80202a8e:	87b6                	mv	a5,a3
    80202a90:	853a                	mv	a0,a4
    80202a92:	85be                	mv	a1,a5
    80202a94:	7422                	ld	s0,40(sp)
    80202a96:	6145                	addi	sp,sp,48
    80202a98:	8082                	ret

0000000080202a9a <sbi_get_impl_id>:
    80202a9a:	7179                	addi	sp,sp,-48
    80202a9c:	f422                	sd	s0,40(sp)
    80202a9e:	1800                	addi	s0,sp,48
    80202aa0:	48c1                	li	a7,16
    80202aa2:	4805                	li	a6,1
    80202aa4:	00000073          	ecall
    80202aa8:	87aa                	mv	a5,a0
    80202aaa:	873e                	mv	a4,a5
    80202aac:	87ae                	mv	a5,a1
    80202aae:	fee43023          	sd	a4,-32(s0)
    80202ab2:	fef43423          	sd	a5,-24(s0)
    80202ab6:	fe043703          	ld	a4,-32(s0)
    80202aba:	fe843783          	ld	a5,-24(s0)
    80202abe:	863a                	mv	a2,a4
    80202ac0:	86be                	mv	a3,a5
    80202ac2:	8732                	mv	a4,a2
    80202ac4:	87b6                	mv	a5,a3
    80202ac6:	853a                	mv	a0,a4
    80202ac8:	85be                	mv	a1,a5
    80202aca:	7422                	ld	s0,40(sp)
    80202acc:	6145                	addi	sp,sp,48
    80202ace:	8082                	ret

0000000080202ad0 <sbi_get_impl_version>:
    80202ad0:	7179                	addi	sp,sp,-48
    80202ad2:	f422                	sd	s0,40(sp)
    80202ad4:	1800                	addi	s0,sp,48
    80202ad6:	48c1                	li	a7,16
    80202ad8:	4809                	li	a6,2
    80202ada:	00000073          	ecall
    80202ade:	87aa                	mv	a5,a0
    80202ae0:	873e                	mv	a4,a5
    80202ae2:	87ae                	mv	a5,a1
    80202ae4:	fee43023          	sd	a4,-32(s0)
    80202ae8:	fef43423          	sd	a5,-24(s0)
    80202aec:	fe043703          	ld	a4,-32(s0)
    80202af0:	fe843783          	ld	a5,-24(s0)
    80202af4:	863a                	mv	a2,a4
    80202af6:	86be                	mv	a3,a5
    80202af8:	8732                	mv	a4,a2
    80202afa:	87b6                	mv	a5,a3
    80202afc:	853a                	mv	a0,a4
    80202afe:	85be                	mv	a1,a5
    80202b00:	7422                	ld	s0,40(sp)
    80202b02:	6145                	addi	sp,sp,48
    80202b04:	8082                	ret

0000000080202b06 <sbi_probe_extension>:
    80202b06:	7139                	addi	sp,sp,-64
    80202b08:	fc22                	sd	s0,56(sp)
    80202b0a:	0080                	addi	s0,sp,64
    80202b0c:	fca43423          	sd	a0,-56(s0)
    80202b10:	48c1                	li	a7,16
    80202b12:	480d                	li	a6,3
    80202b14:	fc843783          	ld	a5,-56(s0)
    80202b18:	853e                	mv	a0,a5
    80202b1a:	00000073          	ecall
    80202b1e:	87aa                	mv	a5,a0
    80202b20:	873e                	mv	a4,a5
    80202b22:	87ae                	mv	a5,a1
    80202b24:	fee43023          	sd	a4,-32(s0)
    80202b28:	fef43423          	sd	a5,-24(s0)
    80202b2c:	fe043703          	ld	a4,-32(s0)
    80202b30:	fe843783          	ld	a5,-24(s0)
    80202b34:	863a                	mv	a2,a4
    80202b36:	86be                	mv	a3,a5
    80202b38:	8732                	mv	a4,a2
    80202b3a:	87b6                	mv	a5,a3
    80202b3c:	853a                	mv	a0,a4
    80202b3e:	85be                	mv	a1,a5
    80202b40:	7462                	ld	s0,56(sp)
    80202b42:	6121                	addi	sp,sp,64
    80202b44:	8082                	ret

0000000080202b46 <sbi_shutdown>:
    80202b46:	1141                	addi	sp,sp,-16
    80202b48:	e422                	sd	s0,8(sp)
    80202b4a:	0800                	addi	s0,sp,16
    80202b4c:	4501                	li	a0,0
    80202b4e:	4581                	li	a1,0
    80202b50:	535257b7          	lui	a5,0x53525
    80202b54:	35478893          	addi	a7,a5,852 # 53525354 <XLENB+0x5352534c>
    80202b58:	4801                	li	a6,0
    80202b5a:	00000073          	ecall
    80202b5e:	0001                	nop
    80202b60:	6422                	ld	s0,8(sp)
    80202b62:	0141                	addi	sp,sp,16
    80202b64:	8082                	ret

0000000080202b66 <sbi_reboot>:
    80202b66:	1141                	addi	sp,sp,-16
    80202b68:	e422                	sd	s0,8(sp)
    80202b6a:	0800                	addi	s0,sp,16
    80202b6c:	4505                	li	a0,1
    80202b6e:	4581                	li	a1,0
    80202b70:	535257b7          	lui	a5,0x53525
    80202b74:	35478893          	addi	a7,a5,852 # 53525354 <XLENB+0x5352534c>
    80202b78:	4801                	li	a6,0
    80202b7a:	00000073          	ecall
    80202b7e:	0001                	nop
    80202b80:	6422                	ld	s0,8(sp)
    80202b82:	0141                	addi	sp,sp,16
    80202b84:	8082                	ret

0000000080202b86 <print_system_infomation>:
    80202b86:	1101                	addi	sp,sp,-32
    80202b88:	ec06                	sd	ra,24(sp)
    80202b8a:	e822                	sd	s0,16(sp)
    80202b8c:	1000                	addi	s0,sp,32
    80202b8e:	544957b7          	lui	a5,0x54495
    80202b92:	d4578513          	addi	a0,a5,-699 # 54494d45 <XLENB+0x54494d3d>
    80202b96:	f71ff0ef          	jal	ra,80202b06 <sbi_probe_extension>
    80202b9a:	872a                	mv	a4,a0
    80202b9c:	87ae                	mv	a5,a1
    80202b9e:	fee43023          	sd	a4,-32(s0)
    80202ba2:	fef43423          	sd	a5,-24(s0)
    80202ba6:	fe843783          	ld	a5,-24(s0)
    80202baa:	cb81                	beqz	a5,80202bba <print_system_infomation+0x34>
    80202bac:	00001517          	auipc	a0,0x1
    80202bb0:	fe450513          	addi	a0,a0,-28 # 80203b90 <rodata_start+0xb90>
    80202bb4:	a89ff0ef          	jal	ra,8020263c <kputs>
    80202bb8:	a039                	j	80202bc6 <print_system_infomation+0x40>
    80202bba:	00001517          	auipc	a0,0x1
    80202bbe:	ff650513          	addi	a0,a0,-10 # 80203bb0 <rodata_start+0xbb0>
    80202bc2:	a7bff0ef          	jal	ra,8020263c <kputs>
    80202bc6:	004857b7          	lui	a5,0x485
    80202bca:	34d78513          	addi	a0,a5,845 # 48534d <XLENB+0x485345>
    80202bce:	f39ff0ef          	jal	ra,80202b06 <sbi_probe_extension>
    80202bd2:	872a                	mv	a4,a0
    80202bd4:	87ae                	mv	a5,a1
    80202bd6:	fee43023          	sd	a4,-32(s0)
    80202bda:	fef43423          	sd	a5,-24(s0)
    80202bde:	fe843783          	ld	a5,-24(s0)
    80202be2:	cb81                	beqz	a5,80202bf2 <print_system_infomation+0x6c>
    80202be4:	00001517          	auipc	a0,0x1
    80202be8:	fec50513          	addi	a0,a0,-20 # 80203bd0 <rodata_start+0xbd0>
    80202bec:	a51ff0ef          	jal	ra,8020263c <kputs>
    80202bf0:	a039                	j	80202bfe <print_system_infomation+0x78>
    80202bf2:	00001517          	auipc	a0,0x1
    80202bf6:	ffe50513          	addi	a0,a0,-2 # 80203bf0 <rodata_start+0xbf0>
    80202bfa:	a43ff0ef          	jal	ra,8020263c <kputs>
    80202bfe:	535257b7          	lui	a5,0x53525
    80202c02:	35478513          	addi	a0,a5,852 # 53525354 <XLENB+0x5352534c>
    80202c06:	f01ff0ef          	jal	ra,80202b06 <sbi_probe_extension>
    80202c0a:	872a                	mv	a4,a0
    80202c0c:	87ae                	mv	a5,a1
    80202c0e:	fee43023          	sd	a4,-32(s0)
    80202c12:	fef43423          	sd	a5,-24(s0)
    80202c16:	fe843783          	ld	a5,-24(s0)
    80202c1a:	cb81                	beqz	a5,80202c2a <print_system_infomation+0xa4>
    80202c1c:	00001517          	auipc	a0,0x1
    80202c20:	ffc50513          	addi	a0,a0,-4 # 80203c18 <rodata_start+0xc18>
    80202c24:	a19ff0ef          	jal	ra,8020263c <kputs>
    80202c28:	a039                	j	80202c36 <print_system_infomation+0xb0>
    80202c2a:	00001517          	auipc	a0,0x1
    80202c2e:	00e50513          	addi	a0,a0,14 # 80203c38 <rodata_start+0xc38>
    80202c32:	a0bff0ef          	jal	ra,8020263c <kputs>
    80202c36:	e65ff0ef          	jal	ra,80202a9a <sbi_get_impl_id>
    80202c3a:	872a                	mv	a4,a0
    80202c3c:	87ae                	mv	a5,a1
    80202c3e:	fee43023          	sd	a4,-32(s0)
    80202c42:	fef43423          	sd	a5,-24(s0)
    80202c46:	fe843783          	ld	a5,-24(s0)
    80202c4a:	4715                	li	a4,5
    80202c4c:	06f76c63          	bltu	a4,a5,80202cc4 <print_system_infomation+0x13e>
    80202c50:	00279713          	slli	a4,a5,0x2
    80202c54:	00001797          	auipc	a5,0x1
    80202c58:	0d078793          	addi	a5,a5,208 # 80203d24 <rodata_start+0xd24>
    80202c5c:	97ba                	add	a5,a5,a4
    80202c5e:	439c                	lw	a5,0(a5)
    80202c60:	0007871b          	sext.w	a4,a5
    80202c64:	00001797          	auipc	a5,0x1
    80202c68:	0c078793          	addi	a5,a5,192 # 80203d24 <rodata_start+0xd24>
    80202c6c:	97ba                	add	a5,a5,a4
    80202c6e:	8782                	jr	a5
    80202c70:	00001517          	auipc	a0,0x1
    80202c74:	fe850513          	addi	a0,a0,-24 # 80203c58 <rodata_start+0xc58>
    80202c78:	9c5ff0ef          	jal	ra,8020263c <kputs>
    80202c7c:	a899                	j	80202cd2 <print_system_infomation+0x14c>
    80202c7e:	00001517          	auipc	a0,0x1
    80202c82:	00250513          	addi	a0,a0,2 # 80203c80 <rodata_start+0xc80>
    80202c86:	9b7ff0ef          	jal	ra,8020263c <kputs>
    80202c8a:	a0a1                	j	80202cd2 <print_system_infomation+0x14c>
    80202c8c:	00001517          	auipc	a0,0x1
    80202c90:	01450513          	addi	a0,a0,20 # 80203ca0 <rodata_start+0xca0>
    80202c94:	9a9ff0ef          	jal	ra,8020263c <kputs>
    80202c98:	a82d                	j	80202cd2 <print_system_infomation+0x14c>
    80202c9a:	00001517          	auipc	a0,0x1
    80202c9e:	01e50513          	addi	a0,a0,30 # 80203cb8 <rodata_start+0xcb8>
    80202ca2:	99bff0ef          	jal	ra,8020263c <kputs>
    80202ca6:	a035                	j	80202cd2 <print_system_infomation+0x14c>
    80202ca8:	00001517          	auipc	a0,0x1
    80202cac:	02850513          	addi	a0,a0,40 # 80203cd0 <rodata_start+0xcd0>
    80202cb0:	98dff0ef          	jal	ra,8020263c <kputs>
    80202cb4:	a839                	j	80202cd2 <print_system_infomation+0x14c>
    80202cb6:	00001517          	auipc	a0,0x1
    80202cba:	03a50513          	addi	a0,a0,58 # 80203cf0 <rodata_start+0xcf0>
    80202cbe:	97fff0ef          	jal	ra,8020263c <kputs>
    80202cc2:	a801                	j	80202cd2 <print_system_infomation+0x14c>
    80202cc4:	00001517          	auipc	a0,0x1
    80202cc8:	04450513          	addi	a0,a0,68 # 80203d08 <rodata_start+0xd08>
    80202ccc:	971ff0ef          	jal	ra,8020263c <kputs>
    80202cd0:	0001                	nop
    80202cd2:	0001                	nop
    80202cd4:	60e2                	ld	ra,24(sp)
    80202cd6:	6442                	ld	s0,16(sp)
    80202cd8:	6105                	addi	sp,sp,32
    80202cda:	8082                	ret

0000000080202cdc <strlen>:
    80202cdc:	7179                	addi	sp,sp,-48
    80202cde:	f422                	sd	s0,40(sp)
    80202ce0:	1800                	addi	s0,sp,48
    80202ce2:	fca43c23          	sd	a0,-40(s0)
    80202ce6:	fe043423          	sd	zero,-24(s0)
    80202cea:	a031                	j	80202cf6 <strlen+0x1a>
    80202cec:	fe843783          	ld	a5,-24(s0)
    80202cf0:	0785                	addi	a5,a5,1
    80202cf2:	fef43423          	sd	a5,-24(s0)
    80202cf6:	fd843703          	ld	a4,-40(s0)
    80202cfa:	fe843783          	ld	a5,-24(s0)
    80202cfe:	97ba                	add	a5,a5,a4
    80202d00:	0007c783          	lbu	a5,0(a5)
    80202d04:	f7e5                	bnez	a5,80202cec <strlen+0x10>
    80202d06:	fe843783          	ld	a5,-24(s0)
    80202d0a:	853e                	mv	a0,a5
    80202d0c:	7422                	ld	s0,40(sp)
    80202d0e:	6145                	addi	sp,sp,48
    80202d10:	8082                	ret

0000000080202d12 <strcmp>:
    80202d12:	1101                	addi	sp,sp,-32
    80202d14:	ec22                	sd	s0,24(sp)
    80202d16:	1000                	addi	s0,sp,32
    80202d18:	fea43423          	sd	a0,-24(s0)
    80202d1c:	feb43023          	sd	a1,-32(s0)
    80202d20:	a819                	j	80202d36 <strcmp+0x24>
    80202d22:	fe843783          	ld	a5,-24(s0)
    80202d26:	0785                	addi	a5,a5,1
    80202d28:	fef43423          	sd	a5,-24(s0)
    80202d2c:	fe043783          	ld	a5,-32(s0)
    80202d30:	0785                	addi	a5,a5,1
    80202d32:	fef43023          	sd	a5,-32(s0)
    80202d36:	fe843783          	ld	a5,-24(s0)
    80202d3a:	0007c783          	lbu	a5,0(a5)
    80202d3e:	c385                	beqz	a5,80202d5e <strcmp+0x4c>
    80202d40:	fe043783          	ld	a5,-32(s0)
    80202d44:	0007c783          	lbu	a5,0(a5)
    80202d48:	cb99                	beqz	a5,80202d5e <strcmp+0x4c>
    80202d4a:	fe843783          	ld	a5,-24(s0)
    80202d4e:	0007c703          	lbu	a4,0(a5)
    80202d52:	fe043783          	ld	a5,-32(s0)
    80202d56:	0007c783          	lbu	a5,0(a5)
    80202d5a:	fcf704e3          	beq	a4,a5,80202d22 <strcmp+0x10>
    80202d5e:	fe843783          	ld	a5,-24(s0)
    80202d62:	0007c783          	lbu	a5,0(a5)
    80202d66:	0007871b          	sext.w	a4,a5
    80202d6a:	fe043783          	ld	a5,-32(s0)
    80202d6e:	0007c783          	lbu	a5,0(a5)
    80202d72:	2781                	sext.w	a5,a5
    80202d74:	40f707bb          	subw	a5,a4,a5
    80202d78:	2781                	sext.w	a5,a5
    80202d7a:	853e                	mv	a0,a5
    80202d7c:	6462                	ld	s0,24(sp)
    80202d7e:	6105                	addi	sp,sp,32
    80202d80:	8082                	ret

0000000080202d82 <is_begin_with>:
    80202d82:	7179                	addi	sp,sp,-48
    80202d84:	f422                	sd	s0,40(sp)
    80202d86:	1800                	addi	s0,sp,48
    80202d88:	fca43c23          	sd	a0,-40(s0)
    80202d8c:	fcb43823          	sd	a1,-48(s0)
    80202d90:	fd843783          	ld	a5,-40(s0)
    80202d94:	c781                	beqz	a5,80202d9c <is_begin_with+0x1a>
    80202d96:	fd043783          	ld	a5,-48(s0)
    80202d9a:	e399                	bnez	a5,80202da0 <is_begin_with+0x1e>
    80202d9c:	4781                	li	a5,0
    80202d9e:	a881                	j	80202dee <is_begin_with+0x6c>
    80202da0:	fd043783          	ld	a5,-48(s0)
    80202da4:	fef43423          	sd	a5,-24(s0)
    80202da8:	fe042223          	sw	zero,-28(s0)
    80202dac:	a81d                	j	80202de2 <is_begin_with+0x60>
    80202dae:	fe843783          	ld	a5,-24(s0)
    80202db2:	0007c683          	lbu	a3,0(a5)
    80202db6:	fe442783          	lw	a5,-28(s0)
    80202dba:	fd843703          	ld	a4,-40(s0)
    80202dbe:	97ba                	add	a5,a5,a4
    80202dc0:	0007c783          	lbu	a5,0(a5)
    80202dc4:	8736                	mv	a4,a3
    80202dc6:	00f70463          	beq	a4,a5,80202dce <is_begin_with+0x4c>
    80202dca:	4781                	li	a5,0
    80202dcc:	a00d                	j	80202dee <is_begin_with+0x6c>
    80202dce:	fe843783          	ld	a5,-24(s0)
    80202dd2:	0785                	addi	a5,a5,1
    80202dd4:	fef43423          	sd	a5,-24(s0)
    80202dd8:	fe442783          	lw	a5,-28(s0)
    80202ddc:	2785                	addiw	a5,a5,1
    80202dde:	fef42223          	sw	a5,-28(s0)
    80202de2:	fe843783          	ld	a5,-24(s0)
    80202de6:	0007c783          	lbu	a5,0(a5)
    80202dea:	f3f1                	bnez	a5,80202dae <is_begin_with+0x2c>
    80202dec:	4785                	li	a5,1
    80202dee:	853e                	mv	a0,a5
    80202df0:	7422                	ld	s0,40(sp)
    80202df2:	6145                	addi	sp,sp,48
    80202df4:	8082                	ret
