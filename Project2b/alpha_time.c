void alphaBlend_c(int * __restrict__ fgImage, int * __restrict__ bgImage, int * __restrict__ dstImage);

#include <stdio.h>
#include <sys/time.h>

int backImage[512 * 512];
int foreImage[512 * 512];
int newImage[512 * 512];

int main(int argc, char**argv)
{
   FILE *fgFile, *bgFile, *outFile;
   int result, min=1234567890, time, i;
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
     for(i=0; i<500; i++){
     gettimeofday(&oldTv, NULL);

     alphaBlend_c(&foreImage[0], &backImage[0], &newImage[0]);
    // alphaBlend_c();
     gettimeofday(&newTv, NULL);
     time = newTv.tv_sec*1000000 + newTv.tv_usec - oldTv.tv_sec*1000000 - oldTv.tv_usec;
     if(time<min){
	min = time;
}
}
     fprintf(stdout, "Routine took minimum time of %d microseconds\n",min);
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

void alphaBlend_c(int * __restrict__ fgImage, int *__restrict__ bgImage, int * __restrict__ dstImage)
{
  int x;//, y[512*512];
 /* int a[4]={1, 2, 3, 4};
  int b[4]={1, 2, 3, 4};
  int c[4]={0, 0, 0, 0};
  for(x=0; x<4; x++){
	c[x]=a[x]*b[x];
}*/

int a_fg[4], comp_a_fg[4], fg_r[4], fg_g[4], fg_b[4], bg_r[4], bg_g[4], bg_b[4], dst_r[4], dst_g[4], dst_b[4];
 for(x=0; x<65536; x++)
{
	 a_fg[0] = A(fgImage[(4*x+0)]);
	 a_fg[1] = A(fgImage[(4*x+1)]);
	 a_fg[2] = A(fgImage[(4*x+2)]);
	 a_fg[3] = A(fgImage[(4*x+3)]);

	comp_a_fg[0]=255-a_fg[0];
        comp_a_fg[1]=255-a_fg[1];
        comp_a_fg[2]=255-a_fg[2];
        comp_a_fg[3]=255-a_fg[3];

	fg_r[0]=R(fgImage[(4*x+0)]);
	fg_r[1]=R(fgImage[(4*x+1)]);
	fg_r[2]=R(fgImage[(4*x+2)]);
	fg_r[3]=R(fgImage[(4*x+3)]);
	
	bg_r[0]=R(bgImage[(4*x+0)]);
	bg_r[1]=R(bgImage[(4*x+1)]);
	bg_r[2]=R(bgImage[(4*x+2)]);
	bg_r[3]=R(bgImage[(4*x+3)]);


	fg_g[0]=G(fgImage[(4*x+0)]);
	fg_g[1]=G(fgImage[(4*x+1)]);
	fg_g[2]=G(fgImage[(4*x+2)]);
	fg_g[3]=G(fgImage[(4*x+3)]);
	
	bg_g[0]=G(bgImage[(4*x+0)]);
	bg_g[1]=G(bgImage[(4*x+1)]);
	bg_g[2]=G(bgImage[(4*x+2)]);
	bg_g[3]=G(bgImage[(4*x+3)]);

	fg_b[0]=B(fgImage[(4*x+0)]);
	fg_b[1]=B(fgImage[(4*x+1)]);
	fg_b[2]=B(fgImage[(4*x+2)]);
	fg_b[3]=B(fgImage[(4*x+3)]);
	
	bg_b[0]=B(bgImage[(4*x+0)]);
	bg_b[1]=B(bgImage[(4*x+1)]);
	bg_b[2]=B(bgImage[(4*x+2)]);
	bg_b[3]=B(bgImage[(4*x+3)]);

	dst_r[0]= (fg_r[0]*a_fg[0])+(bg_r[0]*comp_a_fg[0]);
	 dst_r[1]= (fg_r[1]*a_fg[1])+(bg_r[1]*comp_a_fg[1]);
	 dst_r[2]= (fg_r[2]*a_fg[2])+(bg_r[2]*comp_a_fg[2]);
	 dst_r[3]= (fg_r[3]*a_fg[3])+(bg_r[3]*comp_a_fg[3]);

	dst_g[0]= (fg_g[0]*a_fg[0])+(bg_g[0]*comp_a_fg[0]);
	 dst_g[1]= (fg_g[1]*a_fg[1])+(bg_g[1]*comp_a_fg[1]);
	 dst_g[2]= (fg_g[2]*a_fg[2])+(bg_g[2]*comp_a_fg[2]);
	 dst_g[3]= (fg_g[3]*a_fg[3])+(bg_g[3]*comp_a_fg[3]);

	dst_b[0]= (fg_b[0]*a_fg[0])+(bg_b[0]*comp_a_fg[0]);
	 dst_b[1]= (fg_b[1]*a_fg[1])+(bg_b[1]*comp_a_fg[1]);
	 dst_b[2]= (fg_b[2]*a_fg[2])+(bg_b[2]*comp_a_fg[2]);
	 dst_b[3]= (fg_b[3]*a_fg[3])+(bg_b[3]*comp_a_fg[3]);


	dst_r[0]/=256;
	dst_r[1]/=256;
	dst_r[2]/=256;
	dst_r[3]/=256;
	
	dst_g[0]/=256;
	dst_g[1]/=256;
	dst_g[2]/=256;
	dst_g[3]/=256;

	dst_b[0]/=256;
	dst_b[1]/=256;
	dst_b[2]/=256;
	dst_b[3]/=256;

	
	dstImage[(4*x+0)]= 0xff000000 |
                              (0x00ff0000 & (dst_r[0] << 16)) |
                              (0x0000ff00 & (dst_g[0] << 8)) |
                              (0x000000ff & (dst_b[0]));
	dstImage[(4*x+1)]=0xff000000 |
                              (0x00ff0000 & (dst_r[1] << 16)) |
                              (0x0000ff00 & (dst_g[1] << 8)) |
                              (0x000000ff & (dst_b[1]));
        dstImage[(4*x+2)]=0xff000000 |
                              (0x00ff0000 & (dst_r[2] << 16)) |
                              (0x0000ff00 & (dst_g[2] << 8)) |
                              (0x000000ff & (dst_b[2]));
        dstImage[(4*x+3)]=0xff000000 |
                              (0x00ff0000 & (dst_r[3] << 16)) |
                              (0x0000ff00 & (dst_g[3] << 8)) |
                              (0x000000ff & (dst_b[3]));


}

}
/*for(x=0; x<512*512; x++){
  //for(y = 0; y < 512; y++){
    // for(x = 0; x < 512; x++){  Remove */
        /*int a_fg = A(fgImage[(y*512)+x]);
        int dst_r = ((R(fgImage[(y*512)+x]) * a_fg) + (R(bgImage[(y*512)+x]) * (255-a_fg)))/256;
        int dst_g = ((G(fgImage[(y*512)+x]) * a_fg) + (G(bgImage[(y*512)+x]) * (255-a_fg)))/256;
        int dst_b = ((B(fgImage[(y*512)+x]) * a_fg) + (B(bgImage[(y*512)+x]) * (255-a_fg)))/256;
        dstImage[(y*512)+x] =  0xff000000 |
                              (0x00ff0000 & (dst_r << 16)) |
                              (0x0000ff00 & (dst_g << 8)) |
                              (0x000000ff & (dst_b));*/
        
/* Remove
        int a_fg = A(foreImage[x]); //A(fgImage[x]);
	int a_fg_comp = 255-a_fg;
	int fImage_fetch = foreImage[x];// fgImage[x];
	int bImage_fetch = backImage[x]; // bgImage[x];
//	y[x]=R(fgImage[x])+R(bgImage[x]);
	int dst_r = ((R(fImage_fetch) * a_fg) + (R(bImage_fetch) * a_fg_comp))/256; 
        int dst_g = ((G(fImage_fetch) * a_fg) + (G(bImage_fetch) * a_fg_comp))/256;
        int dst_b = ((B(fImage_fetch) * a_fg) + (B(bImage_fetch) * a_fg_comp))/256; Remove */
        /*dstImage[x]*//*Remove  newImage[x] =  0xff000000 |
                              (0x00ff0000 & (dst_r << 16)) |
                              (0x0000ff00 & (dst_g << 8)) |
                              (0x000000ff & (dst_b));
  
      
     //}
  //}
  
  } Remove*/
//}
