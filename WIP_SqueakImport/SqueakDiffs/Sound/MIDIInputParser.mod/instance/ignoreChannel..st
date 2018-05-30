midi filtering
ignoreChannel: channel
	"Don't record any events arriving on the given MIDI channel (in the range 1-16)."

	((channel isInteger not) | (channel < 1) | (channel > 16))
		ifTrue: [^ self error: 'bad MIDI channel number', channel printString].

	"two-arg channel messages"
	#(128 144 160 176 224) do: [:i | cmdActionTable at: (i bitOr: channel - 1) put: #ignoreTwo:].

	"one-arg channel messages"
	#(192 208) do: [:i | cmdActionTable at: (i bitOr: channel - 1) put: #ignoreOne:].
