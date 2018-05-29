drawing-general
fullDraw: aMorph 
	self comment: 'start morph: ' with: aMorph.
	self comment: 'level: ' with: morphLevel.
	self comment: 'bounds: ' with: aMorph bounds.
	self comment: 'corner: ' with: aMorph bounds corner.
	morphLevel := morphLevel + 1.
	self setupGStateForMorph: aMorph.
	aMorph fullDrawPostscriptOn: self.
	self endGStateForMorph: aMorph.
	morphLevel := morphLevel - 1.
	self comment: 'end morph: ' with: aMorph.
	self comment: 'level: ' with: morphLevel.
