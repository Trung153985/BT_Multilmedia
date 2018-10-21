fs = 44100; % F l?y m?u
t = 0 : 1/fs : 0.7; 
tone = {};
song=[];
j =1;
for i=1:12
   tone{i}=0.3*sin(2*pi*f*((2^(i-1)).^(1/12))*t); 
   tone1{i}=0*sin(2*pi*f*((2^(i-1)).^(1/12))*t);
end

%d0        re  mi       pha      son la       Do
%'A' 'A#' 'B' 'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#'
A0=tone{1}; A = tone{1}; A1=tone{2}; B = tone{3};C=tone{4};C1=tone{5}; D=tone{6};D1=tone{7};E=tone{8};F=tone{9};F1=tone{10};G=tone{11};G1=tone{12};
song = [C D E A0 C D E A0 C D E E C F E];
[g,Fs] = wavread('orig_input.wav'); 
trung =g + (song(1:length(g)))';
soundsc(trung,44000); 
wavwrite(trung,Fs,'melody.wav'); 


%_________Fast Fourier Transform_________
[y,fs] = wavread('melody.wav');
xlabel('Frequency(Hz)');
figure(2)
N = fs % number of FFT points
transform = fft(y,N)/N;
magTransform = abs(transform);
faxis = linspace(-N/2,N/2,N);
plot(faxis,fftshift(magTransform));
xlabel('Frequency(Hz)');

%_________Spectrogram_________
win = 128 % window length in samples
% number of samples between overlapping windows:
hop = win/2            
nfft = win %width of each frequency bin 
figure(3)
spectrogram(y,win,hop,nfft,fs,'yaxis');
% change the tick labels of the graph from scientific notation to floating point: 
yt = get(gca,'YTick');  
set(gca,'YTickLabel', sprintf('%.0f|',yt));



