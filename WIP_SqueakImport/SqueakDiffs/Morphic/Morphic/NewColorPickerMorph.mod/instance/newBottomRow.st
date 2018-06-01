initialize-release
newBottomRow
	^ Morph new
		 color: Color transparent ;
		 changeTableLayout ;
		 listDirection: #leftToRight ;
		 hResizing: #spaceFill; vResizing: #shrinkWrap ;
		 height: 20 ;
		 cellInset: 4 ;
		 addMorph: (StringMorph contents: 'Current selection:' translated) ;
		 addMorphBack: self newColorPresenterMorph ;
		 addMorphBack: self newCloseButton