menu
showFFTAtCursor

	| data start availableSamples nu n fft r |
	data := graph data.
	start := graph cursor max: 1.
	availableSamples := (data size - start) + 1.
	nu := 12.
	nu > (availableSamples highBit - 1) ifTrue:
		[^ self inform: 'Too few samples after the cursor to take an FFT.' translated].
	n := 2 raisedTo: nu.
	fft := FFT new nu: nu.
	fft realData: ((start to: start + n - 1) collect: [:i | data at: i]).
	fft transformForward: true.
	r := (1 to: n // 2) collect:
		[:i | ((fft realData at: i) squared + (fft imagData at: i) squared) sqrt].
	WaveEditor openOn: r.

