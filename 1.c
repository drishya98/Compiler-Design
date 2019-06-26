#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int main(){
FILE *fp;
int o, c, s, i, j, l=0, sc;
char line[100];
fp=fopen("1.txt", "r");
if(fp==NULL){
printf("File can't be opened\n");
exit(0);
}
printf("File opened\n");
while(fgets(line, sizeof(line), fp)!=NULL){
l++;
s=0, o=0, c=0, sc=0, j=0;
for(i=0;i<strlen(line);i++){
if(o==0 && i>j && line[i]=='\''){
if((i+2)<strlen(line) && line[i+2]=='\'')
printf("Valid char constant in line no: %d\n", l);
else
printf("Unterminated char constant in line no: %d\n", l);
j=i+2;
}
if(line[i]=='"'){
s=1;
if(o==1 && c==0) c=1;
else if(o==0 && c==0) o=1;
else if(o==1 && c==1) c=0;
}
}
if(o==1 && c==0){
printf("Unterminated string in line no: %d\n", l);
sc=1;
}
if(s==1 && sc==0)
printf("String usage in line no: %d validated\n", l);
}
return 0;
}
