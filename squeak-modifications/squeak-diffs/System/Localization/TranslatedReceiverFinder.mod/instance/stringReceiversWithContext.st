accessing
stringReceiversWithContext
	| mrs results rr cls mn t o |
	mrs := SystemNavigation default allCallsOn: #translated.
	results := OrderedCollection new.
	mrs do: [:mr |
		rr := OrderedCollection new.
		cls := Smalltalk at: mr classSymbol.
		rr add: cls category.
		rr add: mr classSymbol.
		rr add: mr methodSymbol.
		mr classIsMeta ifTrue: [
			mn :=  cls class decompile: mr methodSymbol.
		] ifFalse: [
			mn := cls decompile: mr methodSymbol.
		].
		o := OrderedCollection new.
		t := Set new.
		self searchMessageNode: mn addTo: t.
		t do: [ :te |
			(te receiver isMemberOf: LiteralNode) ifTrue: [ 
			    o add: te receiver key.
			].
		].
		o ifNotEmpty: [
			rr add: o.
			results add: rr.
		].
	].
	^ results.

