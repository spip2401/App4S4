close all;
clear all;
clc;
%% correlation
[t1, f1] = audioread('TramesAReconnaitre\trame1.wav');
[t2, f2] = audioread('TramesAReconnaitre\trame2.wav');
[t3, f3] = audioread('TramesAReconnaitre\trame3.wav');

[s1, fe] = audioread('SonsACompresser\son1.wav');
[s2, fe] = audioread('SonsACompresser\son2.wav');
[s3, fe] = audioread('SonsACompresser\son3.wav');

%correlation de tous les son sur la premi�re trame ( possibilit� de looper
%mais fukit)
C1 = xcorr(t1,s1);
C12= xcorr(t1,s2);
C13= xcorr(t1,s3);
L1 = length(t1);
k1 = - (L1-1) : (L1-1);

subplot(6,1,4);
plot(t1) 
title('trame 1');

subplot(6,1,5);
plot(t2) 
title('trame 2');

subplot(6,1,6);
plot(t3) 
title('trame 3');

ht1 = ones(1,L1)/L1;
abst1 = abs(t1);
envt1 = conv(abst1,ht1);


figure(3);
subplot(3,1,1)
hold on;
plot(k1,C1);
plot(k1,C12);
plot(k1,C13);
hold off;
title('Fonction de correlation croisee entre la trame 1 et les sons donn� non compress�*')
xlabel('Decalage k')

%trame 2
C1 = xcorr(t2,s1);
C12= xcorr(t2,s2);
C13= xcorr(t2,s3);
L1 = length(t2);
k1 = - (L1-1) : (L1-1);
subplot(3,1,2)
hold on;
plot(k1,C1);
plot(k1,C12);
plot(k1,C13);
hold off;
title('Fonction de correlation croisee entre la trame 2 et les sons donn� non compress�*')
xlabel('Decalage k')

%trame 2
C1 = xcorr(t3,s1);
C12= xcorr(t3,s2);
C13= xcorr(t3,s3);
L1 = length(t3);
k1 = - (L1-1) : (L1-1);
subplot(3,1,3)
hold on;
plot(k1,C1);
plot(k1,C12);
plot(k1,C13);
hold off;
title('Fonction de correlation croisee entre la trame 3 et les sons donn� non compress�*')
xlabel('Decalage k')