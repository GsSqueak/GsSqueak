A Mutex is a light-weight MUTual EXclusion object being used when two or more processes need to access a shared resource concurrently. A Mutex grants ownership to a single process and will suspend any other process trying to aquire the mutex while in use. Waiting processes are granted access to the mutex in the order the access was requested.

A Mutex allows the owning process to reenter as many times as desired.  For example a Mutex will not block when trying the following:
	| m |
	m := Mutex new.
	m critical: [m critical: [#yes]]
whereas a Semaphore will deadlock:
	| s |
	s := Semaphore forMutualExclusion.
	s critical: [s critical: [#no]]

Instance variables:
	owner		<Process|UndefinedObject>		The process owning the mutex