accessing options
hideHScrollBarIndefinitely
	"Get rid of scroll bar for short panes that don't want it shown."
	self hScrollBarPolicy: #never.
	self hHideOrShowScrollBar