preferences
maximumReadSemaphoreWaitTimeout

	<preference: 'Maximum readSemaphore wait timeout.'
	category: 'general'
	description: 'The number of milliseconds for which we''ll wait for the readSemaphore of a Socket to signal. This is used by a workaround for a VM bug. Lower values use more CPU, but result in less delay in extremal cases.'
	type: #Number>
	^MaximumReadSemaphoreWaitTimeout ifNil: [ 500 ]