*SqNumbers-arithmetic
// anInteger

<primitive: 263>
anInteger = 0 ifTrue: [^ (ZeroDivide dividend: self) signal"<- Chg"].
^ anInteger adaptToInteger: self andSend: #//
