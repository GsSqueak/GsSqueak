initialization
initializeForFlap
	"Initialize the receiver to operate in a flap at the top of the screen."

	"
	Flaps newObjectsFlap openInWorld
	"

	| buttonPane aBin aColor heights tabsPane |
	self basicInitialize.

	self layoutInset: 0;
		layoutPolicy: ProportionalLayout new;
		hResizing: #shrinkWrap;
		vResizing: #rigid;
		borderWidth: 2; borderColor: Color darkGray;
		extent: (self minimumWidth @ self minimumHeight).

	"mode buttons"
	buttonPane := self paneForTabs: self modeTabs.
	buttonPane
		vResizing: #shrinkWrap;
		setNameTo: 'ButtonPane';
		color: (aColor := buttonPane color) darker;
		layoutInset: 6;
		wrapDirection: nil;
		width: self width;
		layoutChanged; fullBounds.

	"Place holder for a tabs or text pane"
	tabsPane := Morph new
		setNameTo: 'TabPane';
		hResizing: #spaceFill;
		yourself.

	heights := { buttonPane height. 40 }.

	buttonPane vResizing: #spaceFill.
	self
		addMorph: buttonPane
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 1 @ 0)
				offsets: (0 @ 0 corner: 0 @ heights first)).

	self
		addMorph: tabsPane
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 1 @ 0)
				offsets: (0 @ heights first corner: 0 @ (heights first + heights second))).

	aBin := (PartsBin newPartsBinWithOrientation: #leftToRight from: #())
		listDirection: #leftToRight;
		wrapDirection: #topToBottom;
		color: aColor lighter lighter;
		setNameTo: 'Parts';
		dropEnabled: false;
		vResizing: #spaceFill;
		yourself.

	self
		addMorph: aBin
		fullFrame: (LayoutFrame
				fractions: (0 @ 0 corner: 1 @ 1)
				offsets: (0 @ (heights first + heights second) corner: 0 @ 0)).

	aBin color: (Color orange muchLighter);
		setNameTo: 'Objects' translated.

	self color: (Color orange muchLighter);
		setNameTo: 'Objects' translated.
