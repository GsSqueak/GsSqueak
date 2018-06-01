testing
isSemaphoreSignaled
	"Return true if the associated semaphore is currently signaled. This information can be used to determine whether the download has finished given that there is no other process waiting on the semaphore."
	^semaphore isSignaled