*Morphic-NewCurves-cubic support
assertSlopesWith: knots from: start to: end
   "
	We trust everything has been checked. 
	The following assertions should hold at this point: "
	
	self assert: [ self size = knots size ] . 
	"Sizes must be consistent." 
	self assert: [ end > start]. 
	"There must be at least one slope to clamp." 
	self assert: [ 0 < start and: [start <= knots size] ]. 
	"The clamped slope may be the last one."
	self assert: [  end  <= knots size + start ] . 
	"We can wrap. There may be only one known slope."
	"xxx self assert: [ end = knots size + start ifTrue: [ (self at: start) notNil ] ] . xxx"
		"xxx If we overlap slope must be known. xxx"
	{ start . end } 
		do: [ :index |
			| slope |
			slope := (self at: index ).
			self assert: [ slope isNil 
				or: [ slope isNumber 
				or: [ slope isPoint ] ] ] ] . 
	"And a known and reasonalble value or nil." 
	^true 
	