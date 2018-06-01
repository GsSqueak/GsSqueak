*Kernel-Processes-initialize-release
resumeProcess: aProcess
	"Remove the given process from the list of waiting processes (if it's there) and resume it.  This is used when a process asked for its wait to be timed out."

	| process |
	process := self _env0 semaphore _env0 removeIdentical: aProcess ifAbsent: [nil].
	process ifNotNil: [process resume].
