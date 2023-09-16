
kernel.bin:     file format elf64-littleriscv


Disassembly of section .text:

0000000080200000 <_start>:
    80200000:	00012117          	auipc	sp,0x12
    80200004:	00010113          	mv	sp,sp
    80200008:	004000ef          	jal	ra,8020000c <main>

000000008020000c <main>:
    8020000c:	1101                	addi	sp,sp,-32 # 80211fe0 <boot_stack+0xffe0>
    8020000e:	ec06                	sd	ra,24(sp)
    80200010:	e822                	sd	s0,16(sp)
    80200012:	1000                	addi	s0,sp,32
    80200014:	00001517          	auipc	a0,0x1
    80200018:	fec50513          	addi	a0,a0,-20 # 80201000 <rodata_start>
    8020001c:	176000ef          	jal	ra,80200192 <kputs>
    80200020:	544957b7          	lui	a5,0x54495
    80200024:	d4578513          	addi	a0,a5,-699 # 54494d45 <_start-0x2bd6b2bb>
    80200028:	302000ef          	jal	ra,8020032a <sbi_probe_extension>
    8020002c:	872a                	mv	a4,a0
    8020002e:	87ae                	mv	a5,a1
    80200030:	fee43023          	sd	a4,-32(s0)
    80200034:	fef43423          	sd	a5,-24(s0)
    80200038:	fe843783          	ld	a5,-24(s0)
    8020003c:	cb81                	beqz	a5,8020004c <main+0x40>
    8020003e:	00001517          	auipc	a0,0x1
    80200042:	fea50513          	addi	a0,a0,-22 # 80201028 <rodata_start+0x28>
    80200046:	14c000ef          	jal	ra,80200192 <kputs>
    8020004a:	a039                	j	80200058 <main+0x4c>
    8020004c:	00001517          	auipc	a0,0x1
    80200050:	ffc50513          	addi	a0,a0,-4 # 80201048 <rodata_start+0x48>
    80200054:	13e000ef          	jal	ra,80200192 <kputs>
    80200058:	004857b7          	lui	a5,0x485
    8020005c:	34d78513          	addi	a0,a5,845 # 48534d <_start-0x7fd7acb3>
    80200060:	2ca000ef          	jal	ra,8020032a <sbi_probe_extension>
    80200064:	872a                	mv	a4,a0
    80200066:	87ae                	mv	a5,a1
    80200068:	fee43023          	sd	a4,-32(s0)
    8020006c:	fef43423          	sd	a5,-24(s0)
    80200070:	fe843783          	ld	a5,-24(s0)
    80200074:	cb81                	beqz	a5,80200084 <main+0x78>
    80200076:	00001517          	auipc	a0,0x1
    8020007a:	ff250513          	addi	a0,a0,-14 # 80201068 <rodata_start+0x68>
    8020007e:	114000ef          	jal	ra,80200192 <kputs>
    80200082:	a039                	j	80200090 <main+0x84>
    80200084:	00001517          	auipc	a0,0x1
    80200088:	00450513          	addi	a0,a0,4 # 80201088 <rodata_start+0x88>
    8020008c:	106000ef          	jal	ra,80200192 <kputs>
    80200090:	535257b7          	lui	a5,0x53525
    80200094:	35478513          	addi	a0,a5,852 # 53525354 <_start-0x2ccdacac>
    80200098:	292000ef          	jal	ra,8020032a <sbi_probe_extension>
    8020009c:	872a                	mv	a4,a0
    8020009e:	87ae                	mv	a5,a1
    802000a0:	fee43023          	sd	a4,-32(s0)
    802000a4:	fef43423          	sd	a5,-24(s0)
    802000a8:	fe843783          	ld	a5,-24(s0)
    802000ac:	cb81                	beqz	a5,802000bc <main+0xb0>
    802000ae:	00001517          	auipc	a0,0x1
    802000b2:	00250513          	addi	a0,a0,2 # 802010b0 <rodata_start+0xb0>
    802000b6:	0dc000ef          	jal	ra,80200192 <kputs>
    802000ba:	a039                	j	802000c8 <main+0xbc>
    802000bc:	00001517          	auipc	a0,0x1
    802000c0:	01450513          	addi	a0,a0,20 # 802010d0 <rodata_start+0xd0>
    802000c4:	0ce000ef          	jal	ra,80200192 <kputs>
    802000c8:	1c0000ef          	jal	ra,80200288 <sbi_get_impl_id>
    802000cc:	872a                	mv	a4,a0
    802000ce:	87ae                	mv	a5,a1
    802000d0:	fee43023          	sd	a4,-32(s0)
    802000d4:	fef43423          	sd	a5,-24(s0)
    802000d8:	fe843783          	ld	a5,-24(s0)
    802000dc:	4715                	li	a4,5
    802000de:	06f76c63          	bltu	a4,a5,80200156 <main+0x14a>
    802000e2:	00279713          	slli	a4,a5,0x2
    802000e6:	00001797          	auipc	a5,0x1
    802000ea:	0ea78793          	addi	a5,a5,234 # 802011d0 <rodata_start+0x1d0>
    802000ee:	97ba                	add	a5,a5,a4
    802000f0:	439c                	lw	a5,0(a5)
    802000f2:	0007871b          	sext.w	a4,a5
    802000f6:	00001797          	auipc	a5,0x1
    802000fa:	0da78793          	addi	a5,a5,218 # 802011d0 <rodata_start+0x1d0>
    802000fe:	97ba                	add	a5,a5,a4
    80200100:	8782                	jr	a5
    80200102:	00001517          	auipc	a0,0x1
    80200106:	fee50513          	addi	a0,a0,-18 # 802010f0 <rodata_start+0xf0>
    8020010a:	088000ef          	jal	ra,80200192 <kputs>
    8020010e:	a891                	j	80200162 <main+0x156>
    80200110:	00001517          	auipc	a0,0x1
    80200114:	00850513          	addi	a0,a0,8 # 80201118 <rodata_start+0x118>
    80200118:	07a000ef          	jal	ra,80200192 <kputs>
    8020011c:	a099                	j	80200162 <main+0x156>
    8020011e:	00001517          	auipc	a0,0x1
    80200122:	01a50513          	addi	a0,a0,26 # 80201138 <rodata_start+0x138>
    80200126:	06c000ef          	jal	ra,80200192 <kputs>
    8020012a:	a825                	j	80200162 <main+0x156>
    8020012c:	00001517          	auipc	a0,0x1
    80200130:	02450513          	addi	a0,a0,36 # 80201150 <rodata_start+0x150>
    80200134:	05e000ef          	jal	ra,80200192 <kputs>
    80200138:	a02d                	j	80200162 <main+0x156>
    8020013a:	00001517          	auipc	a0,0x1
    8020013e:	02e50513          	addi	a0,a0,46 # 80201168 <rodata_start+0x168>
    80200142:	050000ef          	jal	ra,80200192 <kputs>
    80200146:	a831                	j	80200162 <main+0x156>
    80200148:	00001517          	auipc	a0,0x1
    8020014c:	04050513          	addi	a0,a0,64 # 80201188 <rodata_start+0x188>
    80200150:	042000ef          	jal	ra,80200192 <kputs>
    80200154:	a039                	j	80200162 <main+0x156>
    80200156:	00001517          	auipc	a0,0x1
    8020015a:	04a50513          	addi	a0,a0,74 # 802011a0 <rodata_start+0x1a0>
    8020015e:	034000ef          	jal	ra,80200192 <kputs>
    80200162:	00001517          	auipc	a0,0x1
    80200166:	05e50513          	addi	a0,a0,94 # 802011c0 <rodata_start+0x1c0>
    8020016a:	028000ef          	jal	ra,80200192 <kputs>
    8020016e:	a001                	j	8020016e <main+0x162>

