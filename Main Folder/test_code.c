#include <stdio.h>
int main(){
 int orig = 0xef0b;
int insert = 0x00be;
int a = orig | (insert << 7);
printf("%d", a);
 
	return 0;
}