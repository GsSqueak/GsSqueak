as yet unclassified
firstEnter: evt
	"The first time this divider is activated, find its window and redirect further interaction there."
	| window |

	window := self firstOwnerSuchThat: [:m | m respondsTo: #secondaryPaneTransition:divider:].
	window ifNil: [ self suspendEventHandler. ^ self ]. "not working out"
	window secondaryPaneTransition: evt divider: self.
	self on: #mouseEnter send: #secondaryPaneTransition:divider: to: window.