0000000080200170 <kputchar>:
    80200170:	1101                	addi	sp,sp,-32
    80200172:	ec06                	sd	ra,24(sp)
    80200174:	e822                	sd	s0,16(sp)
    80200176:	1000                	addi	s0,sp,32
    80200178:	87aa                	mv	a5,a0
    8020017a:	fef407a3          	sb	a5,-17(s0)
    8020017e:	fef44783          	lbu	a5,-17(s0)
    80200182:	853e                	mv	a0,a5
    80200184:	090000ef          	jal	ra,80200214 <sbi_console_putchar>
    80200188:	0001                	nop
    8020018a:	60e2                	ld	ra,24(sp)
    8020018c:	6442                	ld	s0,16(sp)
    8020018e:	6105                	addi	sp,sp,32
    80200190:	8082                	ret

0000000080200192 <kputs>:
    80200192:	7179                	addi	sp,sp,-48
    80200194:	f406                	sd	ra,40(sp)
    80200196:	f022                	sd	s0,32(sp)
    80200198:	1800                	addi	s0,sp,48
    8020019a:	fca43c23          	sd	a0,-40(s0)
    8020019e:	fd843783          	ld	a5,-40(s0)
    802001a2:	fef43423          	sd	a5,-24(s0)
    802001a6:	a829                	j	802001c0 <kputs+0x2e>
    802001a8:	fd843783          	ld	a5,-40(s0)
    802001ac:	0007c783          	lbu	a5,0(a5)
    802001b0:	853e                	mv	a0,a5
    802001b2:	fbfff0ef          	jal	ra,80200170 <kputchar>
    802001b6:	fd843783          	ld	a5,-40(s0)
    802001ba:	0785                	addi	a5,a5,1
    802001bc:	fcf43c23          	sd	a5,-40(s0)
    802001c0:	fd843783          	ld	a5,-40(s0)
    802001c4:	0007c783          	lbu	a5,0(a5)
    802001c8:	f3e5                	bnez	a5,802001a8 <kputs+0x16>
    802001ca:	4529                	li	a0,10
    802001cc:	fa5ff0ef          	jal	ra,80200170 <kputchar>
    802001d0:	fe843703          	ld	a4,-24(s0)
    802001d4:	fd843783          	ld	a5,-40(s0)
    802001d8:	40f707b3          	sub	a5,a4,a5
    802001dc:	0017b793          	seqz	a5,a5
    802001e0:	0ff7f793          	zext.b	a5,a5
    802001e4:	2781                	sext.w	a5,a5
    802001e6:	853e                	mv	a0,a5
    802001e8:	70a2                	ld	ra,40(sp)
    802001ea:	7402                	ld	s0,32(sp)
    802001ec:	6145                	addi	sp,sp,48
    802001ee:	8082                	ret

