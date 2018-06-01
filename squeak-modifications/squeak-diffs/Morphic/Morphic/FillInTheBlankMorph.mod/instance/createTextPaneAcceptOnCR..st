initialization
createTextPaneAcceptOnCR: acceptBoolean 

	textPane := PluggableTextMorph
				on: self
				text: #response
				accept: #response:
				readSelection: #selectionInterval
				menu: #codePaneMenu:shifted:.
	textPane 
		showScrollBarsOnlyWhenNeeded;
		wantsFrameAdornments: false;
		hasUnacceptedEdits: true;
		acceptOnCR: acceptBoolean;
		setNameTo: 'textPane';
		layoutFrame: (LayoutFrame fractions: (0@0 corner: 1@1));
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		scrollToTop.
	^ textPane