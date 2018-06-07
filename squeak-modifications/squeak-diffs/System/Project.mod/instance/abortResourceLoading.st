resources
abortResourceLoading
	"Abort loading resources"
	resourceManager ifNil:[^self].
	resourceManager stopDownload.