#include<iostream>
#include <omp.h>
#include <string>

using namespace std;

int main(int argc, char const *argv[])
{
    omp_set_dynamic(0); // запрет на динамическую установку количества потоков
    omp_set_num_threads(3); 
    int count = 0;

    cout << "thread static count: ";
    #pragma omp parallel 
    {
        int threadNumber = omp_get_thread_num();
        printf("thread-%d ", threadNumber);
        count--;
    }
    cout << endl;

    omp_set_dynamic(1); 
    omp_set_num_threads(10); 

    cout << "thread dynamic count: ";
    #pragma omp parallel 
    {
        int threadNumber = omp_get_thread_num();
        printf("thread-%d ", threadNumber);
        count++;
    }
    cout << endl << count<< endl;

    return 0;
}
