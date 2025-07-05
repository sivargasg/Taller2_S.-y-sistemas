function bandpass(signal, fq, fs)
    % fs : sampling frequency
    % fq : frequency to tune +- 7.5 kHz
         
    N = length(signal); % size signal
    fourier = fft(signal);
    fourier = fourier(:).'; % Make row vector


    n = floor(N / 2) + 1; % size fourier

    % Take half of the signal
    fourier = fourier(1:n);

    x = (0 : n - 1) * (fs/N);



    figure;
    plot(x, real(fourier));

    xline(fq - 7.5E3, "--r");
    xline(fq + 7.5E3, "--r");

    title('Espectro en frecuencia', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Frecuencia (Hz)', 'FontSize', 12);
    ylabel('Parte real', 'FontSize', 12);



    % Apply a bandpass filter to the signal
    bandpassFilter = (x >= (fq - 7.5E3)) & (x <= (fq + 7.5E3)); % Logic array
    filteredSignal = fourier .* bandpassFilter;

    figure;
    plot(x, real(filteredSignal));

    title('Señal Filtrada en el Dominio de la Frecuencia', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Frecuencia (Hz)', 'FontSize', 12);
    ylabel('Amplitud (parte real)', 'FontSize', 12);

end