initialization
addControls
	| slider aWrapper m aButton |
	aWrapper := AlignmentMorph newRow.
	aWrapper color: Color transparent;
		 borderWidth: 0;
		 layoutInset: 0.
	aWrapper hResizing: #shrinkWrap;
		 vResizing: #shrinkWrap;
		 extent: 5 @ 5.
	aWrapper wrapCentering: #topLeft.
	aButton := self buttonName: 'X' action: #delete.
	aButton setBalloonText: 'Close WaveEditor' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Menu' translated action: #invokeMenu.
	aButton setBalloonText: 'Open a menu' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Play' translated action: #play.
	aButton setBalloonText: 'Play sound' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Play Before' translated action: #playBeforeCursor.
	aButton setBalloonText: 'Play before cursor' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Play After' translated action: #playAfterCursor.
	aButton setBalloonText: 'Play after cursor' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Play Loop' translated action: #playLoop.
	aButton setBalloonText: 'Play the loop' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Test' translated action: #playTestNote.
	aButton setBalloonText: 'Test the note' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Save' translated action: #saveInstrument.
	aButton setBalloonText: 'Save the sound' translated.
	aWrapper addMorphBack: aButton.

	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Set Loop End' translated action: #setLoopEnd.
	aButton setBalloonText: 'Set loop end at cursor' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Set One Cycle' translated action: #setOneCycle.
	aButton setBalloonText: 'Set one cycle' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	aButton := self buttonName: 'Set Loop Start' translated action: #setLoopStart.
	aButton setBalloonText: 'Set the loop start at cursor' translated.
	aWrapper addMorphBack: aButton.
	aWrapper addTransparentSpacerOfSize: 4 @ 1.
	self addMorphBack: aWrapper.
	aWrapper := AlignmentMorph newRow.
	aWrapper color: self color;
		 borderWidth: 0;
		 layoutInset: 0.
	aWrapper hResizing: #spaceFill;
		 vResizing: #rigid;
		 extent: 5 @ 20;
		 wrapCentering: #center;
		 cellPositioning: #leftCenter.
	m := StringMorph new contents: 'Index: ' translated;
				 font: Preferences standardEToysButtonFont.
	aWrapper addMorphBack: m.
	m := UpdatingStringMorph new target: graph;
				 getSelector: #cursor;
				 putSelector: #cursor:;
				 font: Preferences standardEToysButtonFont;
				 growable: false;
				 width: 71;
				 step.
	aWrapper addMorphBack: m.
	m := StringMorph new contents: 'Value: ' translated;
				 font: Preferences standardEToysButtonFont.
	aWrapper addMorphBack: m.
	m := UpdatingStringMorph new target: graph;
				 getSelector: #valueAtCursor;
				 putSelector: #valueAtCursor:;
				 font: Preferences standardEToysButtonFont;
				 growable: false;
				 width: 50;
				 step.
	aWrapper addMorphBack: m.
	slider := SimpleSliderMorph new color: color;
				 extent: 200 @ 10;
				 target: self;
				 actionSelector: #scrollTime:.
	aWrapper addMorphBack: slider.
	m := Morph new color: aWrapper color;
				 extent: 10 @ 5.
	"spacer"
	aWrapper addMorphBack: m.
	m := UpdatingStringMorph new target: graph;
				 getSelector: #startIndex;
				 putSelector: #startIndex:;
				 font: Preferences standardEToysButtonFont;
				 width: 40;
				 step.
	aWrapper addMorphBack: m.
	self addMorphBack: aWrapper