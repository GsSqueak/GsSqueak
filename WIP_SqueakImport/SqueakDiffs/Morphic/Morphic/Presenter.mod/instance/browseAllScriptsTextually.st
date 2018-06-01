stubs
browseAllScriptsTextually
	"Open a method-list browser on all the scripts in the project"

	| aList aMethodList |
	self flushPlayerListCache.  "Just to be certain we get everything"

	(aList := self uniclassesAndCounts) size == 0 ifTrue: [^ self inform: 'there are no scripted players' translated].
	aMethodList := OrderedCollection new.
	aList do:
		[:aPair | aPair first addMethodReferencesTo: aMethodList].
	aMethodList size > 0 ifFalse: [^ self inform: 'there are no scripts in this project!' translated].
	
	SystemNavigation new 
		browseMessageList: aMethodList 
		name: 'All scripts in this project' 
		autoSelect: nil

"
ActiveWorld presenter browseAllScriptsTextually
"