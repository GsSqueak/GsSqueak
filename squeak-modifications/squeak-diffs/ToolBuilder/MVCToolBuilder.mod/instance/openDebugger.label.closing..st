opening
openDebugger: anObject label: aString closing: topView
	"Build an open the object, labeling it appropriately.  Answer the widget opened."
	| window |
	topView controller controlTerminate.
	topView deEmphasize; erase.

	"a few hacks to get the scroll selection artifacts out when we got here by clicking in the list"
"	topView subViewWantingControl ifNotNil: [
		topView subViewWantingControl controller controlTerminate
	]."
	topView controller status: #closed.
	window := self build: anObject.
	window label: aString.
	window controller openNoTerminate.
	topView controller closeAndUnscheduleNoErase.
	Processor terminateActive.
	^window