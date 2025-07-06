function out = lowpass(signal, fq, fs)
    % Take the frequency lower than the specified one. Symmetrical
    % fq : frequency to filter
    % fs : sampling frequency


    fourier = fftshift(fft(signal));
    N = length(signal);

    x = (-N/2 : N/2-1) * fs/N; % Frequency vector

    
    % Logic vector
    filter = (x >= -fq) & (x <= fq);

    % Apply the filter
    filtered = fourier .* filter;

    % Inverse Fourier Transform
    out = ifft(ifftshift(filtered)); % Undo fftshift and apply inverse FFT
    out = real(out); % Take the real part

    figure;
    plot(x, abs(fourier));
    xline(-7.5E3, "--r");
    xline(7.5E3, "--r");
    title('Espectro en frecuencia', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Frecuencia (Hz)', 'FontSize', 12);
    ylabel('Magnitud', 'FontSize', 12);

    figure;
    plot(x, abs(filtered));
    title('Señal Filtrada en el Dominio de la Frecuencia', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Frecuencia (Hz)', 'FontSize', 12);
    ylabel('Magnitud', 'FontSize', 12);



end