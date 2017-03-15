#! /bin/bash

mkdir ~/Desktop/$1
mkdir ~/Desktop/$1/src
mkdir ~/Desktop/$1/src/main
mkdir ~/Desktop/$1/src/main/java
touch ~/Desktop/$1/src/main/java/App.java
printf "public class App{\n\tpublic static void main(String[] args) {\n\t}\n}"> ~/Desktop/$1/src/main/java/App.java
touch ~/Desktop/$1/src/main/java/$1.java
printf "import java.util.ArrayList;\nimport java.util.List;\n\npublic class $1{\n\n}" > ~/Desktop/$1/src/main/java/$1.java
mkdir ~/Desktop/$1/src/test
mkdir ~/Desktop/$1/src/test/java
touch ~/Desktop/$1/src/test/java/$1Test.java
printf "import org.junit.*;\nimport static org.junit.Assert.*;" > ~/Desktop/$1/src/test/java/$1Test.java
printf "\n\npublic class $1Test {\n\n}" >> ~/Desktop/$1/src/test/java/$1Test.java
touch ~/Desktop/$1/build.gradle
printf "apply plugin: 'java'\napply plugin: 'application'\n\narchivesBaseName =\nversion = '1.0'\nmainClassName = \n\nrepositories {\n\tmavenCentral()\n}\n\ndependencies {\n\ttestCompile group: 'junit', name: 'junit', version: '4.+'\n}" > ~/Desktop/$1/build.gradle
touch ~/Desktop/$1/README.md
touch ~/Desktop/$1/.gitignore
# Add gitignore contents
# printf ~/Desktop/$1/.gitignore
