function nbnoise = filter_design(freq_low, freq_high, bbnoise)
%FILTER_DESIGN Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.1 and the Signal Processing Toolbox 6.19.
% Generated on: 25-Aug-2015 11:27:02
 
% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 44100;  % Sampling Frequency

Fstop1 = freq_low - 100;        % First Stopband Frequency
% Freq low = First Passband Frequency
% Freq high = Second Passband Frequency

Fstop2 = freq_high + 100;        % Second Stopband Frequency

Astop1 = 60;          % First Stopband Attenuation (dB)
Apass  = 1;           % Passband Ripple (dB)
Astop2 = 100;         % Second Stopband Attenuation (dB)
match  = 'passband';  % Band to match exactly

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass(Fstop1, freq_low, freq_high, Fstop2, Astop1, Apass, ...
                      Astop2, Fs);
Hd = design(h, 'butter', 'MatchExactly', match);

nbnoise = filter(Hd, bbnoise);

% [EOF]
