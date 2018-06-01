initialize-release
initializeHsvaMorph
	hsvaMorph := HSVAColorSelectorMorph new
		 hResizing: #spaceFill ;
		 vResizing: #spaceFill ;
		 yourself.
	hsvaMorph
		when: #selectedColor
		send: #colorSelected:
		to: self