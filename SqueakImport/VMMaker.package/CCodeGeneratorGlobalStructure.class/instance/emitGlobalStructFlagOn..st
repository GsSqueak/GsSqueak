C code generator
emitGlobalStructFlagOn: aStream
	"Define SQ_USE_GLOBAL_STRUCT before including the header."

	aStream
		nextPutAll: '#if ';
		nextPutAll: structDefDefine; cr;
		nextPutAll: '# define SQ_USE_GLOBAL_STRUCT 1'; cr;
		nextPutAll: '#else'; cr;
		nextPutAll: '# define SQ_USE_GLOBAL_STRUCT 0'; cr;
		nextPutAll: '#endif'; cr;
		cr