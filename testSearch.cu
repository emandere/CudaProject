#include<ctime>
#include<iostream>
#include <cstdlib>
using namespace std;
int main()
{
   int days = 12;
   int seconds = 1000;
   int N = days*seconds;
   
   float * prices = new float[days*seconds];
   for(int i=0;i<N;i++)
   {
      prices[i]=rand()%100;  
   }
   
   int sumprices;
   for(int i=0;i<N;i=i+seconds)
   {
      sumprices=0;
      for(int j=0;j<i+seconds;j++)
         sumprices+=prices[j];
      cout<<sumprices<<endl;
   }
   
   return 0;
}
