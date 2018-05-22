read, write, position
sync
	"Really, really, flush pending changes"
	^self flush; primSync: fileID