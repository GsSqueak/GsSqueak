button commands
chooseCodec
	| menu |
	menu := MenuMorph new defaultTarget: self.
	Smalltalk at: #OggDriver ifPresent: [:oggDriver |
		oggDriver isAvailable
			ifTrue: [menu
					add: 'Speex'
					target: self
					selector: #changeCodec:name:
					argumentList: {Smalltalk at: #OggSpeexCodec. 'Speex'}.
				menu
					add: 'Vorbis'
					target: self
					selector: #changeCodec:name:
					argumentList: {Smalltalk at: #OggVorbisCodec. 'Vorbis'}]].
	menu
		add: 'GSM'
		target: self
		selector: #changeCodec:name:
		argumentList: {GSMCodec. 'GSM'}.
	menu
		add: 'None'
		target: self
		selector: #changeCodec:name:
		argumentList: {nil. 'None'}.
	menu popUpInWorld