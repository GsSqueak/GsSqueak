gc -- mark and sweep
upward
	"Return from marking an object below. Incoming: 
	field = oop we just worked on, needs to be put away 
	parentField = where to put it in our object 
	NOTE: Type field of object below has already been restored!!! "
	| type header |
	<inline: true>
	(parentField bitAnd: 1) = 1
		ifTrue: [parentField = GCTopMarker
				ifTrue: ["top of the chain"
					header := (self longAt: field) bitAnd: self allButTypeMask.
					type := self rightType: header.
					self longAt: field put: (header bitOr: type). "install type on class oop"
					^ Done]
				ifFalse: ["was working on the extended class word"
					child := field. "oop of class"
					field := parentField - 1. "class word, ** clear the low bit **"
					parentField := self longAt: field.
					header := self longAt: field + self bytesPerWord. "base header word"
					type := self rightType: header.
					self longAt: field put: (child bitOr: type). "install type on class oop"
					field := field + self bytesPerWord. "point at header"
					"restore type bits"
					header := header bitAnd: self allButTypeMask.
					self longAt: field put: (header bitOr: type).
					^ Upward]]
		ifFalse: ["normal"
			child := field. "who we worked on below"
			field := parentField. "where to put it"
			parentField := self longAt: field.
			self longAt: field put: child.
			field := field - self bytesPerWord. "point at header"
			^ StartField]