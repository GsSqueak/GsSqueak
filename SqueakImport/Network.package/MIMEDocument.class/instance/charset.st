accessing
charset

	^ self contentTypeHeaderValue parameterAt: #charset ifAbsent: ['us-ascii']