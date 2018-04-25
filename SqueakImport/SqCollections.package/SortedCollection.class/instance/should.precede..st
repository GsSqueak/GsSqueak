private
should: a precede: b

	^sortBlock ifNil: [a <= b] ifNotNil: [sortBlock value: a value: b]
