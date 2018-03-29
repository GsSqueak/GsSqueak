startTopaz @1 -l << EOF
set u SystemUser p swordfish
login
run
SystemObjectSecurityPolicy worldAuthorization: #write.
(AllUsers userWithId: 'DataCurator') addPrivilege: #'CompilePrimitives'.
%
commit
logout
exit
EOF
todeIt @1 mc load BPBugFixes filetree://path/to/BP2017RH1/tools/bugfixes
todeIt @1 mc load MCEnvSwitch filetree://path/to/BP2017RH1/tools/MCEnvSwitch
startTopaz @1 -l << EOF
login
category: 'accessing'
classmethod: MCEnv
current
  ^ Value ifNil: [ Value := 0 ]
%
commit
logout
exit
EOF
todeIt @1 mc load MCEnvSwitch filetree://path/to/BP2017RH1/tools/MCEnvSwitch
startTopaz @1 -l << EOF
login
run
MCEnv set: 7
%
commit
logout
exit
EOF
todeIt @1 mc load SqueakParser filetree://path/to/BP2017RH1/parser
