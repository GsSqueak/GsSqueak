private
unscheduleEvent
	AccessProtect critical:[
		FinishedDelay := self.
		TimingSemaphore signal.
	].