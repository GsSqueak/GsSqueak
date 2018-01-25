*SqProcess
remove: aGsProcess ifAbsent: aBlock
 "GsSqueak compatibility"

 (self @env0: _unschedule: aGsProcess) ifNil: aBlock.
 ^aGsProcess
