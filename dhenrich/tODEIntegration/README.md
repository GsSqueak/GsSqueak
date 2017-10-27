# GsSqueak/tODE integration

## Clone and setup GsSqueak

Bash:

```sh
cd $GS_HOME/shared/repos/tode
git checkout dev
git pull origin dev
cd $GS_HOME/shared/repos
git clone git@github.com:HPI-SWA-Lab/BP2017RH1.git
cd BP2017RH1
git checkout issue_3
cd $GS_HOME
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/projects/GsSqueak.ston $GS_HOME/sys/local/server/projects
```

### Create a new stone

Bash:

```sh
createStone GsSqueak 3.4.0
devKitCommandLine todeIt GsSqueak << EOF
  mount @/sys/stone/dirs/GsSqueak/dhenrich/tODEIntegration/tode /home gsSqueak
  /home/gsSqueak/prep
EOF
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/bin/installGsSqueak $GS_HOME/server/stones/GsSqueak
cd $GS_HOME/server/stones/GsSqueak
./installGsSqueak
```

### Install in existing stone -- for development

The interesting packages like Cypress-Environmental-Tools and GsSqueak-ProofOfConcept0 are installed as SystemUser and as such aren't configured for easy development ... so to do development on those two packages, it's best to load them into a separate stone:


```sh
createStone -i GsSqueak -l GsSqueak GsSqueak_dev 3.4.0
```

