accessing
run
  "Suspend current process and execute self instead"

  | proc |
  proc := Processor activeProcess.
  [ 
  self priority: Processor highestPriority.
  proc suspend.
  self resume.
  proc resume ]
    forkAt: Processor highestPriority
