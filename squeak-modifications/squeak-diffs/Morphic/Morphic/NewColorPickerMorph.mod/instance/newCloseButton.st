initialize-release
newCloseButton
	^ (PluggableButtonMorph
		on: self
		getState: nil
		action: #delete
		label: #closeButtonLabel)
		 vResizing: #spaceFill ;
		hResizing: #spaceFill;
		 yourself