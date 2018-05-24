accessing - ui
adoptPaneColor: paneColor 
	"Pass on to the border too."
	super adoptPaneColor: paneColor.
	paneColor ifNil: [ ^ self ].
	self
		 fillStyle: self fillStyleToUse ;
		 borderStyle:
			(BorderStyle inset
				 width: 1 ;
				 baseColor: self color twiceDarker) ;
		 sliderColor:
			(self enabled
				ifTrue: [ paneColor twiceDarker ]
				ifFalse: [ self paneColor twiceDarker paler ])