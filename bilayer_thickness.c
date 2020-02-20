#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>

double distance[128]; // declaring global variable to calc distance 

int main(){
	int i;
	double x[128],y[128],z[128];
	FILE* f1 = fopen("dopc_P_coordinates.dat","r");//opening file
	FILE* t1=fopen("distance.dat", "w");
        for(i=1;i<=128;i++){
		fscanf(f1,"%lf %lf %lf\n",&x[i],&y[i],&z[i]);
	//	printf("%lf %lf %lf\n",x[i],y[i],z[i]);
	}	//reading coordinates

	// taking distance as modulous z coordiante
	
       for(i=1;i<=128;i++){
	       double n = z[i];
	      // printf("%lf \n",n);
	      if(n<0) n = n*(-1);
                distance[i] = n; 
		fprintf(t1,"%lf\n", distance[i]);
        }  	

	//closing file
	fclose(f1);
	fclose(t1);

	return 0;
}
