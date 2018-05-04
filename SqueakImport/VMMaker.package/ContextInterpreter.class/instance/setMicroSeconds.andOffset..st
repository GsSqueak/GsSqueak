utilities
setMicroSeconds: microSeconds andOffset: utcOffset
	"A default substitute for unimplemented ioUtcWithOffset external function."
	<var: #microSeconds type: 'sqLong *'>
	<var: #utcOffset type: 'int *'>

	self flag: #toRemove. "after implementing ioUtcWithOffset in support code for all platforms"

	^ -1

	"The corresponding platform support function for a GNU unix system is:
	sqInt ioUtcWithOffset(sqLong *microSeconds, int *offset)
	{
		struct timeval timeval;
		if (gettimeofday(&timeval, NULL) == -1) return -1;
	 	long long seconds = timeval.tv_sec;
		suseconds_t usec = timeval.tv_usec;
		*microSeconds = seconds * 1000000 + usec;
		*offset = localtime(&seconds)->tm_gmtoff;
		return 0;
	}"
