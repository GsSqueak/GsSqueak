createStone $1 3.5.0
startTopaz $1 -l << EOF
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
todeIt $1 mc load BPBugFixes filetree://$2/BP2017RH1/tools/bugfixes
todeIt -D $1 mc load MCEnvSwitch filetree://$2/BP2017RH1/tools/MCEnvSwitch
startTopaz $1 -l << EOF
login
run
MCEnv set: 7
%
commit
logout
exit
EOF
todeIt $1 mc load SqueakParser filetree://$2/BP2017RH1/parser
