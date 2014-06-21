#include <stdio.h>
int main(){
int value1 = 424;
int value2 = 370;
int result = (value1 << 3) | (value2 >> 3);
printf("%d\n", result);
return 0;
}