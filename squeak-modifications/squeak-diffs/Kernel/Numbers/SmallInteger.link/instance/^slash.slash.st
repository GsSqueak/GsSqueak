arithmetic
// anInteger

<primitive: 12>
anInteger = 0 ifTrue: [^ (ZeroDivide dividend: self) signal].
^ anInteger adaptToInteger: self andSend: #//
