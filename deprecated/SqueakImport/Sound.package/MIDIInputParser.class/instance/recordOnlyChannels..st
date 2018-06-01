midi filtering
recordOnlyChannels: channelList
	"Record only MIDI data arriving on the given list of channel numbers (in the range 1-16)."

	channelList do: [:ch |
		((ch isInteger not) | (ch < 1) | (ch > 16))
			ifTrue: [^ self error: 'bad Midi channel specification: ', ch printString]].

	1 to: 16 do: [:ch | (channelList includes: ch) ifFalse: [self ignoreChannel: ch]].
