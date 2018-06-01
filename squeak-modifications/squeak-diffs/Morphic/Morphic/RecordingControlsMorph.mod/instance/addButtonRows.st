initialization
addButtonRows

	| r fullWidth |
	r := AlignmentMorph newRow vResizing: #shrinkWrap.


	r addMorphBack: (self buttonName: 'Morph' translated action: #makeSoundMorph).
	r addMorphBack: (Morph new extent: 4@1; color: Color transparent).
	r addMorphBack: (self buttonName: 'Tile' translated action: #makeTile).
	r addMorphBack: (Morph new extent: 4@1; color: Color transparent).
	r addMorphBack: (self buttonName: 'Trim' translated action: #trim).
	r addMorphBack: (Morph new extent: 4@1; color: Color transparent).
	r addMorphBack: (self buttonName: 'Show' translated action: #showEditor).
	self addMorphBack: r.
	r layoutChanged.
	fullWidth := r fullBounds width.

	r := AlignmentMorph newRow vResizing: #shrinkWrap.
	r addMorphBack: (self buttonName: 'Record' translated action: #record).
	r addMorphBack: (Morph new extent: 4@1; color: Color transparent).
	r addMorphBack: (self buttonName: 'Stop' translated action: #stop).
	r addMorphBack: (Morph new extent: 4@1; color: Color transparent).
	r addMorphBack: (self buttonName: 'Play' translated action: #playback).
	r addMorphBack: (Morph new extent: 4@1; color: Color transparent).
	r addMorphBack: (self buttonName: 'Codec' translated action: #chooseCodec).
	r addMorphBack: self makeStatusLight.
	self addMorphBack: r.
	Smalltalk at: #OggSpeexCodec ifPresent: [:c |
		self changeCodec: c name: 'Speex'].
	r layoutChanged.
	fullWidth := fullWidth max: r fullBounds width.
	^ fullWidth@(r fullBounds height).
