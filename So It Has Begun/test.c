#include <stdio.h> 
int main(){ 
	int orig = 0x09a2; 
	int num = 0x3971; 
	int result = orig & num; 
	printf("%d",result); 
	return 0; 
}