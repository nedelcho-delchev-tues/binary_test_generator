#include <stdio.h>
int main(){ 
	int orig = 0x123; 
	int num = 0x2342; 
	int result = orig & num; 
	printf("%d",result); 
	return 0;
}