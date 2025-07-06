load("PruebaDemodulador.mat")
addpath('Demodulator\');

fq = 70E3; % Frequency to demodulate

fs = 500E3;   % Sampling frequency

plot((0 : length(TX)-1)/fs, TX);
title('Señal de entrada', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Tiempo (s)', 'FontSize', 12);
ylabel('Amplitud', 'FontSize', 12);





demodulator(TX, fq, fs);
