
#include<ctime>
#include<iostream>
void testrun(int matrix_size);
int main()
{
	const int matrix_size = 5000;

	std::clock_t start;
	double duration;

	for (int i = 0; i < 5000; i += 200)
	{
		start = std::clock();
		testrun(i);
	    duration = (std::clock() - start) / (double)CLOCKS_PER_SEC;
		std::cout <<i<< " " << duration <<"s"<< '\n';
	}
	
	return 0;
}

void testrun(int matrix_size)
{
	double ** a = new double*[matrix_size];//[matrix_size][matrix_size];
	double ** b = new double*[matrix_size];
	double ** c = new double*[matrix_size];



	/* Your algorithm here */




	for (int i = 0; i < matrix_size; ++i)
		a[i] = new double[matrix_size];

	for (int i = 0; i < matrix_size; ++i)
		b[i] = new double[matrix_size];

	for (int i = 0; i < matrix_size; ++i)
		c[i] = new double[matrix_size];
	//double b[matrix_size][matrix_size];
	//double c[matrix_size][matrix_size];



	for (int i = 0; i < matrix_size; i++)
	{
		for (int j = 0; j < matrix_size; j++)
		{
			a[i][j] = j;
			b[i][j] = j;
			c[i][j] = 0;
		}
	}

	for (int i = 0; i < matrix_size; i++)
	{
		for (int j = 0; j < matrix_size; j++)
		{
			for(int k =0;k<matrix_size;k++)
			{
				c[i][j] += a[i][k] * b[k][i];
			}
		}
	}

	/*for (int i = 0; i < matrix_size; i++)
	{
	for (int j = 0; j < matrix_size; j++)
	{
	//c[i][j] += a[i][j] * b[j][i];
	printf("%1f", c[i][j]);
	printf("%s", " ");
	}
	printf("%s", "\n");
	}*/
}


