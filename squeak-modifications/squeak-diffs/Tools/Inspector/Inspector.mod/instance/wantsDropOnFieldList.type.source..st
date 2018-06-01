drag-drop
wantsDropOnFieldList: anObject type: type source: source

	^ (source respondsTo: #model) and: [source model isKindOf: Inspector]