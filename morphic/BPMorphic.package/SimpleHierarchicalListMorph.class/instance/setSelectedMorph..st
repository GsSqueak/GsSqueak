selection
setSelectedMorph: aMorph 
	"Avoid unnecessary model callbacks."
	self selectedMorph == aMorph
		ifTrue: [^ self].
	model
		perform: (setSelectionSelector
				ifNil: [^ self])
		with: aMorph complexContents
	"leave last wrapper in place"