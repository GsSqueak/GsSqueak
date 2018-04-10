event handling
hasFocus
	self flag: #obsolete.
	"mt: Use #hasKeyboardFocus instead, which reads live hand
	information and no cache."
	^ false