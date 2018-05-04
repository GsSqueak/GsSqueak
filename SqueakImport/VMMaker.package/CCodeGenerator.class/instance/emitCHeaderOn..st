C code generator
emitCHeaderOn: aStream
	"Write a C file header onto the given stream."

	aStream nextPutAll: '/* '.
	aStream nextPutAll: VMMaker headerNotice.
	aStream nextPutAll: ' */'; cr;
		nextPutAll: (self fileHeaderVersionStampForSourceClass: vmClass);
		cr; cr.
	self emitGlobalStructFlagOn: aStream.
	aStream nextPutAll: '#include "sq.h"'; cr.

	"Additional header files"
	self emitHeaderFilesOn: aStream.

	"Default definitions for optional functions, provided for backward compatibility"
	self emitDefaultMacrosOn: aStream.

	aStream nextPutAll: '
#include "sqMemoryAccess.h"

sqInt printCallStack(void);
void defaultErrorProc(char *s) {
	/* Print an error message and exit. */
	static sqInt printingStack = false;

	printf("\n%s\n\n", s);
	if (!printingStack) {
		/* flag prevents recursive error when trying to print a broken stack */
		printingStack = true;
		printCallStack();
	}
	exit(-1);
}
'.
	aStream cr.