%plot_spectrum.m
function plot_spectrum(x,str)
P=pspectrum(x,8000,"power");
plot(10*log10(P(:,1)),str);
return; 
