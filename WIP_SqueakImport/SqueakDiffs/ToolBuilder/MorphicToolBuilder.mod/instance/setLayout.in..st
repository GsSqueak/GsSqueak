private
setLayout: layout in: widget
	layout == #proportional ifTrue:[
		widget layoutPolicy: ProportionalLayout new.
		^self].
	layout == #horizontal ifTrue:[
		widget layoutPolicy: TableLayout new.
		widget listDirection: #leftToRight.
		"widget cellInset: 1@1.
		widget layoutInset: 1@1."
		widget color: Color transparent.
		"and then some..."
		^self].
	layout == #vertical ifTrue:[
		widget layoutPolicy: TableLayout new.
		widget listDirection: #topToBottom.
		"widget cellInset: 1@1.
		widget layoutInset: 1@1."
		widget color: Color transparent.
		"and then some..."
		^self].
	^self error: 'Unknown layout: ', layout.