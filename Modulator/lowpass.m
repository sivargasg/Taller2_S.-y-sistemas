function out = lowpass(signal, fq, fs)
    % Take the frequency lower than the specified one. Symmetrical
    % fq : frequency to filter
    % fs : sampling frequency


    fourier = fftshift(fft(signal));
    N = length(signal);

    x = (-N/2 : N/2-1) * fs/N; % Frequency vector
    x = x.'; % Make it a column vector

    
    % Logic vector
    filter = (x >= -fq) & (x <= fq);

    % Apply the filter
    filtered = fourier .* filter;

    % Inverse Fourier Transform
    out = ifft(ifftshift(filtered)); % Undo fftshift and apply inverse FFT
    out = real(out); % Take the real part

    figure;
    subplot(1, 2, 1);
    plot(x, abs(fourier), "Color", [0.6, 0.8, 0.6]);
    xline(-fq, "--r");
    xline(fq, "--r");
    title('Espectro en frecuencia', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Frecuencia (Hz)', 'FontSize', 12);
    ylabel('Magnitud', 'FontSize', 12);


    subplot(1, 2, 2);
    plot(x, abs(filtered), "Color", [0.6, 0.8, 0.6]);
    title('Señal Filtrada en el Dominio de la Frecuencia', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Frecuencia (Hz)', 'FontSize', 12);
    ylabel('Magnitud', 'FontSize', 12);



end