#include <stdio.h>
int main(){
int value1 = 304;
int value2 = 497;
int result = (value1 << 4) ^ (value2 >> 4);
printf("%d\n", result);
return 0;
}