#include<iostream>
#include <omp.h>
#include <WinAPI>

using namespace std;

int main(int argc, char const *argv[])
{
    int number = 0;

    #pragma omp parallel for private(number)
    for (size_t i = 0; i < 10; i++)
    {
        cout << GetTime();
    }

    cout << number;
    
    return 0;
}