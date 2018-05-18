I am the main way that a process may pause for some amount of time.  The simplest usage is like this:

	(Delay forSeconds: 5) wait.

An instance of Delay responds to the message 'wait' by suspending the caller's process for a certain amount of time. The duration of the pause is specified when the Delay is created with the message forMilliseconds: or forSeconds:. A Delay can be used again when the current wait has finished. For example, a clock process might repeatedly wait on a one-second Delay.

A delay in progress when an image snapshot is saved is resumed when the snapshot is re-started.
For a more complex example, see  #testDelayOf:for:rect: .

A word of advice:
This is THE highest priority code which is run in Squeak, in other words it is time-critical. The speed of this code is critical for accurate responses, it is critical for network services, it affects every last part of the system.

In short: Don't fix it if it ain't broken! This code isn't supposed to be beautiful, it's supposed to be fast! The reason for duplicating code is to make it fast. The reason for not using ifNil:[]ifNotNil:[] is that the compiler may not inline those. Since the effect of changes are VERY hard to predict it is best to leave things as they are for now unless there is an actual need to change anything


Instance Variables
	beingWaitedOn:		<UndefinedObject|Boolean>
	delayDuration:			<Integer>
	delaySemaphore:		<Semaphore>
	resumptionTime:		<Integer>

beingWaitedOn
	- this is set when the delay is being waited on or is unscheduled.

delayDuration
	- the duration of the delay in milliseconds

delaySemaphore
	- the semaphore used to suspend process(es) waiting on this delay

resumptionTime
	- the value of the UTC miscrosecond clock at which the delay should resume processes waiting on it'