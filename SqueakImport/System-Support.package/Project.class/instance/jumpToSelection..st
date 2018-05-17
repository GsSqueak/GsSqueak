utilities
jumpToSelection: selection
	"Enter the project corresponding to this menu selection."
	
	"Project jumpToProject"
	| nBack prev pr |
	selection ifNil: [^ self].
	(selection beginsWith: '%back') ifTrue:
		[nBack := (selection copyFrom: 6 to: selection size) asNumber.
		prev := CurrentProject previousProject.
		1 to: nBack-1 do:
			[:i | prev ifNotNil: [prev := prev previousProject]].
		prev ifNotNil: [prev enter: true revert: false saveForRevert: false]].
	selection = #parent ifTrue:
		[CurrentProject parent enter: false revert: false saveForRevert: false.
		^ self].
	(pr := Project namedWithDepth: selection) ifNil: [^ self].
	pr enter: false revert: false saveForRevert: false