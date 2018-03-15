scrolling
vIsScrollbarNeeded
	"Return whether the verticle scrollbar is needed"
	"Don't do anything with the retractable scrollbar unless we have focus"
	retractableScrollBar & self hasFocus not
		ifTrue: [^ false].
	"Don't show it if we were told not to."
	self vScrollBarPolicy == #never
		ifTrue: [^ false].
	"Always show it if we were told to"
	self vScrollBarPolicy == #always
		ifTrue: [^ true].
	^ self vIsScrollable