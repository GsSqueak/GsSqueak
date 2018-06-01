menu
setRotationStyle
	| selections labels sel reply |
	selections := #(normal leftRight upDown none).
	labels := #('rotate smoothly' 'left-right flip only' 'top-down flip only' 'don''t rotate').
	sel := labels at: (selections indexOf: self rotationStyle ifAbsent:[1]).
	labels := labels collect:[:lbl| sel = lbl ifTrue:['<on>', lbl translated] ifFalse:['<off>', lbl translated]].
	reply := UIManager default chooseFrom: labels values: selections.
	reply ifNotNil: [self rotationStyle: reply].