00000000802001f0 <sbi_set_timer>:
    802001f0:	1101                	addi	sp,sp,-32
    802001f2:	ec22                	sd	s0,24(sp)
    802001f4:	1000                	addi	s0,sp,32
    802001f6:	fea43423          	sd	a0,-24(s0)
    802001fa:	fe843503          	ld	a0,-24(s0)
    802001fe:	4801                	li	a6,0
    80200200:	544957b7          	lui	a5,0x54495
    80200204:	d4578893          	addi	a7,a5,-699 # 54494d45 <_start-0x2bd6b2bb>
    80200208:	00000073          	ecall
    8020020c:	0001                	nop
    8020020e:	6462                	ld	s0,24(sp)
    80200210:	6105                	addi	sp,sp,32
    80200212:	8082                	ret

0000000080200214 <sbi_console_putchar>:
    80200214:	1101                	addi	sp,sp,-32
    80200216:	ec22                	sd	s0,24(sp)
    80200218:	1000                	addi	s0,sp,32
    8020021a:	87aa                	mv	a5,a0
    8020021c:	fef407a3          	sb	a5,-17(s0)
    80200220:	fef44783          	lbu	a5,-17(s0)
    80200224:	853e                	mv	a0,a5
    80200226:	4801                	li	a6,0
    80200228:	4885                	li	a7,1
    8020022a:	00000073          	ecall
    8020022e:	0001                	nop
    80200230:	6462                	ld	s0,24(sp)
    80200232:	6105                	addi	sp,sp,32
    80200234:	8082                	ret

