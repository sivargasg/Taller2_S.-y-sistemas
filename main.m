load("PruebaDemodulador.mat")
addpath('Demodulator\');

plot(TX);
title('Señal de entrada', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Muestra (500k Hz)', 'FontSize', 12);
ylabel('Magnitud [-1,1]', 'FontSize', 12);

fs = 500E3;   % Sampling frequency



bandpass(TX, 70E3, fs)
