# GsSqueak/tODE integration

```sh
cd $GS_HOME/shared/repos/tode
git checkout dev
git pull origin dev
cd $GS_HOME
createStone -u https://github.com/HPI-SWA-Lab/BP2017RH1/blob/issue_3/dhenrich/tODEIntegration/projects/GsSqueak.ston -i GsSqueak -l GsSqueak GsSqueak 3.4.0
cp $GS_HOME/shared/repos/BP2017RH1/dhenrich/tODEIntegration/bin/installGsSqueak $GS_HOME/server/stones/GsSqueak
cd $GS_HOME/server/stones/GsSqueak
./installGsSqueak
```


