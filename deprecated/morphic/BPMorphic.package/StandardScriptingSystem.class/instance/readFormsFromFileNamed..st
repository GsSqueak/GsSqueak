-Etoys-form dictionary
readFormsFromFileNamed: aFileName 
	"Read the entire FormDictionary in from a designated file on disk"
	| _gsSqueakTemp_aReferenceStream |
	_gsSqueakTemp_aReferenceStream := ReferenceStream fileNamed: aFileName.
	FormDictionary := _gsSqueakTemp_aReferenceStream next.
	_gsSqueakTemp_aReferenceStream close
	"ScriptingSystem readFormsFromFileNamed: 'EToyForms22Apr'"