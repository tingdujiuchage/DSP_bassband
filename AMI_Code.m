%AMI_Code.m
function AMI=AMI_Code(x)
m=length(x);
%初始化AMI编码
AMI=zeros(1,m);
%反转标志初始化
f=0;
for i=1:m
 %若原码为0，直接将AMI码置0
 if x(i)==0
 AMI(i)=0;
 %否则，使得AMI码交替为＋1，－1
 else
 f=xor(f,1);
 AMI(i)=2*f-1;
 end
end
return;