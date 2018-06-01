as yet unclassified
positionVertically

	| wb stickToTop |

	owner == self world ifFalse: [^self].
	wb := self worldBounds.
	stickToTop := self valueOfProperty: #stickToTop.
	stickToTop ifNil: [
		stickToTop := (self top - wb top) abs < (self bottom - wb bottom) abs.
		self setProperty: #stickToTop toValue: stickToTop.
	].
	mouseInside == true ifTrue: [
		stickToTop ifTrue: [
			self top: wb top
		] ifFalse: [
			self bottom: wb bottom
		].
	] ifFalse: [
		stickToTop ifTrue: [
			self bottom: wb top + self amountToShowWhenSmall
		] ifFalse: [
			self top: wb bottom - self amountToShowWhenSmall
		].
	].

