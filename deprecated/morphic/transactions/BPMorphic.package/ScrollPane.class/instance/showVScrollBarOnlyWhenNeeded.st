accessing options
showVScrollBarOnlyWhenNeeded
	"Get rid of scroll bar for short panes that don't want it shown."
	self vScrollBarPolicy: #whenNeeded.
	self vHideOrShowScrollBar