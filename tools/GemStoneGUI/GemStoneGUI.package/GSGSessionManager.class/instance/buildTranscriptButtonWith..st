toolbuilder
buildTranscriptButtonWith: builder

	| buttonSpec |
	buttonSpec := builder pluggableActionButtonSpec new.
	buttonSpec
			model: self;
			label: 'Transcript';
			help: 'Open a transcript connected to the current session''s TranscriptStream';
			action: #openTranscript.
	^ buttonSpec