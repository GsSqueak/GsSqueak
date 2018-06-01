This class adds state and controls to the basic PianoKeyboardMorph so that notes of reliable duration can be keyed into a score without the need for a real keyboard.

To try this out, execute...

	| n score | n := 3.
	score := (MIDIScore new tracks: ((1 to: n) collect: [:i | Array new]);
		trackInfo: ((1 to: n) collect: [:i | 'Instrument' , i printString]);
		tempoMap: nil; ticksPerQuarterNote: 96).
	ScorePlayerMorph openOn: score title: 'empty score'

Then open a pianoRoll and, from that, open a keyboard.  The rule is that the keyboard will append after the current selection.  If the current selection is muted or nil, then input will go to the end of the first non-muted track.