0000000080200236 <sbi_console_getchar>:
    80200236:	1141                	addi	sp,sp,-16
    80200238:	e422                	sd	s0,8(sp)
    8020023a:	0800                	addi	s0,sp,16
    8020023c:	4801                	li	a6,0
    8020023e:	4889                	li	a7,2
    80200240:	00000073          	ecall
    80200244:	87aa                	mv	a5,a0
    80200246:	0ff7f793          	zext.b	a5,a5
    8020024a:	853e                	mv	a0,a5
    8020024c:	6422                	ld	s0,8(sp)
    8020024e:	0141                	addi	sp,sp,16
    80200250:	8082                	ret

0000000080200252 <sbi_get_spec_version>:
    80200252:	7179                	addi	sp,sp,-48
    80200254:	f422                	sd	s0,40(sp)
    80200256:	1800                	addi	s0,sp,48
    80200258:	48c1                	li	a7,16
    8020025a:	4801                	li	a6,0
    8020025c:	00000073          	ecall
    80200260:	87aa                	mv	a5,a0
    80200262:	873e                	mv	a4,a5
    80200264:	87ae                	mv	a5,a1
    80200266:	fee43023          	sd	a4,-32(s0)
    8020026a:	fef43423          	sd	a5,-24(s0)
    8020026e:	fe043703          	ld	a4,-32(s0)
    80200272:	fe843783          	ld	a5,-24(s0)
    80200276:	863a                	mv	a2,a4
    80200278:	86be                	mv	a3,a5
    8020027a:	8732                	mv	a4,a2
    8020027c:	87b6                	mv	a5,a3
    8020027e:	853a                	mv	a0,a4
    80200280:	85be                	mv	a1,a5
    80200282:	7422                	ld	s0,40(sp)
    80200284:	6145                	addi	sp,sp,48
    80200286:	8082                	ret

0000000080200288 <sbi_get_impl_id>:
    80200288:	7179                	addi	sp,sp,-48
    8020028a:	f422                	sd	s0,40(sp)
    8020028c:	1800                	addi	s0,sp,48
    8020028e:	48c1                	li	a7,16
    80200290:	4805                	li	a6,1
    80200292:	00000073          	ecall
    80200296:	87aa                	mv	a5,a0
    80200298:	873e                	mv	a4,a5
    8020029a:	87ae                	mv	a5,a1
    8020029c:	fee43023          	sd	a4,-32(s0)
    802002a0:	fef43423          	sd	a5,-24(s0)
    802002a4:	fe043703          	ld	a4,-32(s0)
    802002a8:	fe843783          	ld	a5,-24(s0)
    802002ac:	863a                	mv	a2,a4
    802002ae:	86be                	mv	a3,a5
    802002b0:	8732                	mv	a4,a2
    802002b2:	87b6                	mv	a5,a3
    802002b4:	853a                	mv	a0,a4
    802002b6:	85be                	mv	a1,a5
    802002b8:	7422                	ld	s0,40(sp)
    802002ba:	6145                	addi	sp,sp,48
    802002bc:	8082                	ret

