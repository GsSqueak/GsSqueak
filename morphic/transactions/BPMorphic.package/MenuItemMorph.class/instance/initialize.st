initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	""
	contents := ''.
	hasFocus := false.
	isEnabled := true.
	subMenu := nil.
	isSelected := false.
	target := nil.
	selector := nil.
	arguments := nil.
	font := self userInterfaceTheme font
				ifNil: [TextStyle defaultFont].
	self
		color: (self userInterfaceTheme textColor
				ifNil: [Color black]);
		 hResizing: #spaceFill;
		 vResizing: #shrinkWrap