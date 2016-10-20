   1              		.syntax unified
   2              		.arch armv7-a
   3              		.eabi_attribute 27, 3
   4              		.eabi_attribute 28, 1
   5              		.fpu vfpv3-d16
   6              		.eabi_attribute 20, 1
   7              		.eabi_attribute 21, 1
   8              		.eabi_attribute 23, 3
   9              		.eabi_attribute 24, 1
  10              		.eabi_attribute 25, 1
  11              		.eabi_attribute 26, 2
  12              		.eabi_attribute 30, 6
  13              		.eabi_attribute 18, 4
  14              		.thumb
  15              		.file	"alpha_time.c"
  16              		.text
  17              	.Ltext0:
  18              		.cfi_sections	.debug_frame
  19              		.comm	backImage,1048576,4
  20              		.comm	foreImage,1048576,4
  21              		.comm	newImage,1048576,4
  22              		.section	.rodata
  23              		.align	2
  24              	.LC0:
  25 0000 55736167 		.ascii	"Usage:%s foreground background outFile\012\000"
  25      653A2573 
  25      20666F72 
  25      6567726F 
  25      756E6420 
  26              		.align	2
  27              	.LC1:
  28 0028 726200   		.ascii	"rb\000"
  29 002b 00       		.align	2
  30              	.LC2:
  31 002c 776200   		.ascii	"wb\000"
  32 002f 00       		.align	2
  33              	.LC3:
  34 0030 4572726F 		.ascii	"Error with backImage\012\000"
  34      72207769 
  34      74682062 
  34      61636B49 
  34      6D616765 
  35 0046 0000     		.align	2
  36              	.LC4:
  37 0048 4572726F 		.ascii	"Error with foreImage\012\000"
  37      72207769 
  37      74682066 
  37      6F726549 
  37      6D616765 
  38 005e 0000     		.align	2
  39              	.LC5:
  40 0060 41766572 		.ascii	"Average time for routine: %d microseconds.\011 Mini"
  40      61676520 
  40      74696D65 
  40      20666F72 
  40      20726F75 
  41 0090 6D756D20 		.ascii	"mum time is: %d microseconds\012\000"
  41      74696D65 
  41      2069733A 
  41      20256420 
  41      6D696372 
  42 00ae 0000     		.align	2
  43              	.LC6:
  44 00b0 50726F62 		.ascii	"Problem opening a file\012\000"
  44      6C656D20 
  44      6F70656E 
  44      696E6720 
  44      61206669 
  45              		.text
  46              		.align	2
  47              		.global	main
  48              		.thumb
  49              		.thumb_func
  51              	main:
  52              	.LFB0:
  53              		.file 1 "alpha_time.c"
   1:alpha_time.c  **** void alphaBlend_c(int *fgImage, int *bgImage, int *dstImage);
   2:alpha_time.c  **** 
   3:alpha_time.c  **** #include <stdio.h>
   4:alpha_time.c  **** #include <sys/time.h>
   5:alpha_time.c  **** 
   6:alpha_time.c  **** int backImage[512 * 512];
   7:alpha_time.c  **** int foreImage[512 * 512];
   8:alpha_time.c  **** int newImage[512 * 512];
   9:alpha_time.c  **** 
  10:alpha_time.c  **** int main(int argc, char**argv)
  11:alpha_time.c  **** {
  54              		.loc 1 11 0
  55              		.cfi_startproc
  56              		@ args = 0, pretend = 0, frame = 56
  57              		@ frame_needed = 1, uses_anonymous_args = 0
  58 0000 90B5     		push	{r4, r7, lr}
  59              	.LCFI0:
  60              		.cfi_def_cfa_offset 12
  61              		.cfi_offset 14, -4
  62              		.cfi_offset 7, -8
  63              		.cfi_offset 4, -12
  64 0002 8FB0     		sub	sp, sp, #60
  65              	.LCFI1:
  66              		.cfi_def_cfa_offset 72
  67 0004 00AF     		add	r7, sp, #0
  68              	.LCFI2:
  69              		.cfi_def_cfa_register 7
  70 0006 7860     		str	r0, [r7, #4]
  71 0008 3960     		str	r1, [r7, #0]
  12:alpha_time.c  ****    FILE *fgFile, *bgFile, *outFile;
  13:alpha_time.c  ****    int result, minTime = 1234567890, totalTime=0, diffTime=0, i;
  72              		.loc 1 13 0
  73 000a 40F2D223 		movw	r3, #722
  74 000e C4F69613 		movt	r3, 18838
  75 0012 7B63     		str	r3, [r7, #52]
  76 0014 4FF00003 		mov	r3, #0
  77 0018 3B63     		str	r3, [r7, #48]
  78 001a 4FF00003 		mov	r3, #0
  79 001e BB62     		str	r3, [r7, #40]
  14:alpha_time.c  ****    struct timeval oldTv, newTv;
  15:alpha_time.c  **** 
  16:alpha_time.c  ****    if(argc != 4){
  80              		.loc 1 16 0
  81 0020 7B68     		ldr	r3, [r7, #4]
  82 0022 042B     		cmp	r3, #4
  83 0024 12D0     		beq	.L2
  17:alpha_time.c  ****       fprintf(stderr, "Usage:%s foreground background outFile\n",argv[0]);
  84              		.loc 1 17 0
  85 0026 40F20003 		movw	r3, #:lower16:stderr
  86 002a C0F20003 		movt	r3, #:upper16:stderr
  87 002e 1B68     		ldr	r3, [r3, #0]
  88 0030 1946     		mov	r1, r3
  89 0032 40F20003 		movw	r3, #:lower16:.LC0
  90 0036 C0F20003 		movt	r3, #:upper16:.LC0
  91 003a 3A68     		ldr	r2, [r7, #0]
  92 003c 1268     		ldr	r2, [r2, #0]
  93 003e 0846     		mov	r0, r1
  94 0040 1946     		mov	r1, r3
  95 0042 FFF7FEFF 		bl	fprintf
  18:alpha_time.c  ****       return 1;
  96              		.loc 1 18 0
  97 0046 4FF00103 		mov	r3, #1
  98 004a 13E1     		b	.L3
  99              	.L2:
  19:alpha_time.c  ****    }
  20:alpha_time.c  ****    fgFile = fopen(argv[1], "rb");
 100              		.loc 1 20 0
 101 004c 3B68     		ldr	r3, [r7, #0]
 102 004e 03F10403 		add	r3, r3, #4
 103 0052 1B68     		ldr	r3, [r3, #0]
 104 0054 1A46     		mov	r2, r3
 105 0056 40F20003 		movw	r3, #:lower16:.LC1
 106 005a C0F20003 		movt	r3, #:upper16:.LC1
 107 005e 1046     		mov	r0, r2
 108 0060 1946     		mov	r1, r3
 109 0062 FFF7FEFF 		bl	fopen
 110 0066 0346     		mov	r3, r0
 111 0068 7B62     		str	r3, [r7, #36]
  21:alpha_time.c  ****    bgFile = fopen(argv[2], "rb");
 112              		.loc 1 21 0
 113 006a 3B68     		ldr	r3, [r7, #0]
 114 006c 03F10803 		add	r3, r3, #8
 115 0070 1B68     		ldr	r3, [r3, #0]
 116 0072 1A46     		mov	r2, r3
 117 0074 40F20003 		movw	r3, #:lower16:.LC1
 118 0078 C0F20003 		movt	r3, #:upper16:.LC1
 119 007c 1046     		mov	r0, r2
 120 007e 1946     		mov	r1, r3
 121 0080 FFF7FEFF 		bl	fopen
 122 0084 0346     		mov	r3, r0
 123 0086 3B62     		str	r3, [r7, #32]
  22:alpha_time.c  ****    outFile = fopen(argv[3], "wb");
 124              		.loc 1 22 0
 125 0088 3B68     		ldr	r3, [r7, #0]
 126 008a 03F10C03 		add	r3, r3, #12
 127 008e 1B68     		ldr	r3, [r3, #0]
 128 0090 1A46     		mov	r2, r3
 129 0092 40F20003 		movw	r3, #:lower16:.LC2
 130 0096 C0F20003 		movt	r3, #:upper16:.LC2
 131 009a 1046     		mov	r0, r2
 132 009c 1946     		mov	r1, r3
 133 009e FFF7FEFF 		bl	fopen
 134 00a2 0346     		mov	r3, r0
 135 00a4 FB61     		str	r3, [r7, #28]
  23:alpha_time.c  **** 
  24:alpha_time.c  ****    if(fgFile && bgFile && outFile){
 136              		.loc 1 24 0
 137 00a6 7B6A     		ldr	r3, [r7, #36]
 138 00a8 002B     		cmp	r3, #0
 139 00aa 00F0CF80 		beq	.L4
 140              		.loc 1 24 0 is_stmt 0 discriminator 1
 141 00ae 3B6A     		ldr	r3, [r7, #32]
 142 00b0 002B     		cmp	r3, #0
 143 00b2 00F0CB80 		beq	.L4
 144 00b6 FB69     		ldr	r3, [r7, #28]
 145 00b8 002B     		cmp	r3, #0
 146 00ba 00F0C780 		beq	.L4
  25:alpha_time.c  ****      result = fread(backImage, 512*sizeof(int), 512, bgFile);
 147              		.loc 1 25 0 is_stmt 1
 148 00be 40F20003 		movw	r3, #:lower16:backImage
 149 00c2 C0F20003 		movt	r3, #:upper16:backImage
 150 00c6 1846     		mov	r0, r3
 151 00c8 4FF40061 		mov	r1, #2048
 152 00cc 4FF40072 		mov	r2, #512
 153 00d0 3B6A     		ldr	r3, [r7, #32]
 154 00d2 FFF7FEFF 		bl	fread
 155 00d6 0346     		mov	r3, r0
 156 00d8 BB61     		str	r3, [r7, #24]
  26:alpha_time.c  ****      if(result != 512){
 157              		.loc 1 26 0
 158 00da BB69     		ldr	r3, [r7, #24]
 159 00dc B3F5007F 		cmp	r3, #512
 160 00e0 14D0     		beq	.L5
  27:alpha_time.c  ****        fprintf(stderr, "Error with backImage\n");
 161              		.loc 1 27 0
 162 00e2 40F20003 		movw	r3, #:lower16:.LC3
 163 00e6 C0F20003 		movt	r3, #:upper16:.LC3
 164 00ea 40F20002 		movw	r2, #:lower16:stderr
 165 00ee C0F20002 		movt	r2, #:upper16:stderr
 166 00f2 1268     		ldr	r2, [r2, #0]
 167 00f4 1446     		mov	r4, r2
 168 00f6 1846     		mov	r0, r3
 169 00f8 4FF00101 		mov	r1, #1
 170 00fc 4FF01502 		mov	r2, #21
 171 0100 2346     		mov	r3, r4
 172 0102 FFF7FEFF 		bl	fwrite
  28:alpha_time.c  ****        return 3;
 173              		.loc 1 28 0
 174 0106 4FF00303 		mov	r3, #3
 175 010a B3E0     		b	.L3
 176              	.L5:
  29:alpha_time.c  ****      }
  30:alpha_time.c  ****      result = fread(foreImage, 512*sizeof(int), 512, fgFile);
 177              		.loc 1 30 0
 178 010c 40F20003 		movw	r3, #:lower16:foreImage
 179 0110 C0F20003 		movt	r3, #:upper16:foreImage
 180 0114 1846     		mov	r0, r3
 181 0116 4FF40061 		mov	r1, #2048
 182 011a 4FF40072 		mov	r2, #512
 183 011e 7B6A     		ldr	r3, [r7, #36]
 184 0120 FFF7FEFF 		bl	fread
 185 0124 0346     		mov	r3, r0
 186 0126 BB61     		str	r3, [r7, #24]
  31:alpha_time.c  ****      if(result != 512){
 187              		.loc 1 31 0
 188 0128 BB69     		ldr	r3, [r7, #24]
 189 012a B3F5007F 		cmp	r3, #512
 190 012e 14D0     		beq	.L6
  32:alpha_time.c  ****        fprintf(stderr, "Error with foreImage\n");
 191              		.loc 1 32 0
 192 0130 40F20003 		movw	r3, #:lower16:.LC4
 193 0134 C0F20003 		movt	r3, #:upper16:.LC4
 194 0138 40F20002 		movw	r2, #:lower16:stderr
 195 013c C0F20002 		movt	r2, #:upper16:stderr
 196 0140 1268     		ldr	r2, [r2, #0]
 197 0142 1446     		mov	r4, r2
 198 0144 1846     		mov	r0, r3
 199 0146 4FF00101 		mov	r1, #1
 200 014a 4FF01502 		mov	r2, #21
 201 014e 2346     		mov	r3, r4
 202 0150 FFF7FEFF 		bl	fwrite
  33:alpha_time.c  ****        return 4;
 203              		.loc 1 33 0
 204 0154 4FF00403 		mov	r3, #4
 205 0158 8CE0     		b	.L3
 206              	.L6:
  34:alpha_time.c  ****      }
  35:alpha_time.c  ****      for(i=0; i<500; i++){
 207              		.loc 1 35 0
 208 015a 4FF00003 		mov	r3, #0
 209 015e FB62     		str	r3, [r7, #44]
 210 0160 3DE0     		b	.L7
 211              	.L9:
  36:alpha_time.c  ****      gettimeofday(&oldTv, NULL);
 212              		.loc 1 36 0
 213 0162 07F11003 		add	r3, r7, #16
 214 0166 1846     		mov	r0, r3
 215 0168 4FF00001 		mov	r1, #0
 216 016c FFF7FEFF 		bl	gettimeofday
  37:alpha_time.c  ****      alphaBlend_c(&foreImage[0], &backImage[0], &newImage[0]);
 217              		.loc 1 37 0
 218 0170 40F20000 		movw	r0, #:lower16:foreImage
 219 0174 C0F20000 		movt	r0, #:upper16:foreImage
 220 0178 40F20001 		movw	r1, #:lower16:backImage
 221 017c C0F20001 		movt	r1, #:upper16:backImage
 222 0180 40F20002 		movw	r2, #:lower16:newImage
 223 0184 C0F20002 		movt	r2, #:upper16:newImage
 224 0188 FFF7FEFF 		bl	alphaBlend_c
  38:alpha_time.c  ****      gettimeofday(&newTv, NULL);
 225              		.loc 1 38 0
 226 018c 07F10803 		add	r3, r7, #8
 227 0190 1846     		mov	r0, r3
 228 0192 4FF00001 		mov	r1, #0
 229 0196 FFF7FEFF 		bl	gettimeofday
  39:alpha_time.c  ****      diffTime =  (int)((newTv.tv_sec*1000000) + newTv.tv_usec - (oldTv.tv_sec*1000000) -  oldTv.tv_
 230              		.loc 1 39 0
 231 019a BA68     		ldr	r2, [r7, #8]
 232 019c 44F24023 		movw	r3, #16960
 233 01a0 C0F20F03 		movt	r3, 15
 234 01a4 03FB02F2 		mul	r2, r3, r2
 235 01a8 3969     		ldr	r1, [r7, #16]
 236 01aa 4BF6C053 		movw	r3, #48576
 237 01ae CFF6F073 		movt	r3, 65520
 238 01b2 03FB01F3 		mul	r3, r3, r1
 239 01b6 D218     		adds	r2, r2, r3
 240 01b8 FB68     		ldr	r3, [r7, #12]
 241 01ba D218     		adds	r2, r2, r3
 242 01bc 7B69     		ldr	r3, [r7, #20]
 243 01be D31A     		subs	r3, r2, r3
 244 01c0 BB62     		str	r3, [r7, #40]
  40:alpha_time.c  ****      totalTime += diffTime;
 245              		.loc 1 40 0
 246 01c2 3A6B     		ldr	r2, [r7, #48]
 247 01c4 BB6A     		ldr	r3, [r7, #40]
 248 01c6 D318     		adds	r3, r2, r3
 249 01c8 3B63     		str	r3, [r7, #48]
  41:alpha_time.c  ****      if(diffTime<minTime)
 250              		.loc 1 41 0
 251 01ca BA6A     		ldr	r2, [r7, #40]
 252 01cc 7B6B     		ldr	r3, [r7, #52]
 253 01ce 9A42     		cmp	r2, r3
 254 01d0 01DA     		bge	.L8
  42:alpha_time.c  **** 	minTime = diffTime;
 255              		.loc 1 42 0
 256 01d2 BB6A     		ldr	r3, [r7, #40]
 257 01d4 7B63     		str	r3, [r7, #52]
 258              	.L8:
  35:alpha_time.c  ****      for(i=0; i<500; i++){
 259              		.loc 1 35 0
 260 01d6 FB6A     		ldr	r3, [r7, #44]
 261 01d8 03F10103 		add	r3, r3, #1
 262 01dc FB62     		str	r3, [r7, #44]
 263              	.L7:
  35:alpha_time.c  ****      for(i=0; i<500; i++){
 264              		.loc 1 35 0 is_stmt 0 discriminator 1
 265 01de FA6A     		ldr	r2, [r7, #44]
 266 01e0 40F2F313 		movw	r3, #499
 267 01e4 9A42     		cmp	r2, r3
 268 01e6 BCDD     		ble	.L9
  43:alpha_time.c  ****      }
  44:alpha_time.c  ****      fprintf(stdout, "Average time for routine: %d microseconds.\t Minimum time is: %d microseconds
 269              		.loc 1 44 0 is_stmt 1
 270 01e8 40F20003 		movw	r3, #:lower16:stdout
 271 01ec C0F20003 		movt	r3, #:upper16:stdout
 272 01f0 1B68     		ldr	r3, [r3, #0]
 273 01f2 1846     		mov	r0, r3
 274 01f4 40F20003 		movw	r3, #:lower16:.LC5
 275 01f8 C0F20003 		movt	r3, #:upper16:.LC5
 276 01fc 396B     		ldr	r1, [r7, #48]
 277 01fe 44F6D352 		movw	r2, #19923
 278 0202 C1F26202 		movt	r2, 4194
 279 0206 82FB01C2 		smull	ip, r2, r2, r1
 280 020a 4FEA6214 		asr	r4, r2, #5
 281 020e 4FEAE172 		asr	r2, r1, #31
 282 0212 A21A     		subs	r2, r4, r2
 283 0214 1946     		mov	r1, r3
 284 0216 7B6B     		ldr	r3, [r7, #52]
 285 0218 FFF7FEFF 		bl	fprintf
  45:alpha_time.c  ****     // fprintf(stdout, "Routine took %d microseconds\n", (int)((newTv.tv_sec*1000000) + newTv.tv_us
  46:alpha_time.c  ****      fwrite(newImage, 512*sizeof(int),512,outFile);
 286              		.loc 1 46 0
 287 021c 40F20003 		movw	r3, #:lower16:newImage
 288 0220 C0F20003 		movt	r3, #:upper16:newImage
 289 0224 1846     		mov	r0, r3
 290 0226 4FF40061 		mov	r1, #2048
 291 022a 4FF40072 		mov	r2, #512
 292 022e FB69     		ldr	r3, [r7, #28]
 293 0230 FFF7FEFF 		bl	fwrite
  47:alpha_time.c  ****      fclose(fgFile);
 294              		.loc 1 47 0
 295 0234 786A     		ldr	r0, [r7, #36]
 296 0236 FFF7FEFF 		bl	fclose
  48:alpha_time.c  ****      fclose(bgFile);
 297              		.loc 1 48 0
 298 023a 386A     		ldr	r0, [r7, #32]
 299 023c FFF7FEFF 		bl	fclose
  49:alpha_time.c  ****      fclose(outFile);
 300              		.loc 1 49 0
 301 0240 F869     		ldr	r0, [r7, #28]
 302 0242 FFF7FEFF 		bl	fclose
  50:alpha_time.c  ****      return 0;
 303              		.loc 1 50 0
 304 0246 4FF00003 		mov	r3, #0
 305 024a 13E0     		b	.L3
 306              	.L4:
  51:alpha_time.c  ****    }
  52:alpha_time.c  ****    fprintf(stderr, "Problem opening a file\n");
 307              		.loc 1 52 0
 308 024c 40F20003 		movw	r3, #:lower16:.LC6
 309 0250 C0F20003 		movt	r3, #:upper16:.LC6
 310 0254 40F20002 		movw	r2, #:lower16:stderr
 311 0258 C0F20002 		movt	r2, #:upper16:stderr
 312 025c 1268     		ldr	r2, [r2, #0]
 313 025e 1446     		mov	r4, r2
 314 0260 1846     		mov	r0, r3
 315 0262 4FF00101 		mov	r1, #1
 316 0266 4FF01702 		mov	r2, #23
 317 026a 2346     		mov	r3, r4
 318 026c FFF7FEFF 		bl	fwrite
  53:alpha_time.c  ****    return 2;
 319              		.loc 1 53 0
 320 0270 4FF00203 		mov	r3, #2
 321              	.L3:
  54:alpha_time.c  **** }
 322              		.loc 1 54 0
 323 0274 1846     		mov	r0, r3
 324 0276 07F13C07 		add	r7, r7, #60
 325 027a BD46     		mov	sp, r7
 326 027c 90BD     		pop	{r4, r7, pc}
 327              		.cfi_endproc
 328              	.LFE0:
 330 027e 00BF     		.align	2
 331              		.global	alphaBlend_c
 332              		.thumb
 333              		.thumb_func
 335              	alphaBlend_c:
 336              	.LFB1:
  55:alpha_time.c  **** 
  56:alpha_time.c  **** #define A(x) (((x) & 0xff000000) >> 24)
  57:alpha_time.c  **** #define R(x) (((x) & 0x00ff0000) >> 16)
  58:alpha_time.c  **** #define G(x) (((x) & 0x0000ff00) >> 8)
  59:alpha_time.c  **** #define B(x) ((x) & 0x000000ff)
  60:alpha_time.c  **** 
  61:alpha_time.c  **** void alphaBlend_c(int *fgImage, int *bgImage, int *dstImage)
  62:alpha_time.c  **** {
 337              		.loc 1 62 0
 338              		.cfi_startproc
 339              		@ args = 0, pretend = 0, frame = 40
 340              		@ frame_needed = 1, uses_anonymous_args = 0
 341              		@ link register save eliminated.
 342 0280 80B4     		push	{r7}
 343              	.LCFI3:
 344              		.cfi_def_cfa_offset 4
 345              		.cfi_offset 7, -4
 346 0282 8BB0     		sub	sp, sp, #44
 347              	.LCFI4:
 348              		.cfi_def_cfa_offset 48
 349 0284 00AF     		add	r7, sp, #0
 350              	.LCFI5:
 351              		.cfi_def_cfa_register 7
 352 0286 F860     		str	r0, [r7, #12]
 353 0288 B960     		str	r1, [r7, #8]
 354 028a 7A60     		str	r2, [r7, #4]
  63:alpha_time.c  ****   int x, y;
  64:alpha_time.c  ****   for(y = 0; y < 512; y++){
 355              		.loc 1 64 0
 356 028c 4FF00003 		mov	r3, #0
 357 0290 3B62     		str	r3, [r7, #32]
 358 0292 BBE0     		b	.L11
 359              	.L14:
  65:alpha_time.c  ****      for(x = 0; x < 512; x++){
 360              		.loc 1 65 0
 361 0294 4FF00003 		mov	r3, #0
 362 0298 7B62     		str	r3, [r7, #36]
 363 029a ADE0     		b	.L12
 364              	.L13:
 365              	.LBB2:
  66:alpha_time.c  ****         int a_fg = A(fgImage[(y*512)+x]);
 366              		.loc 1 66 0 discriminator 2
 367 029c 3B6A     		ldr	r3, [r7, #32]
 368 029e 4FEA4322 		lsl	r2, r3, #9
 369 02a2 7B6A     		ldr	r3, [r7, #36]
 370 02a4 D318     		adds	r3, r2, r3
 371 02a6 4FEA8303 		lsl	r3, r3, #2
 372 02aa FA68     		ldr	r2, [r7, #12]
 373 02ac D318     		adds	r3, r2, r3
 374 02ae 1B68     		ldr	r3, [r3, #0]
 375 02b0 4FEA1363 		lsr	r3, r3, #24
 376 02b4 FB61     		str	r3, [r7, #28]
  67:alpha_time.c  ****         int dst_r = ((R(fgImage[(y*512)+x]) * a_fg) + (R(bgImage[(y*512)+x]) * (255-a_fg)))/256;
 377              		.loc 1 67 0 discriminator 2
 378 02b6 3B6A     		ldr	r3, [r7, #32]
 379 02b8 4FEA4322 		lsl	r2, r3, #9
 380 02bc 7B6A     		ldr	r3, [r7, #36]
 381 02be D318     		adds	r3, r2, r3
 382 02c0 4FEA8303 		lsl	r3, r3, #2
 383 02c4 FA68     		ldr	r2, [r7, #12]
 384 02c6 D318     		adds	r3, r2, r3
 385 02c8 1B68     		ldr	r3, [r3, #0]
 386 02ca 03F47F03 		and	r3, r3, #16711680
 387 02ce 4FEA2343 		asr	r3, r3, #16
 388 02d2 FA69     		ldr	r2, [r7, #28]
 389 02d4 02FB03F2 		mul	r2, r2, r3
 390 02d8 3B6A     		ldr	r3, [r7, #32]
 391 02da 4FEA4321 		lsl	r1, r3, #9
 392 02de 7B6A     		ldr	r3, [r7, #36]
 393 02e0 CB18     		adds	r3, r1, r3
 394 02e2 4FEA8303 		lsl	r3, r3, #2
 395 02e6 B968     		ldr	r1, [r7, #8]
 396 02e8 CB18     		adds	r3, r1, r3
 397 02ea 1B68     		ldr	r3, [r3, #0]
 398 02ec 03F47F03 		and	r3, r3, #16711680
 399 02f0 4FEA2343 		asr	r3, r3, #16
 400 02f4 F969     		ldr	r1, [r7, #28]
 401 02f6 C1F1FF01 		rsb	r1, r1, #255
 402 02fa 01FB03F3 		mul	r3, r1, r3
 403 02fe D318     		adds	r3, r2, r3
 404 0300 03F1FF02 		add	r2, r3, #255
 405 0304 002B     		cmp	r3, #0
 406 0306 B8BF     		it	lt
 407 0308 1346     		movlt	r3, r2
 408 030a 4FEA2323 		asr	r3, r3, #8
 409 030e BB61     		str	r3, [r7, #24]
  68:alpha_time.c  ****         int dst_g = ((G(fgImage[(y*512)+x]) * a_fg) + (G(bgImage[(y*512)+x]) * (255-a_fg)))/256;
 410              		.loc 1 68 0 discriminator 2
 411 0310 3B6A     		ldr	r3, [r7, #32]
 412 0312 4FEA4322 		lsl	r2, r3, #9
 413 0316 7B6A     		ldr	r3, [r7, #36]
 414 0318 D318     		adds	r3, r2, r3
 415 031a 4FEA8303 		lsl	r3, r3, #2
 416 031e FA68     		ldr	r2, [r7, #12]
 417 0320 D318     		adds	r3, r2, r3
 418 0322 1B68     		ldr	r3, [r3, #0]
 419 0324 03F47F43 		and	r3, r3, #65280
 420 0328 4FEA2323 		asr	r3, r3, #8
 421 032c FA69     		ldr	r2, [r7, #28]
 422 032e 02FB03F2 		mul	r2, r2, r3
 423 0332 3B6A     		ldr	r3, [r7, #32]
 424 0334 4FEA4321 		lsl	r1, r3, #9
 425 0338 7B6A     		ldr	r3, [r7, #36]
 426 033a CB18     		adds	r3, r1, r3
 427 033c 4FEA8303 		lsl	r3, r3, #2
 428 0340 B968     		ldr	r1, [r7, #8]
 429 0342 CB18     		adds	r3, r1, r3
 430 0344 1B68     		ldr	r3, [r3, #0]
 431 0346 03F47F43 		and	r3, r3, #65280
 432 034a 4FEA2323 		asr	r3, r3, #8
 433 034e F969     		ldr	r1, [r7, #28]
 434 0350 C1F1FF01 		rsb	r1, r1, #255
 435 0354 01FB03F3 		mul	r3, r1, r3
 436 0358 D318     		adds	r3, r2, r3
 437 035a 03F1FF02 		add	r2, r3, #255
 438 035e 002B     		cmp	r3, #0
 439 0360 B8BF     		it	lt
 440 0362 1346     		movlt	r3, r2
 441 0364 4FEA2323 		asr	r3, r3, #8
 442 0368 7B61     		str	r3, [r7, #20]
  69:alpha_time.c  ****         int dst_b = ((B(fgImage[(y*512)+x]) * a_fg) + (B(bgImage[(y*512)+x]) * (255-a_fg)))/256;
 443              		.loc 1 69 0 discriminator 2
 444 036a 3B6A     		ldr	r3, [r7, #32]
 445 036c 4FEA4322 		lsl	r2, r3, #9
 446 0370 7B6A     		ldr	r3, [r7, #36]
 447 0372 D318     		adds	r3, r2, r3
 448 0374 4FEA8303 		lsl	r3, r3, #2
 449 0378 FA68     		ldr	r2, [r7, #12]
 450 037a D318     		adds	r3, r2, r3
 451 037c 1B68     		ldr	r3, [r3, #0]
 452 037e DBB2     		uxtb	r3, r3
 453 0380 FA69     		ldr	r2, [r7, #28]
 454 0382 02FB03F2 		mul	r2, r2, r3
 455 0386 3B6A     		ldr	r3, [r7, #32]
 456 0388 4FEA4321 		lsl	r1, r3, #9
 457 038c 7B6A     		ldr	r3, [r7, #36]
 458 038e CB18     		adds	r3, r1, r3
 459 0390 4FEA8303 		lsl	r3, r3, #2
 460 0394 B968     		ldr	r1, [r7, #8]
 461 0396 CB18     		adds	r3, r1, r3
 462 0398 1B68     		ldr	r3, [r3, #0]
 463 039a DBB2     		uxtb	r3, r3
 464 039c F969     		ldr	r1, [r7, #28]
 465 039e C1F1FF01 		rsb	r1, r1, #255
 466 03a2 01FB03F3 		mul	r3, r1, r3
 467 03a6 D318     		adds	r3, r2, r3
 468 03a8 03F1FF02 		add	r2, r3, #255
 469 03ac 002B     		cmp	r3, #0
 470 03ae B8BF     		it	lt
 471 03b0 1346     		movlt	r3, r2
 472 03b2 4FEA2323 		asr	r3, r3, #8
 473 03b6 3B61     		str	r3, [r7, #16]
  70:alpha_time.c  ****         dstImage[(y*512)+x] =  0xff000000 |
 474              		.loc 1 70 0 discriminator 2
 475 03b8 3B6A     		ldr	r3, [r7, #32]
 476 03ba 4FEA4322 		lsl	r2, r3, #9
 477 03be 7B6A     		ldr	r3, [r7, #36]
 478 03c0 D318     		adds	r3, r2, r3
 479 03c2 4FEA8303 		lsl	r3, r3, #2
 480 03c6 7A68     		ldr	r2, [r7, #4]
 481 03c8 D218     		adds	r2, r2, r3
  71:alpha_time.c  ****                               (0x00ff0000 & (dst_r << 16)) |
 482              		.loc 1 71 0 discriminator 2
 483 03ca BB69     		ldr	r3, [r7, #24]
 484 03cc 4FEA0343 		lsl	r3, r3, #16
 485 03d0 03F47F01 		and	r1, r3, #16711680
  72:alpha_time.c  ****                               (0x0000ff00 & (dst_g << 8)) |
 486              		.loc 1 72 0 discriminator 2
 487 03d4 7B69     		ldr	r3, [r7, #20]
 488 03d6 4FEA0323 		lsl	r3, r3, #8
  71:alpha_time.c  ****                               (0x00ff0000 & (dst_r << 16)) |
 489              		.loc 1 71 0 discriminator 2
 490 03da 4FEA0343 		lsl	r3, r3, #16
 491 03de 4FEA1343 		lsr	r3, r3, #16
 492 03e2 1943     		orrs	r1, r1, r3
 493              		.loc 1 72 0 discriminator 2
 494 03e4 3B69     		ldr	r3, [r7, #16]
 495 03e6 DBB2     		uxtb	r3, r3
 496 03e8 0B43     		orrs	r3, r3, r1
 497 03ea 43F07F43 		orr	r3, r3, #-16777216
  70:alpha_time.c  ****         dstImage[(y*512)+x] =  0xff000000 |
 498              		.loc 1 70 0 discriminator 2
 499 03ee 1360     		str	r3, [r2, #0]
 500              	.LBE2:
  65:alpha_time.c  ****      for(x = 0; x < 512; x++){
 501              		.loc 1 65 0 discriminator 2
 502 03f0 7B6A     		ldr	r3, [r7, #36]
 503 03f2 03F10103 		add	r3, r3, #1
 504 03f6 7B62     		str	r3, [r7, #36]
 505              	.L12:
  65:alpha_time.c  ****      for(x = 0; x < 512; x++){
 506              		.loc 1 65 0 is_stmt 0 discriminator 1
 507 03f8 7A6A     		ldr	r2, [r7, #36]
 508 03fa 40F2FF13 		movw	r3, #511
 509 03fe 9A42     		cmp	r2, r3
 510 0400 7FF74CAF 		ble	.L13
  64:alpha_time.c  ****   for(y = 0; y < 512; y++){
 511              		.loc 1 64 0 is_stmt 1
 512 0404 3B6A     		ldr	r3, [r7, #32]
 513 0406 03F10103 		add	r3, r3, #1
 514 040a 3B62     		str	r3, [r7, #32]
 515              	.L11:
  64:alpha_time.c  ****   for(y = 0; y < 512; y++){
 516              		.loc 1 64 0 is_stmt 0 discriminator 1
 517 040c 3A6A     		ldr	r2, [r7, #32]
 518 040e 40F2FF13 		movw	r3, #511
 519 0412 9A42     		cmp	r2, r3
 520 0414 7FF73EAF 		ble	.L14
  73:alpha_time.c  ****                               (0x000000ff & (dst_b));
  74:alpha_time.c  ****      }
  75:alpha_time.c  ****   }
  76:alpha_time.c  **** }
 521              		.loc 1 76 0 is_stmt 1
 522 0418 07F12C07 		add	r7, r7, #44
 523 041c BD46     		mov	sp, r7
 524 041e 80BC     		pop	{r7}
 525 0420 7047     		bx	lr
 526              		.cfi_endproc
 527              	.LFE1:
 529              	.Letext0:
 530              		.file 2 "/usr/lib/gcc/arm-linux-gnueabihf/4.6/include/stddef.h"
 531              		.file 3 "/usr/include/arm-linux-gnueabihf/bits/types.h"
 532              		.file 4 "/usr/include/stdio.h"
 533              		.file 5 "/usr/include/libio.h"
 534              		.file 6 "/usr/include/arm-linux-gnueabihf/bits/time.h"
