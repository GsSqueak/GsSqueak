isolation layers
invokePhase1

	| elements |
	revertable ifFalse: [^ self].
	inForce ifTrue: [self error: 'Can invoke only when not in force.'].

	"Do the first part of the invoke operation -- no particular hurry."
	"Save the outer method dictionary for quick revert of method changes."
	priorMD := self realClass methodDict.

	"Prepare a methodDictionary for switcheroo."
	thisMD := self realClass methodDict copy.
	methodChanges associationsDo:
		[:assn | | selector changeRecord type |
		selector := assn key.
		changeRecord := assn value.
		type := changeRecord changeType.
		type = #remove ifTrue: [thisMD removeKey: selector].
		type = #add ifTrue: [thisMD at: selector put: changeRecord currentMethod].
		type = #change ifTrue: [thisMD at: selector put: changeRecord currentMethod].
		].

	"Replace the original organization (and comment)."
	priorOrganization := self realClass organization.
	thisOrganization elementArray copy do:
		[:sel | (thisMD includesKey: sel) ifFalse: [thisOrganization removeElement: sel]].
	#(DoIt DoItIn:) do: [:sel | thisMD removeKey: sel ifAbsent: []].
	thisOrganization elementArray size = thisMD size ifFalse:
		[elements := thisOrganization elementArray asSet.
		thisMD keysDo:
			[:sel | (elements includes: sel) ifFalse:
				[thisOrganization classify: sel
					under: (priorOrganization categoryOfElement: sel)]]].
	self realClass organization: thisOrganization.


