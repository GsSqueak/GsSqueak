commands
setStatusLight: aSymbol

	aSymbol == #ready ifTrue: [
		statusLight color: Color green.
		tape ifNil: [
			statusLight setBalloonText: 'Ready to record'.
		] ifNotNil: [
			statusLight setBalloonText: 'Ready to record or play'.
		].
		^self
	].
	aSymbol == #nowRecording ifTrue: [
		statusLight 
			color: Color red;
			setBalloonText: 'Recording is active'.
		^self
	].
	aSymbol == #nowPlaying ifTrue: [
		statusLight 
			color: Color yellow;
			setBalloonText: 'Now playing'.
		^self
	].
