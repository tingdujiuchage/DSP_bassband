%HDB3.m
function HDB3=HDB3_Code(x)
m=length(x);
%初始化HDB3编码
HDB3=zeros(1,m);
%初始化信息“1”标志B和连0数标志V
B=-1;
V=-1;
i=1;
while (i<=m-3)
 %若原码为1，交替为＋1，－1
 if(x(i)==1)
 HDB3(i)=-1*B;
 B=HDB3(i);
 i=i+1;
 else
 %原码只有一个0
 if(x(i+1)==1)
 HDB3(i)=0;
 HDB3(i+1)=-1*B;
 B=HDB3(i+1);
 i=i+2;
 else
 %原码有两个连续0
 if(x(i+2)==1)
 HDB3(i)=0;
 HDB3(i+1)=0;
 HDB3(i+2)=-1*B;
 B=HDB3(i+2);
 i=i+3;
 else
 %原码有三个连续0
 if(x(i+2)==1)
 HDB3(i)=0;
 HDB3(i+1)=0;
 HDB3(i+2)=0;
 HDB3(i+3)=-1*B;
 B=HDB3(i+3);
 i=i+4;
 %原码出现了四个连续0 
 else
 %原始B、V标志不相同
 if(xor(B,V))
 HDB3(i)=01;
 HDB3(i+1)=0;
 HDB3(i+2)=0;
 HDB3(i+3)=B;
 V=B;i=i+4;
 %B、V标志相同 
 else
 HDB3(i)=-1*B;
 HDB3(i+1)=0;
 HDB3(i+2)=0;
 HDB3(i+3)=-1*B;
 B=-1*B;V=B;i=i+4;
 end
 end
 end
 end
 end
end
for j=i:m
 if (x(j)==1)
 HDB3(j)=-1*B;
 B=HDB3(j);
 else
 HDB3(j)=0;
 end
end
return;