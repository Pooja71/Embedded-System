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
  40 0060 526F7574 		.ascii	"Routine took minimum time of %d microseconds\012\000"
  40      696E6520 
  40      746F6F6B 
  40      206D696E 
  40      696D756D 
  41 008e 0000     		.align	2
  42              	.LC6:
  43 0090 50726F62 		.ascii	"Problem opening a file\012\000"
  43      6C656D20 
  43      6F70656E 
  43      696E6720 
  43      61206669 
  44              		.text
  45              		.align	2
  46              		.global	main
  47              		.thumb
  48              		.thumb_func
  50              	main:
  51              	.LFB0:
  52              		.file 1 "alpha_time.c"
   1:alpha_time.c  **** void alphaBlend_c(int * __restrict__ fgImage, int * __restrict__ bgImage, int * __restrict__ dstIma
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
  53              		.loc 1 11 0
  54              		.cfi_startproc
  55              		@ args = 0, pretend = 0, frame = 56
  56              		@ frame_needed = 1, uses_anonymous_args = 0
  57 0000 90B5     		push	{r4, r7, lr}
  58              	.LCFI0:
  59              		.cfi_def_cfa_offset 12
  60              		.cfi_offset 14, -4
  61              		.cfi_offset 7, -8
  62              		.cfi_offset 4, -12
  63 0002 8FB0     		sub	sp, sp, #60
  64              	.LCFI1:
  65              		.cfi_def_cfa_offset 72
  66 0004 00AF     		add	r7, sp, #0
  67              	.LCFI2:
  68              		.cfi_def_cfa_register 7
  69 0006 7860     		str	r0, [r7, #4]
  70 0008 3960     		str	r1, [r7, #0]
  12:alpha_time.c  ****    FILE *fgFile, *bgFile, *outFile;
  13:alpha_time.c  ****    int result, min=1234567890, time, i;
  71              		.loc 1 13 0
  72 000a 40F2D223 		movw	r3, #722
  73 000e C4F69613 		movt	r3, 18838
  74 0012 7B63     		str	r3, [r7, #52]
  14:alpha_time.c  ****    struct timeval oldTv, newTv;
  15:alpha_time.c  **** 
  16:alpha_time.c  ****    if(argc != 4){
  75              		.loc 1 16 0
  76 0014 7B68     		ldr	r3, [r7, #4]
  77 0016 042B     		cmp	r3, #4
  78 0018 12D0     		beq	.L2
  17:alpha_time.c  ****       fprintf(stderr, "Usage:%s foreground background outFile\n",argv[0]);
  79              		.loc 1 17 0
  80 001a 40F20003 		movw	r3, #:lower16:stderr
  81 001e C0F20003 		movt	r3, #:upper16:stderr
  82 0022 1B68     		ldr	r3, [r3, #0]
  83 0024 1946     		mov	r1, r3
  84 0026 40F20003 		movw	r3, #:lower16:.LC0
  85 002a C0F20003 		movt	r3, #:upper16:.LC0
  86 002e 3A68     		ldr	r2, [r7, #0]
  87 0030 1268     		ldr	r2, [r2, #0]
  88 0032 0846     		mov	r0, r1
  89 0034 1946     		mov	r1, r3
  90 0036 FFF7FEFF 		bl	fprintf
  18:alpha_time.c  ****       return 1;
  91              		.loc 1 18 0
  92 003a 4FF00103 		mov	r3, #1
  93 003e 04E1     		b	.L3
  94              	.L2:
  19:alpha_time.c  ****    }
  20:alpha_time.c  ****    fgFile = fopen(argv[1], "rb");
  95              		.loc 1 20 0
  96 0040 3B68     		ldr	r3, [r7, #0]
  97 0042 03F10403 		add	r3, r3, #4
  98 0046 1B68     		ldr	r3, [r3, #0]
  99 0048 1A46     		mov	r2, r3
 100 004a 40F20003 		movw	r3, #:lower16:.LC1
 101 004e C0F20003 		movt	r3, #:upper16:.LC1
 102 0052 1046     		mov	r0, r2
 103 0054 1946     		mov	r1, r3
 104 0056 FFF7FEFF 		bl	fopen
 105 005a 0346     		mov	r3, r0
 106 005c FB62     		str	r3, [r7, #44]
  21:alpha_time.c  ****    bgFile = fopen(argv[2], "rb");
 107              		.loc 1 21 0
 108 005e 3B68     		ldr	r3, [r7, #0]
 109 0060 03F10803 		add	r3, r3, #8
 110 0064 1B68     		ldr	r3, [r3, #0]
 111 0066 1A46     		mov	r2, r3
 112 0068 40F20003 		movw	r3, #:lower16:.LC1
 113 006c C0F20003 		movt	r3, #:upper16:.LC1
 114 0070 1046     		mov	r0, r2
 115 0072 1946     		mov	r1, r3
 116 0074 FFF7FEFF 		bl	fopen
 117 0078 0346     		mov	r3, r0
 118 007a BB62     		str	r3, [r7, #40]
  22:alpha_time.c  ****    outFile = fopen(argv[3], "wb");
 119              		.loc 1 22 0
 120 007c 3B68     		ldr	r3, [r7, #0]
 121 007e 03F10C03 		add	r3, r3, #12
 122 0082 1B68     		ldr	r3, [r3, #0]
 123 0084 1A46     		mov	r2, r3
 124 0086 40F20003 		movw	r3, #:lower16:.LC2
 125 008a C0F20003 		movt	r3, #:upper16:.LC2
 126 008e 1046     		mov	r0, r2
 127 0090 1946     		mov	r1, r3
 128 0092 FFF7FEFF 		bl	fopen
 129 0096 0346     		mov	r3, r0
 130 0098 7B62     		str	r3, [r7, #36]
  23:alpha_time.c  **** 
  24:alpha_time.c  ****    if(fgFile && bgFile && outFile){
 131              		.loc 1 24 0
 132 009a FB6A     		ldr	r3, [r7, #44]
 133 009c 002B     		cmp	r3, #0
 134 009e 00F0C080 		beq	.L4
 135              		.loc 1 24 0 is_stmt 0 discriminator 1
 136 00a2 BB6A     		ldr	r3, [r7, #40]
 137 00a4 002B     		cmp	r3, #0
 138 00a6 00F0BC80 		beq	.L4
 139 00aa 7B6A     		ldr	r3, [r7, #36]
 140 00ac 002B     		cmp	r3, #0
 141 00ae 00F0B880 		beq	.L4
  25:alpha_time.c  ****      result = fread(backImage, 512*sizeof(int), 512, bgFile);
 142              		.loc 1 25 0 is_stmt 1
 143 00b2 40F20003 		movw	r3, #:lower16:backImage
 144 00b6 C0F20003 		movt	r3, #:upper16:backImage
 145 00ba 1846     		mov	r0, r3
 146 00bc 4FF40061 		mov	r1, #2048
 147 00c0 4FF40072 		mov	r2, #512
 148 00c4 BB6A     		ldr	r3, [r7, #40]
 149 00c6 FFF7FEFF 		bl	fread
 150 00ca 0346     		mov	r3, r0
 151 00cc 3B62     		str	r3, [r7, #32]
  26:alpha_time.c  ****      if(result != 512){
 152              		.loc 1 26 0
 153 00ce 3B6A     		ldr	r3, [r7, #32]
 154 00d0 B3F5007F 		cmp	r3, #512
 155 00d4 14D0     		beq	.L5
  27:alpha_time.c  ****        fprintf(stderr, "Error with backImage\n");
 156              		.loc 1 27 0
 157 00d6 40F20003 		movw	r3, #:lower16:.LC3
 158 00da C0F20003 		movt	r3, #:upper16:.LC3
 159 00de 40F20002 		movw	r2, #:lower16:stderr
 160 00e2 C0F20002 		movt	r2, #:upper16:stderr
 161 00e6 1268     		ldr	r2, [r2, #0]
 162 00e8 1446     		mov	r4, r2
 163 00ea 1846     		mov	r0, r3
 164 00ec 4FF00101 		mov	r1, #1
 165 00f0 4FF01502 		mov	r2, #21
 166 00f4 2346     		mov	r3, r4
 167 00f6 FFF7FEFF 		bl	fwrite
  28:alpha_time.c  ****        return 3;
 168              		.loc 1 28 0
 169 00fa 4FF00303 		mov	r3, #3
 170 00fe A4E0     		b	.L3
 171              	.L5:
  29:alpha_time.c  ****      }
  30:alpha_time.c  ****      result = fread(foreImage, 512*sizeof(int), 512, fgFile);
 172              		.loc 1 30 0
 173 0100 40F20003 		movw	r3, #:lower16:foreImage
 174 0104 C0F20003 		movt	r3, #:upper16:foreImage
 175 0108 1846     		mov	r0, r3
 176 010a 4FF40061 		mov	r1, #2048
 177 010e 4FF40072 		mov	r2, #512
 178 0112 FB6A     		ldr	r3, [r7, #44]
 179 0114 FFF7FEFF 		bl	fread
 180 0118 0346     		mov	r3, r0
 181 011a 3B62     		str	r3, [r7, #32]
  31:alpha_time.c  ****      if(result != 512){
 182              		.loc 1 31 0
 183 011c 3B6A     		ldr	r3, [r7, #32]
 184 011e B3F5007F 		cmp	r3, #512
 185 0122 14D0     		beq	.L6
  32:alpha_time.c  ****        fprintf(stderr, "Error with foreImage\n");
 186              		.loc 1 32 0
 187 0124 40F20003 		movw	r3, #:lower16:.LC4
 188 0128 C0F20003 		movt	r3, #:upper16:.LC4
 189 012c 40F20002 		movw	r2, #:lower16:stderr
 190 0130 C0F20002 		movt	r2, #:upper16:stderr
 191 0134 1268     		ldr	r2, [r2, #0]
 192 0136 1446     		mov	r4, r2
 193 0138 1846     		mov	r0, r3
 194 013a 4FF00101 		mov	r1, #1
 195 013e 4FF01502 		mov	r2, #21
 196 0142 2346     		mov	r3, r4
 197 0144 FFF7FEFF 		bl	fwrite
  33:alpha_time.c  ****        return 4;
 198              		.loc 1 33 0
 199 0148 4FF00403 		mov	r3, #4
 200 014c 7DE0     		b	.L3
 201              	.L6:
  34:alpha_time.c  ****      }
  35:alpha_time.c  ****      for(i=0; i<500; i++){
 202              		.loc 1 35 0
 203 014e 4FF00003 		mov	r3, #0
 204 0152 3B63     		str	r3, [r7, #48]
 205 0154 39E0     		b	.L7
 206              	.L9:
  36:alpha_time.c  ****      gettimeofday(&oldTv, NULL);
 207              		.loc 1 36 0
 208 0156 07F11403 		add	r3, r7, #20
 209 015a 1846     		mov	r0, r3
 210 015c 4FF00001 		mov	r1, #0
 211 0160 FFF7FEFF 		bl	gettimeofday
  37:alpha_time.c  **** 
  38:alpha_time.c  ****      alphaBlend_c(&foreImage[0], &backImage[0], &newImage[0]);
 212              		.loc 1 38 0
 213 0164 40F20000 		movw	r0, #:lower16:foreImage
 214 0168 C0F20000 		movt	r0, #:upper16:foreImage
 215 016c 40F20001 		movw	r1, #:lower16:backImage
 216 0170 C0F20001 		movt	r1, #:upper16:backImage
 217 0174 40F20002 		movw	r2, #:lower16:newImage
 218 0178 C0F20002 		movt	r2, #:upper16:newImage
 219 017c FFF7FEFF 		bl	alphaBlend_c
  39:alpha_time.c  ****     // alphaBlend_c();
  40:alpha_time.c  ****      gettimeofday(&newTv, NULL);
 220              		.loc 1 40 0
 221 0180 07F10C03 		add	r3, r7, #12
 222 0184 1846     		mov	r0, r3
 223 0186 4FF00001 		mov	r1, #0
 224 018a FFF7FEFF 		bl	gettimeofday
  41:alpha_time.c  ****      time = newTv.tv_sec*1000000 + newTv.tv_usec - oldTv.tv_sec*1000000 - oldTv.tv_usec;
 225              		.loc 1 41 0
 226 018e FA68     		ldr	r2, [r7, #12]
 227 0190 44F24023 		movw	r3, #16960
 228 0194 C0F20F03 		movt	r3, 15
 229 0198 03FB02F2 		mul	r2, r3, r2
 230 019c 7969     		ldr	r1, [r7, #20]
 231 019e 4BF6C053 		movw	r3, #48576
 232 01a2 CFF6F073 		movt	r3, 65520
 233 01a6 03FB01F3 		mul	r3, r3, r1
 234 01aa D218     		adds	r2, r2, r3
 235 01ac 3B69     		ldr	r3, [r7, #16]
 236 01ae D218     		adds	r2, r2, r3
 237 01b0 BB69     		ldr	r3, [r7, #24]
 238 01b2 D31A     		subs	r3, r2, r3
 239 01b4 FB61     		str	r3, [r7, #28]
  42:alpha_time.c  ****      if(time<min){
 240              		.loc 1 42 0
 241 01b6 FA69     		ldr	r2, [r7, #28]
 242 01b8 7B6B     		ldr	r3, [r7, #52]
 243 01ba 9A42     		cmp	r2, r3
 244 01bc 01DA     		bge	.L8
  43:alpha_time.c  **** 	min = time;
 245              		.loc 1 43 0
 246 01be FB69     		ldr	r3, [r7, #28]
 247 01c0 7B63     		str	r3, [r7, #52]
 248              	.L8:
  35:alpha_time.c  ****      for(i=0; i<500; i++){
 249              		.loc 1 35 0
 250 01c2 3B6B     		ldr	r3, [r7, #48]
 251 01c4 03F10103 		add	r3, r3, #1
 252 01c8 3B63     		str	r3, [r7, #48]
 253              	.L7:
  35:alpha_time.c  ****      for(i=0; i<500; i++){
 254              		.loc 1 35 0 is_stmt 0 discriminator 1
 255 01ca 3A6B     		ldr	r2, [r7, #48]
 256 01cc 40F2F313 		movw	r3, #499
 257 01d0 9A42     		cmp	r2, r3
 258 01d2 C0DD     		ble	.L9
  44:alpha_time.c  **** }
  45:alpha_time.c  **** }
  46:alpha_time.c  ****      fprintf(stdout, "Routine took minimum time of %d microseconds\n",min);
 259              		.loc 1 46 0 is_stmt 1
 260 01d4 40F20003 		movw	r3, #:lower16:stdout
 261 01d8 C0F20003 		movt	r3, #:upper16:stdout
 262 01dc 1B68     		ldr	r3, [r3, #0]
 263 01de 1A46     		mov	r2, r3
 264 01e0 40F20003 		movw	r3, #:lower16:.LC5
 265 01e4 C0F20003 		movt	r3, #:upper16:.LC5
 266 01e8 1046     		mov	r0, r2
 267 01ea 1946     		mov	r1, r3
 268 01ec 7A6B     		ldr	r2, [r7, #52]
 269 01ee FFF7FEFF 		bl	fprintf
  47:alpha_time.c  ****      fwrite(newImage, 512*sizeof(int),512,outFile);
 270              		.loc 1 47 0
 271 01f2 40F20003 		movw	r3, #:lower16:newImage
 272 01f6 C0F20003 		movt	r3, #:upper16:newImage
 273 01fa 1846     		mov	r0, r3
 274 01fc 4FF40061 		mov	r1, #2048
 275 0200 4FF40072 		mov	r2, #512
 276 0204 7B6A     		ldr	r3, [r7, #36]
 277 0206 FFF7FEFF 		bl	fwrite
  48:alpha_time.c  ****      fclose(fgFile);
 278              		.loc 1 48 0
 279 020a F86A     		ldr	r0, [r7, #44]
 280 020c FFF7FEFF 		bl	fclose
  49:alpha_time.c  ****      fclose(bgFile);
 281              		.loc 1 49 0
 282 0210 B86A     		ldr	r0, [r7, #40]
 283 0212 FFF7FEFF 		bl	fclose
  50:alpha_time.c  ****      fclose(outFile);
 284              		.loc 1 50 0
 285 0216 786A     		ldr	r0, [r7, #36]
 286 0218 FFF7FEFF 		bl	fclose
  51:alpha_time.c  ****      return 0;
 287              		.loc 1 51 0
 288 021c 4FF00003 		mov	r3, #0
 289 0220 13E0     		b	.L3
 290              	.L4:
  52:alpha_time.c  ****    }
  53:alpha_time.c  ****    fprintf(stderr, "Problem opening a file\n");
 291              		.loc 1 53 0
 292 0222 40F20003 		movw	r3, #:lower16:.LC6
 293 0226 C0F20003 		movt	r3, #:upper16:.LC6
 294 022a 40F20002 		movw	r2, #:lower16:stderr
 295 022e C0F20002 		movt	r2, #:upper16:stderr
 296 0232 1268     		ldr	r2, [r2, #0]
 297 0234 1446     		mov	r4, r2
 298 0236 1846     		mov	r0, r3
 299 0238 4FF00101 		mov	r1, #1
 300 023c 4FF01702 		mov	r2, #23
 301 0240 2346     		mov	r3, r4
 302 0242 FFF7FEFF 		bl	fwrite
  54:alpha_time.c  ****    return 2;
 303              		.loc 1 54 0
 304 0246 4FF00203 		mov	r3, #2
 305              	.L3:
  55:alpha_time.c  **** }
 306              		.loc 1 55 0
 307 024a 1846     		mov	r0, r3
 308 024c 07F13C07 		add	r7, r7, #60
 309 0250 BD46     		mov	sp, r7
 310 0252 90BD     		pop	{r4, r7, pc}
 311              		.cfi_endproc
 312              	.LFE0:
 314              		.align	2
 315              		.global	alphaBlend_c
 316              		.thumb
 317              		.thumb_func
 319              	alphaBlend_c:
 320              	.LFB1:
  56:alpha_time.c  **** 
  57:alpha_time.c  **** #define A(x) (((x) & 0xff000000) >> 24)
  58:alpha_time.c  **** #define R(x) (((x) & 0x00ff0000) >> 16)
  59:alpha_time.c  **** #define G(x) (((x) & 0x0000ff00) >> 8)
  60:alpha_time.c  **** #define B(x) ((x) & 0x000000ff)
  61:alpha_time.c  **** 
  62:alpha_time.c  **** void alphaBlend_c(int * __restrict__ fgImage, int *__restrict__ bgImage, int * __restrict__ dstImag
  63:alpha_time.c  **** {
 321              		.loc 1 63 0
 322              		.cfi_startproc
 323              		@ args = 0, pretend = 0, frame = 200
 324              		@ frame_needed = 1, uses_anonymous_args = 0
 325              		@ link register save eliminated.
 326 0254 80B4     		push	{r7}
 327              	.LCFI3:
 328              		.cfi_def_cfa_offset 4
 329              		.cfi_offset 7, -4
 330 0256 B3B0     		sub	sp, sp, #204
 331              	.LCFI4:
 332              		.cfi_def_cfa_offset 208
 333 0258 00AF     		add	r7, sp, #0
 334              	.LCFI5:
 335              		.cfi_def_cfa_register 7
 336 025a F860     		str	r0, [r7, #12]
 337 025c B960     		str	r1, [r7, #8]
 338 025e 7A60     		str	r2, [r7, #4]
  64:alpha_time.c  ****   int x;//, y[512*512];
  65:alpha_time.c  ****  /* int a[4]={1, 2, 3, 4};
  66:alpha_time.c  ****   int b[4]={1, 2, 3, 4};
  67:alpha_time.c  ****   int c[4]={0, 0, 0, 0};
  68:alpha_time.c  ****   for(x=0; x<4; x++){
  69:alpha_time.c  **** 	c[x]=a[x]*b[x];
  70:alpha_time.c  **** }*/
  71:alpha_time.c  **** 
  72:alpha_time.c  **** int a_fg[4], comp_a_fg[4], fg_r[4], fg_g[4], fg_b[4], bg_r[4], bg_g[4], bg_b[4], dst_r[4], dst_g[4]
  73:alpha_time.c  ****  for(x=0; x<65536; x++)
 339              		.loc 1 73 0
 340 0260 4FF00003 		mov	r3, #0
 341 0264 C7F8C430 		str	r3, [r7, #196]
 342 0268 F3E2     		b	.L11
 343              	.L12:
  74:alpha_time.c  **** {
  75:alpha_time.c  **** 	 a_fg[0] = A(fgImage[(4*x+0)]);
 344              		.loc 1 75 0 discriminator 2
 345 026a D7F8C430 		ldr	r3, [r7, #196]
 346 026e 4FEA0313 		lsl	r3, r3, #4
 347 0272 FA68     		ldr	r2, [r7, #12]
 348 0274 D318     		adds	r3, r2, r3
 349 0276 1B68     		ldr	r3, [r3, #0]
 350 0278 4FEA1363 		lsr	r3, r3, #24
 351 027c C7F8B430 		str	r3, [r7, #180]
  76:alpha_time.c  **** 	 a_fg[1] = A(fgImage[(4*x+1)]);
 352              		.loc 1 76 0 discriminator 2
 353 0280 D7F8C430 		ldr	r3, [r7, #196]
 354 0284 4FEA0313 		lsl	r3, r3, #4
 355 0288 03F10403 		add	r3, r3, #4
 356 028c FA68     		ldr	r2, [r7, #12]
 357 028e D318     		adds	r3, r2, r3
 358 0290 1B68     		ldr	r3, [r3, #0]
 359 0292 4FEA1363 		lsr	r3, r3, #24
 360 0296 C7F8B830 		str	r3, [r7, #184]
  77:alpha_time.c  **** 	 a_fg[2] = A(fgImage[(4*x+2)]);
 361              		.loc 1 77 0 discriminator 2
 362 029a D7F8C430 		ldr	r3, [r7, #196]
 363 029e 4FEA0313 		lsl	r3, r3, #4
 364 02a2 03F10803 		add	r3, r3, #8
 365 02a6 FA68     		ldr	r2, [r7, #12]
 366 02a8 D318     		adds	r3, r2, r3
 367 02aa 1B68     		ldr	r3, [r3, #0]
 368 02ac 4FEA1363 		lsr	r3, r3, #24
 369 02b0 C7F8BC30 		str	r3, [r7, #188]
  78:alpha_time.c  **** 	 a_fg[3] = A(fgImage[(4*x+3)]);
 370              		.loc 1 78 0 discriminator 2
 371 02b4 D7F8C430 		ldr	r3, [r7, #196]
 372 02b8 4FEA0313 		lsl	r3, r3, #4
 373 02bc 03F10C03 		add	r3, r3, #12
 374 02c0 FA68     		ldr	r2, [r7, #12]
 375 02c2 D318     		adds	r3, r2, r3
 376 02c4 1B68     		ldr	r3, [r3, #0]
 377 02c6 4FEA1363 		lsr	r3, r3, #24
 378 02ca C7F8C030 		str	r3, [r7, #192]
  79:alpha_time.c  **** 
  80:alpha_time.c  **** 	comp_a_fg[0]=255-a_fg[0];
 379              		.loc 1 80 0 discriminator 2
 380 02ce D7F8B430 		ldr	r3, [r7, #180]
 381 02d2 C3F1FF03 		rsb	r3, r3, #255
 382 02d6 C7F8A430 		str	r3, [r7, #164]
  81:alpha_time.c  ****         comp_a_fg[1]=255-a_fg[1];
 383              		.loc 1 81 0 discriminator 2
 384 02da D7F8B830 		ldr	r3, [r7, #184]
 385 02de C3F1FF03 		rsb	r3, r3, #255
 386 02e2 C7F8A830 		str	r3, [r7, #168]
  82:alpha_time.c  ****         comp_a_fg[2]=255-a_fg[2];
 387              		.loc 1 82 0 discriminator 2
 388 02e6 D7F8BC30 		ldr	r3, [r7, #188]
 389 02ea C3F1FF03 		rsb	r3, r3, #255
 390 02ee C7F8AC30 		str	r3, [r7, #172]
  83:alpha_time.c  ****         comp_a_fg[3]=255-a_fg[3];
 391              		.loc 1 83 0 discriminator 2
 392 02f2 D7F8C030 		ldr	r3, [r7, #192]
 393 02f6 C3F1FF03 		rsb	r3, r3, #255
 394 02fa C7F8B030 		str	r3, [r7, #176]
  84:alpha_time.c  **** 
  85:alpha_time.c  **** 	fg_r[0]=R(fgImage[(4*x+0)]);
 395              		.loc 1 85 0 discriminator 2
 396 02fe D7F8C430 		ldr	r3, [r7, #196]
 397 0302 4FEA0313 		lsl	r3, r3, #4
 398 0306 FA68     		ldr	r2, [r7, #12]
 399 0308 D318     		adds	r3, r2, r3
 400 030a 1B68     		ldr	r3, [r3, #0]
 401 030c 03F47F03 		and	r3, r3, #16711680
 402 0310 4FEA2343 		asr	r3, r3, #16
 403 0314 C7F89430 		str	r3, [r7, #148]
  86:alpha_time.c  **** 	fg_r[1]=R(fgImage[(4*x+1)]);
 404              		.loc 1 86 0 discriminator 2
 405 0318 D7F8C430 		ldr	r3, [r7, #196]
 406 031c 4FEA0313 		lsl	r3, r3, #4
 407 0320 03F10403 		add	r3, r3, #4
 408 0324 FA68     		ldr	r2, [r7, #12]
 409 0326 D318     		adds	r3, r2, r3
 410 0328 1B68     		ldr	r3, [r3, #0]
 411 032a 03F47F03 		and	r3, r3, #16711680
 412 032e 4FEA2343 		asr	r3, r3, #16
 413 0332 C7F89830 		str	r3, [r7, #152]
  87:alpha_time.c  **** 	fg_r[2]=R(fgImage[(4*x+2)]);
 414              		.loc 1 87 0 discriminator 2
 415 0336 D7F8C430 		ldr	r3, [r7, #196]
 416 033a 4FEA0313 		lsl	r3, r3, #4
 417 033e 03F10803 		add	r3, r3, #8
 418 0342 FA68     		ldr	r2, [r7, #12]
 419 0344 D318     		adds	r3, r2, r3
 420 0346 1B68     		ldr	r3, [r3, #0]
 421 0348 03F47F03 		and	r3, r3, #16711680
 422 034c 4FEA2343 		asr	r3, r3, #16
 423 0350 C7F89C30 		str	r3, [r7, #156]
  88:alpha_time.c  **** 	fg_r[3]=R(fgImage[(4*x+3)]);
 424              		.loc 1 88 0 discriminator 2
 425 0354 D7F8C430 		ldr	r3, [r7, #196]
 426 0358 4FEA0313 		lsl	r3, r3, #4
 427 035c 03F10C03 		add	r3, r3, #12
 428 0360 FA68     		ldr	r2, [r7, #12]
 429 0362 D318     		adds	r3, r2, r3
 430 0364 1B68     		ldr	r3, [r3, #0]
 431 0366 03F47F03 		and	r3, r3, #16711680
 432 036a 4FEA2343 		asr	r3, r3, #16
 433 036e C7F8A030 		str	r3, [r7, #160]
  89:alpha_time.c  **** 	
  90:alpha_time.c  **** 	bg_r[0]=R(bgImage[(4*x+0)]);
 434              		.loc 1 90 0 discriminator 2
 435 0372 D7F8C430 		ldr	r3, [r7, #196]
 436 0376 4FEA0313 		lsl	r3, r3, #4
 437 037a BA68     		ldr	r2, [r7, #8]
 438 037c D318     		adds	r3, r2, r3
 439 037e 1B68     		ldr	r3, [r3, #0]
 440 0380 03F47F03 		and	r3, r3, #16711680
 441 0384 4FEA2343 		asr	r3, r3, #16
 442 0388 7B66     		str	r3, [r7, #100]
  91:alpha_time.c  **** 	bg_r[1]=R(bgImage[(4*x+1)]);
 443              		.loc 1 91 0 discriminator 2
 444 038a D7F8C430 		ldr	r3, [r7, #196]
 445 038e 4FEA0313 		lsl	r3, r3, #4
 446 0392 03F10403 		add	r3, r3, #4
 447 0396 BA68     		ldr	r2, [r7, #8]
 448 0398 D318     		adds	r3, r2, r3
 449 039a 1B68     		ldr	r3, [r3, #0]
 450 039c 03F47F03 		and	r3, r3, #16711680
 451 03a0 4FEA2343 		asr	r3, r3, #16
 452 03a4 BB66     		str	r3, [r7, #104]
  92:alpha_time.c  **** 	bg_r[2]=R(bgImage[(4*x+2)]);
 453              		.loc 1 92 0 discriminator 2
 454 03a6 D7F8C430 		ldr	r3, [r7, #196]
 455 03aa 4FEA0313 		lsl	r3, r3, #4
 456 03ae 03F10803 		add	r3, r3, #8
 457 03b2 BA68     		ldr	r2, [r7, #8]
 458 03b4 D318     		adds	r3, r2, r3
 459 03b6 1B68     		ldr	r3, [r3, #0]
 460 03b8 03F47F03 		and	r3, r3, #16711680
 461 03bc 4FEA2343 		asr	r3, r3, #16
 462 03c0 FB66     		str	r3, [r7, #108]
  93:alpha_time.c  **** 	bg_r[3]=R(bgImage[(4*x+3)]);
 463              		.loc 1 93 0 discriminator 2
 464 03c2 D7F8C430 		ldr	r3, [r7, #196]
 465 03c6 4FEA0313 		lsl	r3, r3, #4
 466 03ca 03F10C03 		add	r3, r3, #12
 467 03ce BA68     		ldr	r2, [r7, #8]
 468 03d0 D318     		adds	r3, r2, r3
 469 03d2 1B68     		ldr	r3, [r3, #0]
 470 03d4 03F47F03 		and	r3, r3, #16711680
 471 03d8 4FEA2343 		asr	r3, r3, #16
 472 03dc 3B67     		str	r3, [r7, #112]
  94:alpha_time.c  **** 
  95:alpha_time.c  **** 
  96:alpha_time.c  **** 	fg_g[0]=G(fgImage[(4*x+0)]);
 473              		.loc 1 96 0 discriminator 2
 474 03de D7F8C430 		ldr	r3, [r7, #196]
 475 03e2 4FEA0313 		lsl	r3, r3, #4
 476 03e6 FA68     		ldr	r2, [r7, #12]
 477 03e8 D318     		adds	r3, r2, r3
 478 03ea 1B68     		ldr	r3, [r3, #0]
 479 03ec 03F47F43 		and	r3, r3, #65280
 480 03f0 4FEA2323 		asr	r3, r3, #8
 481 03f4 C7F88430 		str	r3, [r7, #132]
  97:alpha_time.c  **** 	fg_g[1]=G(fgImage[(4*x+1)]);
 482              		.loc 1 97 0 discriminator 2
 483 03f8 D7F8C430 		ldr	r3, [r7, #196]
 484 03fc 4FEA0313 		lsl	r3, r3, #4
 485 0400 03F10403 		add	r3, r3, #4
 486 0404 FA68     		ldr	r2, [r7, #12]
 487 0406 D318     		adds	r3, r2, r3
 488 0408 1B68     		ldr	r3, [r3, #0]
 489 040a 03F47F43 		and	r3, r3, #65280
 490 040e 4FEA2323 		asr	r3, r3, #8
 491 0412 C7F88830 		str	r3, [r7, #136]
  98:alpha_time.c  **** 	fg_g[2]=G(fgImage[(4*x+2)]);
 492              		.loc 1 98 0 discriminator 2
 493 0416 D7F8C430 		ldr	r3, [r7, #196]
 494 041a 4FEA0313 		lsl	r3, r3, #4
 495 041e 03F10803 		add	r3, r3, #8
 496 0422 FA68     		ldr	r2, [r7, #12]
 497 0424 D318     		adds	r3, r2, r3
 498 0426 1B68     		ldr	r3, [r3, #0]
 499 0428 03F47F43 		and	r3, r3, #65280
 500 042c 4FEA2323 		asr	r3, r3, #8
 501 0430 C7F88C30 		str	r3, [r7, #140]
  99:alpha_time.c  **** 	fg_g[3]=G(fgImage[(4*x+3)]);
 502              		.loc 1 99 0 discriminator 2
 503 0434 D7F8C430 		ldr	r3, [r7, #196]
 504 0438 4FEA0313 		lsl	r3, r3, #4
 505 043c 03F10C03 		add	r3, r3, #12
 506 0440 FA68     		ldr	r2, [r7, #12]
 507 0442 D318     		adds	r3, r2, r3
 508 0444 1B68     		ldr	r3, [r3, #0]
 509 0446 03F47F43 		and	r3, r3, #65280
 510 044a 4FEA2323 		asr	r3, r3, #8
 511 044e C7F89030 		str	r3, [r7, #144]
 100:alpha_time.c  **** 	
 101:alpha_time.c  **** 	bg_g[0]=G(bgImage[(4*x+0)]);
 512              		.loc 1 101 0 discriminator 2
 513 0452 D7F8C430 		ldr	r3, [r7, #196]
 514 0456 4FEA0313 		lsl	r3, r3, #4
 515 045a BA68     		ldr	r2, [r7, #8]
 516 045c D318     		adds	r3, r2, r3
 517 045e 1B68     		ldr	r3, [r3, #0]
 518 0460 03F47F43 		and	r3, r3, #65280
 519 0464 4FEA2323 		asr	r3, r3, #8
 520 0468 7B65     		str	r3, [r7, #84]
 102:alpha_time.c  **** 	bg_g[1]=G(bgImage[(4*x+1)]);
 521              		.loc 1 102 0 discriminator 2
 522 046a D7F8C430 		ldr	r3, [r7, #196]
 523 046e 4FEA0313 		lsl	r3, r3, #4
 524 0472 03F10403 		add	r3, r3, #4
 525 0476 BA68     		ldr	r2, [r7, #8]
 526 0478 D318     		adds	r3, r2, r3
 527 047a 1B68     		ldr	r3, [r3, #0]
 528 047c 03F47F43 		and	r3, r3, #65280
 529 0480 4FEA2323 		asr	r3, r3, #8
 530 0484 BB65     		str	r3, [r7, #88]
 103:alpha_time.c  **** 	bg_g[2]=G(bgImage[(4*x+2)]);
 531              		.loc 1 103 0 discriminator 2
 532 0486 D7F8C430 		ldr	r3, [r7, #196]
 533 048a 4FEA0313 		lsl	r3, r3, #4
 534 048e 03F10803 		add	r3, r3, #8
 535 0492 BA68     		ldr	r2, [r7, #8]
 536 0494 D318     		adds	r3, r2, r3
 537 0496 1B68     		ldr	r3, [r3, #0]
 538 0498 03F47F43 		and	r3, r3, #65280
 539 049c 4FEA2323 		asr	r3, r3, #8
 540 04a0 FB65     		str	r3, [r7, #92]
 104:alpha_time.c  **** 	bg_g[3]=G(bgImage[(4*x+3)]);
 541              		.loc 1 104 0 discriminator 2
 542 04a2 D7F8C430 		ldr	r3, [r7, #196]
 543 04a6 4FEA0313 		lsl	r3, r3, #4
 544 04aa 03F10C03 		add	r3, r3, #12
 545 04ae BA68     		ldr	r2, [r7, #8]
 546 04b0 D318     		adds	r3, r2, r3
 547 04b2 1B68     		ldr	r3, [r3, #0]
 548 04b4 03F47F43 		and	r3, r3, #65280
 549 04b8 4FEA2323 		asr	r3, r3, #8
 550 04bc 3B66     		str	r3, [r7, #96]
 105:alpha_time.c  **** 
 106:alpha_time.c  **** 	fg_b[0]=B(fgImage[(4*x+0)]);
 551              		.loc 1 106 0 discriminator 2
 552 04be D7F8C430 		ldr	r3, [r7, #196]
 553 04c2 4FEA0313 		lsl	r3, r3, #4
 554 04c6 FA68     		ldr	r2, [r7, #12]
 555 04c8 D318     		adds	r3, r2, r3
 556 04ca 1B68     		ldr	r3, [r3, #0]
 557 04cc DBB2     		uxtb	r3, r3
 558 04ce 7B67     		str	r3, [r7, #116]
 107:alpha_time.c  **** 	fg_b[1]=B(fgImage[(4*x+1)]);
 559              		.loc 1 107 0 discriminator 2
 560 04d0 D7F8C430 		ldr	r3, [r7, #196]
 561 04d4 4FEA0313 		lsl	r3, r3, #4
 562 04d8 03F10403 		add	r3, r3, #4
 563 04dc FA68     		ldr	r2, [r7, #12]
 564 04de D318     		adds	r3, r2, r3
 565 04e0 1B68     		ldr	r3, [r3, #0]
 566 04e2 DBB2     		uxtb	r3, r3
 567 04e4 BB67     		str	r3, [r7, #120]
 108:alpha_time.c  **** 	fg_b[2]=B(fgImage[(4*x+2)]);
 568              		.loc 1 108 0 discriminator 2
 569 04e6 D7F8C430 		ldr	r3, [r7, #196]
 570 04ea 4FEA0313 		lsl	r3, r3, #4
 571 04ee 03F10803 		add	r3, r3, #8
 572 04f2 FA68     		ldr	r2, [r7, #12]
 573 04f4 D318     		adds	r3, r2, r3
 574 04f6 1B68     		ldr	r3, [r3, #0]
 575 04f8 DBB2     		uxtb	r3, r3
 576 04fa FB67     		str	r3, [r7, #124]
 109:alpha_time.c  **** 	fg_b[3]=B(fgImage[(4*x+3)]);
 577              		.loc 1 109 0 discriminator 2
 578 04fc D7F8C430 		ldr	r3, [r7, #196]
 579 0500 4FEA0313 		lsl	r3, r3, #4
 580 0504 03F10C03 		add	r3, r3, #12
 581 0508 FA68     		ldr	r2, [r7, #12]
 582 050a D318     		adds	r3, r2, r3
 583 050c 1B68     		ldr	r3, [r3, #0]
 584 050e DBB2     		uxtb	r3, r3
 585 0510 C7F88030 		str	r3, [r7, #128]
 110:alpha_time.c  **** 	
 111:alpha_time.c  **** 	bg_b[0]=B(bgImage[(4*x+0)]);
 586              		.loc 1 111 0 discriminator 2
 587 0514 D7F8C430 		ldr	r3, [r7, #196]
 588 0518 4FEA0313 		lsl	r3, r3, #4
 589 051c BA68     		ldr	r2, [r7, #8]
 590 051e D318     		adds	r3, r2, r3
 591 0520 1B68     		ldr	r3, [r3, #0]
 592 0522 DBB2     		uxtb	r3, r3
 593 0524 7B64     		str	r3, [r7, #68]
 112:alpha_time.c  **** 	bg_b[1]=B(bgImage[(4*x+1)]);
 594              		.loc 1 112 0 discriminator 2
 595 0526 D7F8C430 		ldr	r3, [r7, #196]
 596 052a 4FEA0313 		lsl	r3, r3, #4
 597 052e 03F10403 		add	r3, r3, #4
 598 0532 BA68     		ldr	r2, [r7, #8]
 599 0534 D318     		adds	r3, r2, r3
 600 0536 1B68     		ldr	r3, [r3, #0]
 601 0538 DBB2     		uxtb	r3, r3
 602 053a BB64     		str	r3, [r7, #72]
 113:alpha_time.c  **** 	bg_b[2]=B(bgImage[(4*x+2)]);
 603              		.loc 1 113 0 discriminator 2
 604 053c D7F8C430 		ldr	r3, [r7, #196]
 605 0540 4FEA0313 		lsl	r3, r3, #4
 606 0544 03F10803 		add	r3, r3, #8
 607 0548 BA68     		ldr	r2, [r7, #8]
 608 054a D318     		adds	r3, r2, r3
 609 054c 1B68     		ldr	r3, [r3, #0]
 610 054e DBB2     		uxtb	r3, r3
 611 0550 FB64     		str	r3, [r7, #76]
 114:alpha_time.c  **** 	bg_b[3]=B(bgImage[(4*x+3)]);
 612              		.loc 1 114 0 discriminator 2
 613 0552 D7F8C430 		ldr	r3, [r7, #196]
 614 0556 4FEA0313 		lsl	r3, r3, #4
 615 055a 03F10C03 		add	r3, r3, #12
 616 055e BA68     		ldr	r2, [r7, #8]
 617 0560 D318     		adds	r3, r2, r3
 618 0562 1B68     		ldr	r3, [r3, #0]
 619 0564 DBB2     		uxtb	r3, r3
 620 0566 3B65     		str	r3, [r7, #80]
 115:alpha_time.c  **** 
 116:alpha_time.c  **** 	dst_r[0]= (fg_r[0]*a_fg[0])+(bg_r[0]*comp_a_fg[0]);
 621              		.loc 1 116 0 discriminator 2
 622 0568 D7F89430 		ldr	r3, [r7, #148]
 623 056c D7F8B420 		ldr	r2, [r7, #180]
 624 0570 02FB03F2 		mul	r2, r2, r3
 625 0574 7B6E     		ldr	r3, [r7, #100]
 626 0576 D7F8A410 		ldr	r1, [r7, #164]
 627 057a 01FB03F3 		mul	r3, r1, r3
 628 057e D318     		adds	r3, r2, r3
 629 0580 7B63     		str	r3, [r7, #52]
 117:alpha_time.c  **** 	 dst_r[1]= (fg_r[1]*a_fg[1])+(bg_r[1]*comp_a_fg[1]);
 630              		.loc 1 117 0 discriminator 2
 631 0582 D7F89830 		ldr	r3, [r7, #152]
 632 0586 D7F8B820 		ldr	r2, [r7, #184]
 633 058a 02FB03F2 		mul	r2, r2, r3
 634 058e BB6E     		ldr	r3, [r7, #104]
 635 0590 D7F8A810 		ldr	r1, [r7, #168]
 636 0594 01FB03F3 		mul	r3, r1, r3
 637 0598 D318     		adds	r3, r2, r3
 638 059a BB63     		str	r3, [r7, #56]
 118:alpha_time.c  **** 	 dst_r[2]= (fg_r[2]*a_fg[2])+(bg_r[2]*comp_a_fg[2]);
 639              		.loc 1 118 0 discriminator 2
 640 059c D7F89C30 		ldr	r3, [r7, #156]
 641 05a0 D7F8BC20 		ldr	r2, [r7, #188]
 642 05a4 02FB03F2 		mul	r2, r2, r3
 643 05a8 FB6E     		ldr	r3, [r7, #108]
 644 05aa D7F8AC10 		ldr	r1, [r7, #172]
 645 05ae 01FB03F3 		mul	r3, r1, r3
 646 05b2 D318     		adds	r3, r2, r3
 647 05b4 FB63     		str	r3, [r7, #60]
 119:alpha_time.c  **** 	 dst_r[3]= (fg_r[3]*a_fg[3])+(bg_r[3]*comp_a_fg[3]);
 648              		.loc 1 119 0 discriminator 2
 649 05b6 D7F8A030 		ldr	r3, [r7, #160]
 650 05ba D7F8C020 		ldr	r2, [r7, #192]
 651 05be 02FB03F2 		mul	r2, r2, r3
 652 05c2 3B6F     		ldr	r3, [r7, #112]
 653 05c4 D7F8B010 		ldr	r1, [r7, #176]
 654 05c8 01FB03F3 		mul	r3, r1, r3
 655 05cc D318     		adds	r3, r2, r3
 656 05ce 3B64     		str	r3, [r7, #64]
 120:alpha_time.c  **** 
 121:alpha_time.c  **** 	dst_g[0]= (fg_g[0]*a_fg[0])+(bg_g[0]*comp_a_fg[0]);
 657              		.loc 1 121 0 discriminator 2
 658 05d0 D7F88430 		ldr	r3, [r7, #132]
 659 05d4 D7F8B420 		ldr	r2, [r7, #180]
 660 05d8 02FB03F2 		mul	r2, r2, r3
 661 05dc 7B6D     		ldr	r3, [r7, #84]
 662 05de D7F8A410 		ldr	r1, [r7, #164]
 663 05e2 01FB03F3 		mul	r3, r1, r3
 664 05e6 D318     		adds	r3, r2, r3
 665 05e8 7B62     		str	r3, [r7, #36]
 122:alpha_time.c  **** 	 dst_g[1]= (fg_g[1]*a_fg[1])+(bg_g[1]*comp_a_fg[1]);
 666              		.loc 1 122 0 discriminator 2
 667 05ea D7F88830 		ldr	r3, [r7, #136]
 668 05ee D7F8B820 		ldr	r2, [r7, #184]
 669 05f2 02FB03F2 		mul	r2, r2, r3
 670 05f6 BB6D     		ldr	r3, [r7, #88]
 671 05f8 D7F8A810 		ldr	r1, [r7, #168]
 672 05fc 01FB03F3 		mul	r3, r1, r3
 673 0600 D318     		adds	r3, r2, r3
 674 0602 BB62     		str	r3, [r7, #40]
 123:alpha_time.c  **** 	 dst_g[2]= (fg_g[2]*a_fg[2])+(bg_g[2]*comp_a_fg[2]);
 675              		.loc 1 123 0 discriminator 2
 676 0604 D7F88C30 		ldr	r3, [r7, #140]
 677 0608 D7F8BC20 		ldr	r2, [r7, #188]
 678 060c 02FB03F2 		mul	r2, r2, r3
 679 0610 FB6D     		ldr	r3, [r7, #92]
 680 0612 D7F8AC10 		ldr	r1, [r7, #172]
 681 0616 01FB03F3 		mul	r3, r1, r3
 682 061a D318     		adds	r3, r2, r3
 683 061c FB62     		str	r3, [r7, #44]
 124:alpha_time.c  **** 	 dst_g[3]= (fg_g[3]*a_fg[3])+(bg_g[3]*comp_a_fg[3]);
 684              		.loc 1 124 0 discriminator 2
 685 061e D7F89030 		ldr	r3, [r7, #144]
 686 0622 D7F8C020 		ldr	r2, [r7, #192]
 687 0626 02FB03F2 		mul	r2, r2, r3
 688 062a 3B6E     		ldr	r3, [r7, #96]
 689 062c D7F8B010 		ldr	r1, [r7, #176]
 690 0630 01FB03F3 		mul	r3, r1, r3
 691 0634 D318     		adds	r3, r2, r3
 692 0636 3B63     		str	r3, [r7, #48]
 125:alpha_time.c  **** 
 126:alpha_time.c  **** 	dst_b[0]= (fg_b[0]*a_fg[0])+(bg_b[0]*comp_a_fg[0]);
 693              		.loc 1 126 0 discriminator 2
 694 0638 7B6F     		ldr	r3, [r7, #116]
 695 063a D7F8B420 		ldr	r2, [r7, #180]
 696 063e 02FB03F2 		mul	r2, r2, r3
 697 0642 7B6C     		ldr	r3, [r7, #68]
 698 0644 D7F8A410 		ldr	r1, [r7, #164]
 699 0648 01FB03F3 		mul	r3, r1, r3
 700 064c D318     		adds	r3, r2, r3
 701 064e 7B61     		str	r3, [r7, #20]
 127:alpha_time.c  **** 	 dst_b[1]= (fg_b[1]*a_fg[1])+(bg_b[1]*comp_a_fg[1]);
 702              		.loc 1 127 0 discriminator 2
 703 0650 BB6F     		ldr	r3, [r7, #120]
 704 0652 D7F8B820 		ldr	r2, [r7, #184]
 705 0656 02FB03F2 		mul	r2, r2, r3
 706 065a BB6C     		ldr	r3, [r7, #72]
 707 065c D7F8A810 		ldr	r1, [r7, #168]
 708 0660 01FB03F3 		mul	r3, r1, r3
 709 0664 D318     		adds	r3, r2, r3
 710 0666 BB61     		str	r3, [r7, #24]
 128:alpha_time.c  **** 	 dst_b[2]= (fg_b[2]*a_fg[2])+(bg_b[2]*comp_a_fg[2]);
 711              		.loc 1 128 0 discriminator 2
 712 0668 FB6F     		ldr	r3, [r7, #124]
 713 066a D7F8BC20 		ldr	r2, [r7, #188]
 714 066e 02FB03F2 		mul	r2, r2, r3
 715 0672 FB6C     		ldr	r3, [r7, #76]
 716 0674 D7F8AC10 		ldr	r1, [r7, #172]
 717 0678 01FB03F3 		mul	r3, r1, r3
 718 067c D318     		adds	r3, r2, r3
 719 067e FB61     		str	r3, [r7, #28]
 129:alpha_time.c  **** 	 dst_b[3]= (fg_b[3]*a_fg[3])+(bg_b[3]*comp_a_fg[3]);
 720              		.loc 1 129 0 discriminator 2
 721 0680 D7F88030 		ldr	r3, [r7, #128]
 722 0684 D7F8C020 		ldr	r2, [r7, #192]
 723 0688 02FB03F2 		mul	r2, r2, r3
 724 068c 3B6D     		ldr	r3, [r7, #80]
 725 068e D7F8B010 		ldr	r1, [r7, #176]
 726 0692 01FB03F3 		mul	r3, r1, r3
 727 0696 D318     		adds	r3, r2, r3
 728 0698 3B62     		str	r3, [r7, #32]
 130:alpha_time.c  **** 
 131:alpha_time.c  **** 
 132:alpha_time.c  **** 	dst_r[0]/=256;
 729              		.loc 1 132 0 discriminator 2
 730 069a 7B6B     		ldr	r3, [r7, #52]
 731 069c 03F1FF02 		add	r2, r3, #255
 732 06a0 002B     		cmp	r3, #0
 733 06a2 B8BF     		it	lt
 734 06a4 1346     		movlt	r3, r2
 735 06a6 4FEA2323 		asr	r3, r3, #8
 736 06aa 7B63     		str	r3, [r7, #52]
 133:alpha_time.c  **** 	dst_r[1]/=256;
 737              		.loc 1 133 0 discriminator 2
 738 06ac BB6B     		ldr	r3, [r7, #56]
 739 06ae 03F1FF02 		add	r2, r3, #255
 740 06b2 002B     		cmp	r3, #0
 741 06b4 B8BF     		it	lt
 742 06b6 1346     		movlt	r3, r2
 743 06b8 4FEA2323 		asr	r3, r3, #8
 744 06bc BB63     		str	r3, [r7, #56]
 134:alpha_time.c  **** 	dst_r[2]/=256;
 745              		.loc 1 134 0 discriminator 2
 746 06be FB6B     		ldr	r3, [r7, #60]
 747 06c0 03F1FF02 		add	r2, r3, #255
 748 06c4 002B     		cmp	r3, #0
 749 06c6 B8BF     		it	lt
 750 06c8 1346     		movlt	r3, r2
 751 06ca 4FEA2323 		asr	r3, r3, #8
 752 06ce FB63     		str	r3, [r7, #60]
 135:alpha_time.c  **** 	dst_r[3]/=256;
 753              		.loc 1 135 0 discriminator 2
 754 06d0 3B6C     		ldr	r3, [r7, #64]
 755 06d2 03F1FF02 		add	r2, r3, #255
 756 06d6 002B     		cmp	r3, #0
 757 06d8 B8BF     		it	lt
 758 06da 1346     		movlt	r3, r2
 759 06dc 4FEA2323 		asr	r3, r3, #8
 760 06e0 3B64     		str	r3, [r7, #64]
 136:alpha_time.c  **** 	
 137:alpha_time.c  **** 	dst_g[0]/=256;
 761              		.loc 1 137 0 discriminator 2
 762 06e2 7B6A     		ldr	r3, [r7, #36]
 763 06e4 03F1FF02 		add	r2, r3, #255
 764 06e8 002B     		cmp	r3, #0
 765 06ea B8BF     		it	lt
 766 06ec 1346     		movlt	r3, r2
 767 06ee 4FEA2323 		asr	r3, r3, #8
 768 06f2 7B62     		str	r3, [r7, #36]
 138:alpha_time.c  **** 	dst_g[1]/=256;
 769              		.loc 1 138 0 discriminator 2
 770 06f4 BB6A     		ldr	r3, [r7, #40]
 771 06f6 03F1FF02 		add	r2, r3, #255
 772 06fa 002B     		cmp	r3, #0
 773 06fc B8BF     		it	lt
 774 06fe 1346     		movlt	r3, r2
 775 0700 4FEA2323 		asr	r3, r3, #8
 776 0704 BB62     		str	r3, [r7, #40]
 139:alpha_time.c  **** 	dst_g[2]/=256;
 777              		.loc 1 139 0 discriminator 2
 778 0706 FB6A     		ldr	r3, [r7, #44]
 779 0708 03F1FF02 		add	r2, r3, #255
 780 070c 002B     		cmp	r3, #0
 781 070e B8BF     		it	lt
 782 0710 1346     		movlt	r3, r2
 783 0712 4FEA2323 		asr	r3, r3, #8
 784 0716 FB62     		str	r3, [r7, #44]
 140:alpha_time.c  **** 	dst_g[3]/=256;
 785              		.loc 1 140 0 discriminator 2
 786 0718 3B6B     		ldr	r3, [r7, #48]
 787 071a 03F1FF02 		add	r2, r3, #255
 788 071e 002B     		cmp	r3, #0
 789 0720 B8BF     		it	lt
 790 0722 1346     		movlt	r3, r2
 791 0724 4FEA2323 		asr	r3, r3, #8
 792 0728 3B63     		str	r3, [r7, #48]
 141:alpha_time.c  **** 
 142:alpha_time.c  **** 	dst_b[0]/=256;
 793              		.loc 1 142 0 discriminator 2
 794 072a 7B69     		ldr	r3, [r7, #20]
 795 072c 03F1FF02 		add	r2, r3, #255
 796 0730 002B     		cmp	r3, #0
 797 0732 B8BF     		it	lt
 798 0734 1346     		movlt	r3, r2
 799 0736 4FEA2323 		asr	r3, r3, #8
 800 073a 7B61     		str	r3, [r7, #20]
 143:alpha_time.c  **** 	dst_b[1]/=256;
 801              		.loc 1 143 0 discriminator 2
 802 073c BB69     		ldr	r3, [r7, #24]
 803 073e 03F1FF02 		add	r2, r3, #255
 804 0742 002B     		cmp	r3, #0
 805 0744 B8BF     		it	lt
 806 0746 1346     		movlt	r3, r2
 807 0748 4FEA2323 		asr	r3, r3, #8
 808 074c BB61     		str	r3, [r7, #24]
 144:alpha_time.c  **** 	dst_b[2]/=256;
 809              		.loc 1 144 0 discriminator 2
 810 074e FB69     		ldr	r3, [r7, #28]
 811 0750 03F1FF02 		add	r2, r3, #255
 812 0754 002B     		cmp	r3, #0
 813 0756 B8BF     		it	lt
 814 0758 1346     		movlt	r3, r2
 815 075a 4FEA2323 		asr	r3, r3, #8
 816 075e FB61     		str	r3, [r7, #28]
 145:alpha_time.c  **** 	dst_b[3]/=256;
 817              		.loc 1 145 0 discriminator 2
 818 0760 3B6A     		ldr	r3, [r7, #32]
 819 0762 03F1FF02 		add	r2, r3, #255
 820 0766 002B     		cmp	r3, #0
 821 0768 B8BF     		it	lt
 822 076a 1346     		movlt	r3, r2
 823 076c 4FEA2323 		asr	r3, r3, #8
 824 0770 3B62     		str	r3, [r7, #32]
 146:alpha_time.c  **** 
 147:alpha_time.c  **** 	
 148:alpha_time.c  **** 	dstImage[(4*x+0)]= 0xff000000 |
 825              		.loc 1 148 0 discriminator 2
 826 0772 D7F8C430 		ldr	r3, [r7, #196]
 827 0776 4FEA0313 		lsl	r3, r3, #4
 828 077a 7A68     		ldr	r2, [r7, #4]
 829 077c D218     		adds	r2, r2, r3
 149:alpha_time.c  ****                               (0x00ff0000 & (dst_r[0] << 16)) |
 830              		.loc 1 149 0 discriminator 2
 831 077e 7B6B     		ldr	r3, [r7, #52]
 832 0780 4FEA0343 		lsl	r3, r3, #16
 833 0784 03F47F01 		and	r1, r3, #16711680
 150:alpha_time.c  ****                               (0x0000ff00 & (dst_g[0] << 8)) |
 834              		.loc 1 150 0 discriminator 2
 835 0788 7B6A     		ldr	r3, [r7, #36]
 836 078a 4FEA0323 		lsl	r3, r3, #8
 149:alpha_time.c  ****                               (0x00ff0000 & (dst_r[0] << 16)) |
 837              		.loc 1 149 0 discriminator 2
 838 078e 4FEA0343 		lsl	r3, r3, #16
 839 0792 4FEA1343 		lsr	r3, r3, #16
 840 0796 1943     		orrs	r1, r1, r3
 151:alpha_time.c  ****                               (0x000000ff & (dst_b[0]));
 841              		.loc 1 151 0 discriminator 2
 842 0798 7B69     		ldr	r3, [r7, #20]
 150:alpha_time.c  ****                               (0x0000ff00 & (dst_g[0] << 8)) |
 843              		.loc 1 150 0 discriminator 2
 844 079a DBB2     		uxtb	r3, r3
 845 079c 0B43     		orrs	r3, r3, r1
 846 079e 43F07F43 		orr	r3, r3, #-16777216
 148:alpha_time.c  **** 	dstImage[(4*x+0)]= 0xff000000 |
 847              		.loc 1 148 0 discriminator 2
 848 07a2 1360     		str	r3, [r2, #0]
 152:alpha_time.c  **** 	dstImage[(4*x+1)]=0xff000000 |
 849              		.loc 1 152 0 discriminator 2
 850 07a4 D7F8C430 		ldr	r3, [r7, #196]
 851 07a8 4FEA0313 		lsl	r3, r3, #4
 852 07ac 03F10403 		add	r3, r3, #4
 853 07b0 7A68     		ldr	r2, [r7, #4]
 854 07b2 D218     		adds	r2, r2, r3
 153:alpha_time.c  ****                               (0x00ff0000 & (dst_r[1] << 16)) |
 855              		.loc 1 153 0 discriminator 2
 856 07b4 BB6B     		ldr	r3, [r7, #56]
 857 07b6 4FEA0343 		lsl	r3, r3, #16
 858 07ba 03F47F01 		and	r1, r3, #16711680
 154:alpha_time.c  ****                               (0x0000ff00 & (dst_g[1] << 8)) |
 859              		.loc 1 154 0 discriminator 2
 860 07be BB6A     		ldr	r3, [r7, #40]
 861 07c0 4FEA0323 		lsl	r3, r3, #8
 153:alpha_time.c  ****                               (0x00ff0000 & (dst_r[1] << 16)) |
 862              		.loc 1 153 0 discriminator 2
 863 07c4 4FEA0343 		lsl	r3, r3, #16
 864 07c8 4FEA1343 		lsr	r3, r3, #16
 865 07cc 1943     		orrs	r1, r1, r3
 155:alpha_time.c  ****                               (0x000000ff & (dst_b[1]));
 866              		.loc 1 155 0 discriminator 2
 867 07ce BB69     		ldr	r3, [r7, #24]
 154:alpha_time.c  ****                               (0x0000ff00 & (dst_g[1] << 8)) |
 868              		.loc 1 154 0 discriminator 2
 869 07d0 DBB2     		uxtb	r3, r3
 870 07d2 0B43     		orrs	r3, r3, r1
 871 07d4 43F07F43 		orr	r3, r3, #-16777216
 152:alpha_time.c  **** 	dstImage[(4*x+1)]=0xff000000 |
 872              		.loc 1 152 0 discriminator 2
 873 07d8 1360     		str	r3, [r2, #0]
 156:alpha_time.c  ****         dstImage[(4*x+2)]=0xff000000 |
 874              		.loc 1 156 0 discriminator 2
 875 07da D7F8C430 		ldr	r3, [r7, #196]
 876 07de 4FEA0313 		lsl	r3, r3, #4
 877 07e2 03F10803 		add	r3, r3, #8
 878 07e6 7A68     		ldr	r2, [r7, #4]
 879 07e8 D218     		adds	r2, r2, r3
 157:alpha_time.c  ****                               (0x00ff0000 & (dst_r[2] << 16)) |
 880              		.loc 1 157 0 discriminator 2
 881 07ea FB6B     		ldr	r3, [r7, #60]
 882 07ec 4FEA0343 		lsl	r3, r3, #16
 883 07f0 03F47F01 		and	r1, r3, #16711680
 158:alpha_time.c  ****                               (0x0000ff00 & (dst_g[2] << 8)) |
 884              		.loc 1 158 0 discriminator 2
 885 07f4 FB6A     		ldr	r3, [r7, #44]
 886 07f6 4FEA0323 		lsl	r3, r3, #8
 157:alpha_time.c  ****                               (0x00ff0000 & (dst_r[2] << 16)) |
 887              		.loc 1 157 0 discriminator 2
 888 07fa 4FEA0343 		lsl	r3, r3, #16
 889 07fe 4FEA1343 		lsr	r3, r3, #16
 890 0802 1943     		orrs	r1, r1, r3
 159:alpha_time.c  ****                               (0x000000ff & (dst_b[2]));
 891              		.loc 1 159 0 discriminator 2
 892 0804 FB69     		ldr	r3, [r7, #28]
 158:alpha_time.c  ****                               (0x0000ff00 & (dst_g[2] << 8)) |
 893              		.loc 1 158 0 discriminator 2
 894 0806 DBB2     		uxtb	r3, r3
 895 0808 0B43     		orrs	r3, r3, r1
 896 080a 43F07F43 		orr	r3, r3, #-16777216
 156:alpha_time.c  ****         dstImage[(4*x+2)]=0xff000000 |
 897              		.loc 1 156 0 discriminator 2
 898 080e 1360     		str	r3, [r2, #0]
 160:alpha_time.c  ****         dstImage[(4*x+3)]=0xff000000 |
 899              		.loc 1 160 0 discriminator 2
 900 0810 D7F8C430 		ldr	r3, [r7, #196]
 901 0814 4FEA0313 		lsl	r3, r3, #4
 902 0818 03F10C03 		add	r3, r3, #12
 903 081c 7A68     		ldr	r2, [r7, #4]
 904 081e D218     		adds	r2, r2, r3
 161:alpha_time.c  ****                               (0x00ff0000 & (dst_r[3] << 16)) |
 905              		.loc 1 161 0 discriminator 2
 906 0820 3B6C     		ldr	r3, [r7, #64]
 907 0822 4FEA0343 		lsl	r3, r3, #16
 908 0826 03F47F01 		and	r1, r3, #16711680
 162:alpha_time.c  ****                               (0x0000ff00 & (dst_g[3] << 8)) |
 909              		.loc 1 162 0 discriminator 2
 910 082a 3B6B     		ldr	r3, [r7, #48]
 911 082c 4FEA0323 		lsl	r3, r3, #8
 161:alpha_time.c  ****                               (0x00ff0000 & (dst_r[3] << 16)) |
 912              		.loc 1 161 0 discriminator 2
 913 0830 4FEA0343 		lsl	r3, r3, #16
 914 0834 4FEA1343 		lsr	r3, r3, #16
 915 0838 1943     		orrs	r1, r1, r3
 163:alpha_time.c  ****                               (0x000000ff & (dst_b[3]));
 916              		.loc 1 163 0 discriminator 2
 917 083a 3B6A     		ldr	r3, [r7, #32]
 162:alpha_time.c  ****                               (0x0000ff00 & (dst_g[3] << 8)) |
 918              		.loc 1 162 0 discriminator 2
 919 083c DBB2     		uxtb	r3, r3
 920 083e 0B43     		orrs	r3, r3, r1
 921 0840 43F07F43 		orr	r3, r3, #-16777216
 160:alpha_time.c  ****         dstImage[(4*x+3)]=0xff000000 |
 922              		.loc 1 160 0 discriminator 2
 923 0844 1360     		str	r3, [r2, #0]
  73:alpha_time.c  ****  for(x=0; x<65536; x++)
 924              		.loc 1 73 0 discriminator 2
 925 0846 D7F8C430 		ldr	r3, [r7, #196]
 926 084a 03F10103 		add	r3, r3, #1
 927 084e C7F8C430 		str	r3, [r7, #196]
 928              	.L11:
  73:alpha_time.c  ****  for(x=0; x<65536; x++)
 929              		.loc 1 73 0 is_stmt 0 discriminator 1
 930 0852 D7F8C420 		ldr	r2, [r7, #196]
 931 0856 4FF6FF73 		movw	r3, #65535
 932 085a 9A42     		cmp	r2, r3
 933 085c 7FF705AD 		ble	.L12
 164:alpha_time.c  **** 
 165:alpha_time.c  **** 
 166:alpha_time.c  **** }
 167:alpha_time.c  **** 
 168:alpha_time.c  **** }
 934              		.loc 1 168 0 is_stmt 1
 935 0860 07F1CC07 		add	r7, r7, #204
 936 0864 BD46     		mov	sp, r7
 937 0866 80BC     		pop	{r7}
 938 0868 7047     		bx	lr
 939              		.cfi_endproc
 940              	.LFE1:
 942              	.Letext0:
 943              		.file 2 "/usr/lib/gcc/arm-linux-gnueabihf/4.6/include/stddef.h"
 944              		.file 3 "/usr/include/arm-linux-gnueabihf/bits/types.h"
 945              		.file 4 "/usr/include/stdio.h"
 946              		.file 5 "/usr/include/libio.h"
 947              		.file 6 "/usr/include/arm-linux-gnueabihf/bits/time.h"
