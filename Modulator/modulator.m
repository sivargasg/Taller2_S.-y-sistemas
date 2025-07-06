function modulated = modulator(signal, fc, fs)
    % fc     : frecuencia de la portadora
    % fs     : frecuencia de muestreo

    filtered = lowpass(signal, 15E3, fs);

    t = (0:length(filtered)-1) / fs;
    osc = cos(2*pi*fc*t).';

    modulated = filtered .* osc;

    figure;
    plot(t, modulated, "color", [1, 0.7, 0.4]);
    title(['Señal modulada a ', num2str(fc/1000), ' kHz']);
    xlabel('Tiempo (s)');
    ylabel('Amplitud');

end
