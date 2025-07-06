function demodulator(signal, fq, fs)

    filtered = bandpass(signal, fq, fs);

    t = (0 : length(signal)-1)/fs;
    cosine = cos( 2*pi*fq * t ).'; % Evaluate the carrier cosine (frequency fq) at the signal points (t)

    baseSignal = filtered .* cosine;
    
    result = lowpass(baseSignal, 15E3, fs); % Lowpass filter to remove high frequencies
    result = result * 2; % Scale the result to [-1, 1] range, it was around [-0.5, 0.5]
    
    figure;
    plot(t, result, "Color", [0.4, 0.6, 1]);
    title('Salida', 'FontSize', 14, 'FontWeight', 'bold');
    xlabel('Tiempo (s)', 'FontSize', 12);
    ylabel('Magnitud', 'FontSize', 12);

    sound(resample(baseSignal, 30E3, fs), 30E3);



end