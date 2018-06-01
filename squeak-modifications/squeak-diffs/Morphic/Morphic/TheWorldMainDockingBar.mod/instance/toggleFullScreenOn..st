right side
toggleFullScreenOn: aDockingBar 
	
	| toggleMorph onIcon offIcon box bgColor |
	offIcon := MenuIcons fullscreenWireframeIconColorized:
					(self userInterfaceTheme logoColor ifNil: [Color black]).
	onIcon := MenuIcons fullscreenWireframeIconColorized:
					(self userInterfaceTheme selectionLogoColor ifNil: [Color white]).
	bgColor := (UserInterfaceTheme current get: #selectionColor for: #DockingBarItemMorph) ifNil: [Color blue].
	
	toggleMorph := offIcon asMorph.
	
	box := Morph new
		color: Color transparent;
		hResizing: #shrinkWrap;
		vResizing: #spaceFill;
		listCentering: #center;
		width: toggleMorph width;
		changeTableLayout;
		
		borderWidth: 1;
		borderColor: Color transparent;
		balloonText: 'toggle full screen mode' translated;
		addMorph: toggleMorph.
		
	toggleMorph setToAdhereToEdge: #rightCenter. 
		
	box
		on: #mouseUp
		send: #value
		to:
			[ DisplayScreen toggleFullScreen. 
			"toggleMorph image: MenuIcons smallFullscreenOffIcon" ] ;

		on: #mouseEnter
		send: #value
		to: [
			toggleMorph image: onIcon.
			box color: bgColor; borderColor: bgColor];
		
		on: #mouseLeave
		send: #value
		to: [
			toggleMorph image: offIcon.
			box color: Color transparent; borderColor: Color transparent].
				
	aDockingBar addMorphBack: box