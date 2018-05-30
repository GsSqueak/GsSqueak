accessing options
hideVScrollBarIndefinitely
	"Get rid of scroll bar for short panes that don't want it shown."

	self vScrollBarPolicy: #never.
	self vHideOrShowScrollBar.
