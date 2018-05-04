C code generator
emitExportsOn: aStream
	"Store all the exported primitives in a form to be used by internal plugins"
	| prefix |
	aStream nextPutAll:'

#ifdef SQUEAK_BUILTIN_PLUGIN';cr.

	aStream nextPutAll:'

void* ', pluginName,'_exports[][3] = {'.
	prefix := '"', pluginName,'"'.
	self exportedPrimitiveNames do:[:primName|
		aStream cr;
			nextPutAll:'	{'; 
			nextPutAll: prefix; 
			nextPutAll:', "'; 
			nextPutAll: primName; 
			nextPutAll:'", (void*)'; 
			nextPutAll: primName;
			nextPutAll:'},'.
	].
	aStream nextPutAll:'
	{NULL, NULL, NULL}
};
'.
	aStream nextPutAll:'

#endif /* ifdef SQ_BUILTIN_PLUGIN */

'.