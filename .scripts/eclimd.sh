mkdir $1 && cd $_
gradle setupBuild --type java-library
perl -i -lne 'print $_;print "apply plugin: \x27eclipse\x27" if(/apply/);' build.gradle    
gradle eclipse
