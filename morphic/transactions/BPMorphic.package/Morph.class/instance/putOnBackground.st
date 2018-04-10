-Etoys
putOnBackground
	"Place the receiver, formerly private to its card, onto the shared
	background. If the receiver needs data carried on its behalf by the
	card, such data will be represented on every card."
	(self hasProperty: #shared)
		ifTrue: [^ self].
	"Already done"
	self setProperty: #shared toValue: true.
	self stack
		ifNotNil: [self stack reassessBackgroundShape]