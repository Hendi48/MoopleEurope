@echo off
@title MoopleDEV's settings creator
set CLASSPATH=.;dist\*
java -Xmx100m net.server.CreateSettings
pause