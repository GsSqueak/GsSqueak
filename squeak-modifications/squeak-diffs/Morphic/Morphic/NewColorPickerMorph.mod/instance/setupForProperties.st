initialize-release
setupForProperties
	self
		 color: (Color white darker) ;
		 changeTableLayout ;
		 hResizing: #shrinkWrap ;
		 vResizing: #shrinkWrap ;
		 extent: 240@240 ;
		 addMorphBack: hsvaMorph ;
		 layoutInset: 4 ;
		 cellInset: 2.