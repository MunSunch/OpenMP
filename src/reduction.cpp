#include<iostream>
#include <omp.h>

using namespace std;

int main(int argc, char const *argv[])
{
    int count = 1;

    if(!omp_in_parallel()) {
        cout << "single"<< endl;;
    }

    #pragma omp parallel
    {
        if(omp_in_parallel()) {
            cout << "parallel ";
        }
    }
    return 0;
}
