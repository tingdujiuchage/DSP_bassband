%Code.m
N=1000;
fs=8;
x=ceil(rand(1,N)-0.7);
AMI=AMI_Code(x);
HDB3=HDB3_Code(x);
y=zeros(1,N*fs);
x_t=zeros(1,N*fs);
y_AMI=zeros(1,N*fs);
y_HDB3=zeros(1,N*fs);
for i=1:N*fs
 if(mod(i-1,8)<=5 && mod(i-1,8)>=2)
 y(i)=1;
 else
 y(i)=0;
 end
 %分别给画图序列赋值

 y_AMI(i)=y(i)*AMI(ceil(i/8));
 y_HDB3(i)=y(i)*HDB3(ceil(i/8));
 x_t(i)=x(ceil(i/8));
end
figure(1)
subplot(3,1,1)
plot(x_t(1:20*8))
axis([1,20*8,-1.5,1.5]);
title('initial code')
subplot(3,1,2)
plot(y_AMI(1:20*8))
axis([1,20*8,-1.5,1.5]);
title('AMI code')
subplot(3,1,3)
plot(y_HDB3(1:20*8))
axis([1,20*8,-1.5,1.5]);
title('HDB3 code')


figure(2)
plot_spectrum(x_t,'b');
hold on 
plot_spectrum(y_AMI,'r');
plot_spectrum(y_HDB3,'g');

title('Power spectrum of AMI Code')
legend('NRZ','AMI','HDB3')
hold off

figure(3)
x3=ceil(rand(1,N)-0.3);
x5=ceil(rand(1,N)-0.5);
x8=ceil(rand(1,N)-0.8);
x9=ceil(rand(1,N)-0.9);
y_AMI3=zeros(1,N*fs);
y_AMI5=zeros(1,N*fs);
y_AMI8=zeros(1,N*fs);
y_AMI9=zeros(1,N*fs);
AMI3=AMI_Code(x3);
AMI5=AMI_Code(x5);
AMI8=AMI_Code(x8);
AMI9=AMI_Code(x9);
y=zeros(1,N*fs);
for i=1:N*fs
 if(mod(i-1,8)<=5 && mod(i-1,8)>=2)
 y(i)=1;
 else
 y(i)=0;
 end
y_AMI3(i)=y(i)*AMI3(ceil(i/8));
y_AMI5(i)=y(i)*AMI5(ceil(i/8));
y_AMI8(i)=y(i)*AMI8(ceil(i/8));
y_AMI9(i)=y(i)*AMI9(ceil(i/8));
end
subplot(2,2,1)
plot_spectrum(y_AMI3,'r');
subplot(2,2,2)
plot_spectrum(y_AMI5,'r');
subplot(2,2,3)
plot_spectrum(y_AMI8,'r');
subplot(2,2,4)
plot_spectrum(y_AMI9,'r');