00000000802002be <sbi_get_impl_version>:
    802002be:	7179                	addi	sp,sp,-48
    802002c0:	f422                	sd	s0,40(sp)
    802002c2:	1800                	addi	s0,sp,48
    802002c4:	48c1                	li	a7,16
    802002c6:	4809                	li	a6,2
    802002c8:	00000073          	ecall
    802002cc:	87aa                	mv	a5,a0
    802002ce:	873e                	mv	a4,a5
    802002d0:	87ae                	mv	a5,a1
    802002d2:	fee43023          	sd	a4,-32(s0)
    802002d6:	fef43423          	sd	a5,-24(s0)
    802002da:	fe043703          	ld	a4,-32(s0)
    802002de:	fe843783          	ld	a5,-24(s0)
    802002e2:	863a                	mv	a2,a4
    802002e4:	86be                	mv	a3,a5
    802002e6:	8732                	mv	a4,a2
    802002e8:	87b6                	mv	a5,a3
    802002ea:	853a                	mv	a0,a4
    802002ec:	85be                	mv	a1,a5
    802002ee:	7422                	ld	s0,40(sp)
    802002f0:	6145                	addi	sp,sp,48
    802002f2:	8082                	ret

00000000802002f4 <sbi_get_mvendorid>:
    802002f4:	7179                	addi	sp,sp,-48
    802002f6:	f422                	sd	s0,40(sp)
    802002f8:	1800                	addi	s0,sp,48
    802002fa:	48c1                	li	a7,16
    802002fc:	4811                	li	a6,4
    802002fe:	00000073          	ecall
    80200302:	87aa                	mv	a5,a0
    80200304:	873e                	mv	a4,a5
    80200306:	87ae                	mv	a5,a1
    80200308:	fee43023          	sd	a4,-32(s0)
    8020030c:	fef43423          	sd	a5,-24(s0)
    80200310:	fe043703          	ld	a4,-32(s0)
    80200314:	fe843783          	ld	a5,-24(s0)
    80200318:	863a                	mv	a2,a4
    8020031a:	86be                	mv	a3,a5
    8020031c:	8732                	mv	a4,a2
    8020031e:	87b6                	mv	a5,a3
    80200320:	853a                	mv	a0,a4
    80200322:	85be                	mv	a1,a5
    80200324:	7422                	ld	s0,40(sp)
    80200326:	6145                	addi	sp,sp,48
    80200328:	8082                	ret

000000008020032a <sbi_probe_extension>:
    8020032a:	7139                	addi	sp,sp,-64
    8020032c:	fc22                	sd	s0,56(sp)
    8020032e:	0080                	addi	s0,sp,64
    80200330:	fca43423          	sd	a0,-56(s0)
    80200334:	48c1                	li	a7,16
    80200336:	480d                	li	a6,3
    80200338:	fc843783          	ld	a5,-56(s0)
    8020033c:	853e                	mv	a0,a5
    8020033e:	00000073          	ecall
    80200342:	87aa                	mv	a5,a0
    80200344:	873e                	mv	a4,a5
    80200346:	87ae                	mv	a5,a1
    80200348:	fee43023          	sd	a4,-32(s0)
    8020034c:	fef43423          	sd	a5,-24(s0)
    80200350:	fe043703          	ld	a4,-32(s0)
    80200354:	fe843783          	ld	a5,-24(s0)
    80200358:	863a                	mv	a2,a4
    8020035a:	86be                	mv	a3,a5
    8020035c:	8732                	mv	a4,a2
    8020035e:	87b6                	mv	a5,a3
    80200360:	853a                	mv	a0,a4
    80200362:	85be                	mv	a1,a5
    80200364:	7462                	ld	s0,56(sp)
    80200366:	6121                	addi	sp,sp,64
    80200368:	8082                	ret

000000008020036a <sbi_shutdown>:
    8020036a:	1141                	addi	sp,sp,-16
    8020036c:	e422                	sd	s0,8(sp)
    8020036e:	0800                	addi	s0,sp,16
    80200370:	4501                	li	a0,0
    80200372:	4581                	li	a1,0
    80200374:	535257b7          	lui	a5,0x53525
    80200378:	35478893          	addi	a7,a5,852 # 53525354 <_start-0x2ccdacac>
    8020037c:	4801                	li	a6,0
    8020037e:	00000073          	ecall
    80200382:	0001                	nop
    80200384:	6422                	ld	s0,8(sp)
    80200386:	0141                	addi	sp,sp,16
    80200388:	8082                	ret
	...
