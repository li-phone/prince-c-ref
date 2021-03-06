#!/bin/sh
baseDir=.
testDir=$baseDir/test
sourceDir=$baseDir/source
includeDir=$baseDir/include

#test conformance to C99
gcc -std=c99 $includeDir/prince_ref.h -c -o tmp
rm tmp

if [ -z ${CXX+x} ]; then CXX=c++; fi

#create the test binary
$CXX -Ofast -std=c++11 $testDir/main.cpp -I $includeDir -o prince-c-ref $*
