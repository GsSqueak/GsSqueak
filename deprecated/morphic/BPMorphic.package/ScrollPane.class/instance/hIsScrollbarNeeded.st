scrolling
hIsScrollbarNeeded
	"Return whether the horz scrollbar is needed"
	"Don't do anything with the retractable scrollbar unless we have focus"
	retractableScrollBar & self hasFocus not
		ifTrue: [^ false].
	"Don't show it if we were told not to."
	self hScrollBarPolicy == #never
		ifTrue: [^ false].
	"Always show it if we were told to"
	self hScrollBarPolicy == #always
		ifTrue: [^ true].
	^ self hIsScrollable