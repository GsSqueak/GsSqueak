-Etoys-form dictionary
readFormsFromFileNamed: aFileName andStoreIntoGlobal: globalName 
	"Read the a FormDictionary in from a designated file on disk and save
	it in the designated global"
	| _gsSqueakTemp_aReferenceStream |
	_gsSqueakTemp_aReferenceStream := ReferenceStream fileNamed: aFileName.
	Smalltalk at: globalName put: _gsSqueakTemp_aReferenceStream next.
	_gsSqueakTemp_aReferenceStream close
	"ScriptingSystem readFormsFromFileNamed:
	'SystemFormsFromFwdF.forms' andStoreIntoGlobal: #FormsTemp"
	"ScriptingSystem saveForm: (FormsTemp at:
	#StackElementDesignationHelp) atKey:
	#StackElementDesignationHelp "