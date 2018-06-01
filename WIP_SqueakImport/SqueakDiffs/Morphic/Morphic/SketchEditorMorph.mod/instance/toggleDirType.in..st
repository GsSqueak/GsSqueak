actions & preps
toggleDirType: evt in: handle
	"Toggle from 'rotate' to 'to and fro' to 'up and down' to 'none'
for the kind of rotation the object does.  An actor's rotationStyle is one
of #(normal leftRight upDown none)."

| rr ii |
"Clear the indicator"

"Find new style, store it, install the indicator"
rr := self rotationStyle.
ii := #(normal leftRight upDown none) indexOf: rr.
self setProperty: #rotationStyle toValue:
	(#(leftRight upDown none normal) at: ii).
ii = 4 ifTrue: ["normal" self forward: self forwardDirection
			direction: (self valueOfProperty: #fwdButton)]
	ifFalse: [self showDirType.].