void alphaBlend_c(int *fgImage, int *bgImage, int *dstImage);

#include <stdio.h>
#include <sys/time.h>
#include <arm_neon.h>
#include <arm_acle.h>

int backImage[512 * 512];
int foreImage[512 * 512];
int newImage[512 * 512];

int main(int argc, char**argv)
{
   FILE *fgFile, *bgFile, *outFile;
   int result;
   struct timeval oldTv, newTv;

   if(argc != 4){
      fprintf(stderr, "Usage:%s foreground background outFile\n",argv[0]);
      return 1;
   }
   fgFile = fopen(argv[1], "rb");
   bgFile = fopen(argv[2], "rb");
   outFile = fopen(argv[3], "wb");

   if(fgFile && bgFile && outFile){
     result = fread(backImage, 512*sizeof(int), 512, bgFile);
     if(result != 512){
       fprintf(stderr, "Error with backImage\n");
       return 3;
     }
     result = fread(foreImage, 512*sizeof(int), 512, fgFile);
     if(result != 512){
       fprintf(stderr, "Error with foreImage\n");
       return 4;
     }
     gettimeofday(&oldTv, NULL);
     alphaBlend_c(&foreImage[0], &backImage[0], &newImage[0]);
     gettimeofday(&newTv, NULL);
     fprintf(stdout, "Routine took %d microseconds\n", (int)(newTv.tv_usec - oldTv.tv_usec));
     fwrite(newImage, 512*sizeof(int),512,outFile);
     fclose(fgFile);
     fclose(bgFile);
     fclose(outFile);
     return 0;
   }
   fprintf(stderr, "Problem opening a file\n");
   return 2;
}

#define A(x) (((x) & 0xff000000) >> 24)
#define R(x) (((x) & 0x00ff0000) >> 16)
#define G(x) (((x) & 0x0000ff00) >> 8)
#define B(x) ((x) & 0x000000ff)

void alphaBlend_c(int *fgImage, int *bgImage, int *dstImage)
{
  int x;/*
  for(y = 0; y < 512; y++){
     for(x = 0; x < 512; x++){
        int a_fg = A(fgImage[(y*512)+x]);
        int dst_r = ((R(fgImage[(y*512)+x]) * a_fg) + (R(bgImage[(y*512)+x]) * (255-a_fg)))/256;
        int dst_g = ((G(fgImage[(y*512)+x]) * a_fg) + (G(bgImage[(y*512)+x]) * (255-a_fg)))/256;
        int dst_b = ((B(fgImage[(y*512)+x]) * a_fg) + (B(bgImage[(y*512)+x]) * (255-a_fg)))/256;
        dstImage[(y*512)+x] =  0xff000000 |
                              (0x00ff0000 & (dst_r << 16)) |
                              (0x0000ff00 & (dst_g << 8)) |
                              (0x000000ff & (dst_b));
     }
  }
  */
  
  	  uint8x8x4_t fg_rgb;		//loading foreground image 8 pixels at a time
	  uint8x8x4_t bg_rgb;		//loading background image 8 pixels at a time
	  uint8x8_t const_25 = vdup_n_u8 ((uint8_t)255);		//loading a double reister to hold 8 elements of value 255 for taking the complement of the alpha
	  uint16x8_t temp;
	  uint8x8_t temp_subpixel;
	  uint8x8x4_t result;					//interleaved destination register
	  result.val[3]=const_255;			//first byte of dest image is 255
  for(x=0; x< (512*512/8); x+=8)
  {	
      fg_rgb = vld4_u8((const uint8_t *)&fgImage[x]);
      bg_rgb = vld4_u8((const uint8_t *)&bgImage[x]);
	  const_255 = vsub_u8(const_255,fg_rgb.val[3]);
	  
	  //Calculation for red
	temp = vmull_u8 (fg_rgb.val[0], fg_rgb.val[3]);	  //multiply the foreground subpixel by alpha
    temp = vmlal_u8 (temp,bg_rgb.val[0], const_255);	//multiply the background subpixel by (255-alpha)
	temp_subpixel = vshrn_n_u16 (temp, 8);						//divide by 256
	result.val[0]=temp_subpixel;
	
	//Calculation for green
	temp = vmull_u8 (fg_rgb.val[1], fg_rgb.val[3]);	  //multiply the foreground subpixel by alpha
    temp = vmlal_u8 (temp,bg_rgb.val[1], const_255);	//multiply the background subpixel by (255-alpha)
	temp_subpixel = vshrn_n_u16 (temp, 8);						//divide by 256
	result.val[1]=temp_subpixel;
	
	//Calculation for blue
	temp = vmull_u8 (fg_rgb.val[2], fg_rgb.val[3]);	  //multiply the foreground subpixel by alpha
    temp = vmlal_u8 (temp,bg_rgb.val[2], const_255);	//multiply the background subpixel by (255-alpha)
	temp_subpixel = vshrn_n_u16 (temp, 8);						//divide by 256
	result.val[2]=temp_subpixel;
	
	vst4_u8 ((uint8_t *)&dstImage[x], result);				//send the data back to the destination array    	  
  }
}
