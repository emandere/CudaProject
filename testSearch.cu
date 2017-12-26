#include<ctime>
#include<iostream>
#include <cstdlib>
using namespace std;

#define BLOCK_SIZE 32

__global__ void gpuSum(int *prices,int *sumpricesout,int days,int seconds,int N)
{
    int currentday = blockIdx.x*blockDim.x + threadIdx.x;
    //if(currentday<days)
    //{
       int start = currentday * seconds;
       int end = start+seconds;
       sumpricesout[currentday]=end;
       for(int j=start;j<end;++j)
         sumpricesout[currentday]+=prices[j]; 
    //}
}
int main()
{
   int days = 32;
   int seconds = 1000;
   int N = days*seconds;
   
   int * prices = new int[days*seconds];
   int  * sumpricesout = new int[days];
   int sumprices;
   for(int i=0;i<N;i++)
   {
      prices[i]=rand()%100;  
   }
   
  
   for(int i=0;i<N;i=i+seconds)
   {
      sumprices=0;
      for(int j=i;j<i+seconds;j++)
         sumprices+=prices[j];
      cout<<sumprices<<endl;
   }
    
   long sizePrices = N * sizeof(int);
   long sizeSumPrices = days * sizeof(int); 
   int *dPrices,*dSumPrices;
    
   cudaMalloc(&dPrices,sizePrices);
   cudaMalloc(&dSumPrices,sizeSumPrices);
    
   cudaMemcpy(&dPrices,prices,N,cudaMemcpyHostToDevice); 
   cudaMemcpy(&dSumPrices,sumpricesout,days,cudaMemcpyHostToDevice); 
    
   gpuSum<<< 1,BLOCK_SIZE>>>(dPrices,dSumPrices,days,seconds,N);
   
   cudaMemcpy(sumpricesout,dSumPrices,days,cudaMemcpyDeviceToHost); 
   cout<<"CUDA!"<<endl;
   for(int i=0;i<days;i++)
   {
       cout<<sumpricesout[i]<<endl;
   }
   
   cudaFree(dPrices);
   cudaFree(dSumPrices); 
   return 0;
}
