-Etoys-form dictionary
mergeGraphicsFrom: aDictionary 
	"aDictionary is assumed to hold associations of the form <formName>
	-> <form>. Merge the graphics held by that dictionary into the
	internal FormDictionary, overlaying any existing entries with the ones
	found in aDictionary"
	aDictionary
		associationsDo: [:assoc | self saveForm: assoc value atKey: assoc key
			"works ok even if keys in aDictionary are strings rather than
			symbols "]