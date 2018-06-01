selection
setSelectedMorph: aMorph 
	self changeModelSelection: (self modelIndexFor: (scroller submorphs indexOf: aMorph))