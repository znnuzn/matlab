clear all
close all
clc
dir='E:\fangsong 2'
a=textread([dir '.txt'],'%s')'
s=size(a,2);
for i=1:s
    data(i)=hex2dec(a{i});
end
s2=size(data,2)/29;
flag=1;
for i=1:29:(size(data,2)-29)
delta(flag)=65536*data(i)+256*data(i+1)+data(i+2);
Theta(flag)=65536*data(i+3)+256*data(i+4)+data(i+5);
LowAlpha(flag)=65536*data(i+6)+256*data(i+7)+data(i+8);
HighAlpha(flag)=65536*data(i+9)+256*data(i+10)+data(i+11);
LowbBeta(flag)=65536*data(i+12)+256*data(i+13)+data(i+14);
HighBeta(flag)=65536*data(i+15)+256*data(i+16)+data(i+17);
LowGamma(flag)=65536*data(i+18)+256*data(i+19)+data(i+20);
MiddleGamma(flag)=65536*data(i+21)+256*data(i+22)+data(i+23);
Attention(flag)=data(i+25);
Meditation(flag)=data(i+27);
flag=flag+1;
end

%wavelet
[d,a]=wavedec(Meditation,3,'sym5');
wd=appcoef(d,a,'sym5',3);
tempans2=waverec(d,a,'sym5');

figure
plot(wd,'r')
figure
hold on
plot(tempans2)