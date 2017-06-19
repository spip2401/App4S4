close all;

%% ouverture des sons
[s1, fe] = audioread('SonsACompresser\son1.wav');
[s2, fe] = audioread('SonsACompresser\son2.wav');
[s3, fe] = audioread('SonsACompresser\son3.wav');

%% Calcul du pas de la fr�quence pour un spectre discret ainsi que de la plage de fr�quence (Nyquist theorem)
N = length(s1); %nb D'echantillons
df = fe/N;  %pas
freq = -fe/2:df:(fe/2 - df);    %plage de freq.

%% Filtre a moyenne mobile.
% L = 44100;
% h = ones(1,L)/L;
% 
% filteredS1 = conv(s1,h);
% plot(filteredS1);

%% Sinus des sons
figure;
subplot(3, 1, 1)
plot(s1,'r');
hold on
%plot(env1);

subplot(3, 1, 2)
plot(s2,'r');
hold on
%plot(env2);

subplot(3, 1, 3)
plot(s3,'r');
hold on 
%plot(env3);

%% FFT
amp1 = fft(s1,N);
amp2 = fft(s2,N);
amp3 = fft(s3,N);

ang1 = angle(amp1);
ang2 = angle(amp2);
ang3 = angle(amp3);

amp1 = abs(amp1);
amp2 = abs(amp2);
amp3 = abs(amp3);

ampl_Max1 = max(amp1);
ampl_Max2 = max(amp2);
ampl_Max3 = max(amp3);

pks1 = findpeaks(amp1, 'MinPeakProminence', 2.7,'MinPeakDistance', 250);
pks2 = findpeaks(amp2, 'MinPeakProminence', 2.9,'MinPeakDistance', 900);
pks3 = findpeaks(amp3, 'MinPeakProminence', 2,'MinPeakDistance', 850);

figure
subplot(3,1,1);
plot(pks1);
subplot(3,1,2);
plot(pks2);
subplot(3,1,3);
plot(pks3);

% %Exemple de sortie graphique en supposant que les transform�es de Fourier ad�quates ont �t� calcul�es
% figure;
% subplot(3, 1, 1)
% plot(abs(freq), res1); % Transform�eDeS1 n'existe pas, il faut la trouver dans le cadre de cette unit�
% xlabel('f (Hz)')
% ylabel('Amplitude (V)')
% title('Spectre du son 1')
% 
% subplot(3, 1, 2)
% plot(abs(freq),  res2) % Transform�eDeS2 n'existe pas, il faut la trouver dans le cadre de cette unit�
% xlabel('f (Hz)')
% ylabel('Amplitude (V)')
% title('Spectre du son 2')
% 
% subplot(3, 1, 3)
% plot(abs(freq),  res3) % Transform�eDeS3 n'existe pas, il faut la trouver dans le cadre de cette unit�
% xlabel('f (Hz)')
% ylabel('Amplitude (V)')
% title('Spectre du son 3')

% �coute des fichiers (support� seulement sous windows: wavplay)
% Il est possible d'utiliser soundsc (independant de tous les systemes
%  d'exploitation)
% soundsc(s1, fe);
% soundsc(s2, fe);
% soundsc(s3, fe);
% [s1, fe, NBITS] = wavread('son1');
% [s2, fe, NBITS] = wavread('son2');
% [s3, fe, NBITS] = wavread('son3');