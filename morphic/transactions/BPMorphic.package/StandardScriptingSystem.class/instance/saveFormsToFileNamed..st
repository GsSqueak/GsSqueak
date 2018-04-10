-Etoys-form dictionary
saveFormsToFileNamed: aFileName 
	"Save the current state of form dictionary to disk for possible later
	retrieval "
	(ReferenceStream fileNamed: aFileName) nextPut: FormDictionary;
		 close
	"ScriptingSystem saveFormsToFileNamed:
	'SystemForms06May98.forms' "