#include <stdio.h>
int main(){
int value1 = 444;
int value2 = 295;
int result = (value1 << 4) & (value2 >> 4);
printf("%d\n", result);
return 0;
}