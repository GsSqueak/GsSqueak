# GsSqueak/tODE integration

## Clone and setup GsSqueak

Bash:

```sh
cd $GS_HOME/shared/repos/tode
git fetch --all
git checkout appEnv_dev
git pull origin appEnv_dev
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
 
