function [out,z_B2,zn2,zdis,yn1,yb1] = FM_demod(x,B1,N1,B2,N2,fs)
simpleSA(x,2^14,2400);
discrim(x);
N1=10;
N2=50;
fs1=fs/N1;
fs2=fs/N2;
fc=101500000;
[b,a]=butter(6,B1/(fs/2));
yb1=filter(b,a,x);
yn1=decimate(yb1,10);
simpleSA(yn1,2^14,fs);
zdis=discrim(yn1);
simpleSA(zdis,2^14,fs);
[b,a]=butter(6,B2/(fs1/2));
zb2=filter(b,a,zdis);
zn2=decimate(zdis,5);
sound(zn2,48000);
pause(10);
tau = 0.00005; %time constant for EU region
f3 = 1/(2*pi*tau);
a1 = exp(-(2*pi*f3/fs));
a=[1,-a1];
b=1-a1;
out = filter(b,a,zn2);
sound(out,48000);
end

  