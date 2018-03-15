accessing
savedMultiWindowState: aSavedMultiWindowState 
	labelButton := MultiWindowLabelButtonMorph
				on: aSavedMultiWindowState
				getState: nil
				action: #selectWindowsMenu.
	labelButton triggerOnMouseDown: true;
		 savedMultiWindowState: aSavedMultiWindowState.
	labelButton
		layoutFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 0.4 @ 0)
				offsets: (20 @ -20 corner: 0 @ 0));
		 hResizing: #spaceFill;
		 vResizing: #spaceFill.
	"i.e. in the left 40% of the title bar"
	self addMorphFront: labelButton.
	self adjustExtraButton