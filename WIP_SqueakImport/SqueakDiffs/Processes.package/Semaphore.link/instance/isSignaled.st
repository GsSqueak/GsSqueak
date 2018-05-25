testing
isSignaled
	"Return true if this semaphore is currently signaled"
	^ self excessSignals > 0
