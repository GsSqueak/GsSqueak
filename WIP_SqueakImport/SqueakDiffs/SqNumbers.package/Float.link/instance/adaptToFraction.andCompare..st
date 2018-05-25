converting
adaptToFraction: rcvr andCompare: selector 
	"If I am involved in comparison with a Fraction, convert myself to a
	Fraction. This way, no bit is lost and comparison is exact."
	
	self isFinite ifFalse: [
		selector == #= ifTrue: [ ^false ].
		selector == #~= ifTrue: [ ^true ].
		(selector == #< or: [ selector == #'<=' ])
			ifTrue: [ ^self >= 0.0].
		(selector == #> or: [ selector == #'>=' ])
			ifTrue: [ ^0.0 >= self ].
		^self error: 'unknow comparison selector' ].
		
	"Try to avoid asTrueFraction because it can cost"
	rcvr isAnExactFloat ifTrue: [^rcvr asExactFloat perform: selector with: self].
	selector == #= ifTrue: [^false].
	selector == #~= ifTrue: [^true].
	^ rcvr perform: selector with: self asTrueFraction
