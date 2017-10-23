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
# createStone -u https://github.com/HPI-SWA-Lab/BP2017RH1/blob/issue_3/dhenrich/tODEIntegration/projects/GsSqueak.ston -i GsSqueak -l GsSqueak GsSqueak 3.4.0
createStone -i GsSqueak -l GsSqueak GsSqueak 3.4.0
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/bin/installGsSqueak $GS_HOME/server/stones/GsSqueak
cd $GS_HOME/server/stones/GsSqueak
./installGsSqueak
```

### Install in existing stone

tODE:

```sh
project load --install GsSqueak
```
