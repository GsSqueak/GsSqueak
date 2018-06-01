loading
stopDownload
	"Stop downloading unloaded resources"
	loaderProcess ifNil:[^self].
	stopFlag := true.
	stopSemaphore signal.
	[loaderProcess == nil] whileFalse:[(Delay forMilliseconds: 10) wait].
	stopSemaphore := nil.