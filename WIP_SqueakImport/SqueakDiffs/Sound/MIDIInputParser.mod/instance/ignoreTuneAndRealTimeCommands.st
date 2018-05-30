midi filtering
ignoreTuneAndRealTimeCommands
	"Ignore tuning requests and real-time commands."

	cmdActionTable at: 246 put: #ignoreZero:.	"tune request"
	cmdActionTable at: 248 put: #ignoreZero:.	"timing clock"
	cmdActionTable at: 250 put: #ignoreZero:.	"start"
	cmdActionTable at: 251 put: #ignoreZero:.		"continue"
	cmdActionTable at: 252 put: #ignoreZero:.	"stop/Clock"
	cmdActionTable at: 254 put: #ignoreZero:.	"active sensing"
	cmdActionTable at: 255 put: #ignoreZero:.	"system reset"
