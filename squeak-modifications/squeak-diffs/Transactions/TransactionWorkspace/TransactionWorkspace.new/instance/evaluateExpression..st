as yet unclassified
evaluateExpression: aString
|res|
res := extSession executeString: aString.
res isArray ifTrue: [^ ResultProxy forWs: self withOops: res].
^ res.
