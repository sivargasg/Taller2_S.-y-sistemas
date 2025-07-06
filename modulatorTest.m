addpath("Modulator\");

Fs = 500E3; % Sampling frequency

%%% SIGNAL 1 %%%








%%% SIGNAL 2 %%%
[signal2, FsTemp] = audioread("audio\sound_2.wav");
disp(["Frecuencia de muestreo sound_2: ", num2str(Fs), ' Hz']);
signal2 = resample(signal2, 30E3, FsTemp); % Resample the signal to 30 kHz
sound(signal2, 30E3); % Play the sound

result2 = modulator(signal2, 110E3, Fs); % Modulate the signal at 110 kHz

plot((0:length(result)-1)/Fs, result);
