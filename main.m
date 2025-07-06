addpath("Modulator\");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


fq = 70E3; % Frequency to tune


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



Fs = 500E3; % Sampling frequency


%%% SIGNAL 1 %%%
[signal1, FsTemp] = audioread("audio\sound_1.wav");
disp(["Frecuencia de muestreo sound_1: ", num2str(FsTemp), ' Hz']);
signal1 = resample(signal1, Fs, FsTemp); % Resample the signal to 500 kHz
% Convert to 5E6 samples
if length(signal1) > 5E6
    signal1 = signal1(1:5E6); % Take the first 5E6 samples
else
    signal1 = [signal1; zeros(5E6 - length(signal1), 1)]; % Fill with zeros if less than 5E6 samples
end
result1 = modulator(signal1, 70E3, Fs); % Modulate the signal at 70 kHz




%%% SIGNAL 2 %%%
[signal2, FsTemp] = audioread("audio\sound_2.wav");
disp(["Frecuencia de muestreo sound_2: ", num2str(Fs), ' Hz']);
signal2 = resample(signal2, Fs, FsTemp); % Resample the signal to 500 kHz
% Convert to 5E6 samples
if length(signal2) > 5E6
    signal2 = signal2(1:5E6); % Take the first 5E6 samples
else
    signal2 = [signal2; zeros(5E6 - length(signal2), 1)]; % Fill with zeros if less than 5E6 samples
end
result2 = modulator(signal2, 110E3, Fs); % Modulate the signal at 110 kHz


%%% SIGNAL 3 %%%
[signal3, FsTemp] = audioread("audio\sound_3.wav");
disp(["Frecuencia de muestreo sound_3: ", num2str(FsTemp), ' Hz']);
signal3 = resample(signal3, Fs, FsTemp); % Resample the signal to 500 kHz
% Convert to 5E6 samples
if length(signal3) > 5E6
    signal3 = signal3(1:5E6); % Take the first 5E6 samples
else
    signal3 = [signal3; zeros(5E6 - length(signal3), 1)]; % Fill with zeros if less than 5E6 samples
end
result3 = modulator(signal3, 150E3, Fs); % Modulate the signal at 150 kHz




%%% SIGNAL 4 %%%
[signal4, FsTemp] = audioread("audio\sound_4.wav");
disp(["Frecuencia de muestreo sound_4: ", num2str(FsTemp), ' Hz']);
signal4 = resample(signal4, Fs, FsTemp); % Resample the signal to 500 kHz
% Convert to 5E6 samples
if length(signal4) > 5E6
    signal4 = signal4(1:5E6); % Take the first 5E6 samples
else
    signal4 = [signal4; zeros(5E6 - length(signal4), 1)]; % Fill with zeros if less than 5E6 samples
end
result4 = modulator(signal4, 190E3, Fs); % Modulate the signal at 190 kHz



fullSignal = result1 + result2 + result3 + result4; % Combine all modulated signals

t = (0:length(fullSignal)-1) / Fs; % Time vector for plotting
plot(t, fullSignal, "color", [0.4, 0.6, 1]);
title('Señal de entrada', 'FontSize', 14, 'FontWeight', 'bold');
xlabel('Tiempo (s)', 'FontSize', 12);
ylabel('Amplitud', 'FontSize', 12);




demodulator(fullSignal, fq, Fs); % Demodulate the signal at 110 kHz
