private
doMakeSibling: evt with: dupHandle 
	"Ask hand to make a sibling of my target. Only reachable if target is of
	a uniclass"
	target couldMakeSibling
		ifFalse: [^ self].
	target assuredPlayer assureUniClass.
	self obtainHaloForEvent: evt andRemoveAllHandlesBut: dupHandle.
	self setTarget: (target makeSiblings: 1) first.
	evt hand grabMorph: target.
	self step.
	"update position if necessary"
	evt hand addMouseListener: self