function out = bandpass(signal, fq, fs)
    % fs : sampling frequency
    % fq : frequency to tune +- 15 kHz

    % Return : Time signal with 1/2 of the input magnitude
    
         
    N = length(signal); % size signal
    fourier = fftshift(fft(signal));

    x = (-N/2 : N/2 - 1) * (fs/N); % x axis, frequencies Hz
    x = x.'; % Make it a column vector

    figure;
    plot(x, abs(fourier));
    xline(fq - 15E3, "--r");
    xline(fq + 15E3, "--r");
    xline(-fq - 15E3, "--r");
    xline(-fq + 15E3, "--r");
    title('Espectro en frecuencia', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Frecuencia (Hz)', 'FontSize', 12);
    ylabel('Magnitud', 'FontSize', 12);



    % Apply a bandpass filter to the signal
    bandpassFilter = ((x >= (fq - 15E3)) & (x <= (fq + 15E3))) | ((-x >= (fq - 15E3)) & (-x <= (fq + 15E3))); % Logic array
    filteredSignal = fourier .* bandpassFilter;

    figure;
    plot(x, abs(filteredSignal));
    title('Señal Filtrada en el Dominio de la Frecuencia', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Frecuencia (Hz)', 'FontSize', 12);
    ylabel('Magnitud', 'FontSize', 12);


    % Transform the filtered signal back to the time domain
    out = ifft(ifftshift(filteredSignal)); % undo fftshift and apply ifft
    out = real(out); % Take the real part
    
    figure;
    plot((-N/2 : N/2-1)/fs, out);
    title('Señal Filtrada en el Dominio del Tiempo', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Tiempo (s)', 'FontSize', 12);
    ylabel('Amplitud', 'FontSize', 12);


end