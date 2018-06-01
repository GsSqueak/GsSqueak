loading
startDownload
	"Start downloading unloaded resources"
	self stopDownload.
	unloaded isEmpty ifTrue:[^self].
	self loadCachedResources.
	unloaded isEmpty ifTrue:[^self].
	stopFlag := false.
	stopSemaphore := Semaphore new.
	loaderProcess := [self loaderProcess] newProcess.
	loaderProcess priority: Processor lowIOPriority.
	loaderProcess resume.