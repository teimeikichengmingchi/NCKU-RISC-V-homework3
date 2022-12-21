#include <stdio.h>
#include <stdlib.h>

int main()
{
    int a[3] = {1, 2, 3};
    int b[6];
    int i;

    for(i=0; i<3; i++){
        b[i]=a[i];
        b[i+3]=a[i];
    }

    for(i=0; i<3*2; i++) {
        printf("%d ", b[i]);
    }
    return 0;
}
