#include<iostream>
#include <omp.h>

using namespace std;

// firstprivate - сохраняет значение переменной до входа в параллельную область
int main(int argc, char const *argv[])
{
    int i=121;

    #pragma omp parallel firstprivate(i)
    {
        printf("i = %d\n", i);
    }

    return 0;
}