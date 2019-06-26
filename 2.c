#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main(){
FILE *fp;
int s, e, o=0, l=0, cc=0;
char line[100];
fp=fopen("2.txt", "r");
if(fp==NULL){
printf("Can't open file\n");
exit(0);
}
printf("File opened\n");
while(fgets(line, sizeof(line), fp)!=NULL){
l++;
if(o==1)
printf("%s", line);
else if(strstr(line, "//"))
printf("\nSingle line comment in line no: %d\n", l);
if(strstr(line, "/*") && o==0){
o=1;
s=l;
printf("%s", line);
}
if(strstr(line, "*/") && o==1){
o=0;
e=l;
printf("\nValid multi-line comment from line %d to %d\n", s, e);
}
}
if(o==1)
printf("\nUnterminated comment in line %d\n", s);
return 0;
}
