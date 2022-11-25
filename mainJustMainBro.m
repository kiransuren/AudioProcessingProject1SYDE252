%sound(meanFilter(Init('Birds.wav'), 5), 16e3);
%sound(medianFilter_JG(Init('Birds.wav'), 5), 16e3);
%sound(gaussianFilter(Init('Birds.wav'), 10), 16e3);

sound(meanFilter(Init('Drum.wav'), 15), 16e3);
%sound(medianFilter_JG(Init('Drums.wav'), 5), 16e3);
%sound(gaussianFilter(Init('Drums.wav'), 10), 16e3);
