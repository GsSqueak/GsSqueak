drawing
keyboardFocusColor	^ self userInterfaceTheme keyboardFocusColor		ifNil: [TranslucentColor				r: 0.3				g: 0.5				b: 0.5				alpha: 0.5]