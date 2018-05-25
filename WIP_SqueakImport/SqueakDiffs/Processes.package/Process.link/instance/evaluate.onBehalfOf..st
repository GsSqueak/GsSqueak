*Kernel-Processes-private
evaluate: aBlock onBehalfOf: aProcess
	"Executing on behalf of other Processes is not supported in GsSqueak"
	self shouldNotImplement
