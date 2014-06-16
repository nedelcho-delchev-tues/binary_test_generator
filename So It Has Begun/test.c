#include <stdio.h> 
int main(){ 
	int orig = 0xe7de; 
	int num = 0xab3b; 
	int result = orig & num; 
	printf("%d",result); 
	return 0; 
}