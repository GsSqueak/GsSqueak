changing process state
terminate
    <messageSendsInEnv: 0>
    
    "Do nothing if the process no longer exists (after a new session was started)"
    | q |
    q := self onQueue.
    (q == readyQueue or: [ q == suspendedSet or: [ q == waitingSet or: [ self waitingOn ~~ nil or: [ q == nil ]]]]) ifTrue: [
    	self terminate ]
