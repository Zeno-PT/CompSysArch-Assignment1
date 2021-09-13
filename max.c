#include <stdio.h>
#include <time.h>
#include <math.h>

int max1(int a, int b)
{
    return (a > b) ? a : b;
}
int max2(int a, int b)
{
    int isaGTb = a > b;
    int max;
    if (isaGTb)
        max = a;
    else
        max = b;
    return max;
}

int testMax(int a, int b, int c)
{
    int i = max1(a, b);
    int j = max1(a, c);
    return i-j;
}

int sub(int a, int b)
{
    return a - b;
}

void restricted()
{
    int a = 10;
    char b = 'a';
    char c = 'c';
    int d = 8;
}

int main()
{
    int a = 3;
    int b = 5;
    int c;
    int time = pow(600, 3);
    clock_t start = clock();
    for (int i = 0; i < time; i++)
    {
        c = max1(a, b);
    }
    clock_t stop = clock();
    double s = (double)(stop - start) / CLOCKS_PER_SEC;
    printf("Total CPU time: %lf", s);
}