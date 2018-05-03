garbage collection
postGCAction: fullGCFlag
	"Shrink free memory and signal the gc semaphore."
	| freeSizeNow |

	freeSizeNow := self freeSize.
	(freeSizeNow > self getShrinkThreshold
	 and: [freeSizeNow > self getGrowHeadroom]) ifTrue:
		["Attempt to shrink memory after successfully reclaiming lots of memory"
		 self shrinkObjectMemory: freeSizeNow - self getGrowHeadroom].

	interpreter signalSemaphoreWithIndex: self getGcSemaphoreIndex