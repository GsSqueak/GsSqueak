initialize-release
newColorPresenterMorph
	^ (ColorPresenterMorph
		on: hsvaMorph
		color: #selectedColor)
		 vResizing: #rigid ; height: 20 ;
		 hResizing: #spaceFill ;
		 yourself