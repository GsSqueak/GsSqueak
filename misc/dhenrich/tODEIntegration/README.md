# GsSqueak/tODE integration

## Clone and setup GsSqueak

Bash:

```sh
cd $GS_HOME/shared/repos/tode
# as of today (06-11-2017, commit 77cf068) appEnv_dev merged into tode master branch
#git fetch --all
#git checkout appEnv_dev
#git pull origin appEnv_dev
cd $GS_HOME/shared/repos/glass
git fetch --all
git checkout dev
git pull origin dev
cd $GS_HOME/shared/repos
git clone git@github.com:HPI-SWA-Lab/BP2017RH1.git
cd BP2017RH1
git checkout master
cd $GS_HOME/shared/repos
mkdir gs_port
cd gs_port
git clone https://github.com/GsDevKit/ston.git
cd ston
git checkout gs_port
cd $GS_HOME
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/projects/GsSqueak.ston $GS_HOME/sys/local/server/projects
```

Because of an apparent tode client update bug, you need to delete and re-create the tode client:

```
deleteClient tode
createClient tode
```

### Create a GsSqueak_test stone - for testing the GsSqueak environment

Bash:

```sh
createStone GsSqueak_test 3.4.0
devKitCommandLine todeIt GsSqueak_test << EOF
  mount $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/tode /home gsSqueak
  /home/gsSqueak/prep
EOF
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/bin/installGsSqueak $GS_HOME/server/stones/GsSqueak_test
cd $GS_HOME/server/stones/GsSqueak_test
./installGsSqueak
todeIt GsSqueak_test /home/gsSqueak/createSessionDescription --stone=GsSqueak_test
todeIt GsSqueakUser mount $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/tode /home gsSqueak
```

Log into the stone using `GsSqueak_test` session description to work directly in the the tODE environment (the 'GsSqueak-Tode-Extensions' package for example). To develop the other packages ('Cypress-Environmental-Tools' and 'GsSqueak-ProofOfConcept0') you need to create a separate stone --- these packages are not loaded into the tODE environment in GsSqueak_test.

Log into the stone using `GsSqueakUser` session description (created by the /home/gsSqueak/createSessionDescription tODE sdcript) to work in the GsSqueak environemt itself.

### Create a GsSquak_dev stone - for ongoing development of support tools

The interesting packages like Cypress-Environmental-Tools and GsSqueak-ProofOfConcept0 are installed as SystemUser and as such aren't configured for easy development ... so to do development on those or any other packages packages, it's best to load them into a separate stone:


```sh
createStone -i GsSqueak -l GsSqueak GsSqueak_dev 3.4.0
```
 
## Notes for use with GemStone 3.5.0
still needs a bit of testing ...
```
# 3.5.0
createStone GsSqueak_test_350 3.5.0
devKitCommandLine todeIt GsSqueak_test_350 << EOF
  mount @/sys/stone/dirs/GsSqueak/dhenrich/tODEIntegration/tode /home gsSqueak
  /home/gsSqueak/prep
  /home/gsSqueak/installSymbolCodeLibrianSymbolList
EOF
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/bin/installGsSqueak_350 $GS_HOME/server/stones/GsSqueak_test_350
cd $GS_HOME/server/stones/GsSqueak_test_350
./installGsSqueak_350
todeIt GsSqueak_test_350 /home/gsSqueak/createSessionDescription --stone=GsSqueak_test_350
todeIt GsSqueakUser mount $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/tode /home gsSqueak
```
The class **GsSqueakProofOfConcept** contains examples of loading packages as *SystemUser* and *GsSqueakUser* ... which is equivalent to what was available in 3.4.0
