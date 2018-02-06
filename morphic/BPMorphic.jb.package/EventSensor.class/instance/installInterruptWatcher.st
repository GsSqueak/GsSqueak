user interrupts
installInterruptWatcher
  "Initialize the interrupt watcher process. Terminate the old process if
	any. "

  "Sensor installInterruptWatcher"

  InterruptWatcherProcess ifNotNil: [ InterruptWatcherProcess terminate ].
  InterruptSemaphore := TransientSemaphore new.
  InterruptWatcherProcess := [ self userInterruptWatcher ]
    forkAt: Processor lowIOPriority.
  self primInterruptSemaphore: InterruptSemaphore