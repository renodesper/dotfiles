# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$@"
}

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@"
	else
		du $arg .[^.]* *
	fi
}

# Extract archives
function extract () {
    if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1;;
			*.tar.gz)	tar xzf $1;;
			*.tar.xz)	tar xJf $1;;
			*.tar)		tar xf $1;;
			*.bz2)		bunzip2 $1;;
			*.rar)		unrar e $1;;
			*.gz)		gunzip $1;;
			*.tar)		tar xf $1;;
			*.tbz2)		tar xjf $1;;
			*.tgz)		tar xzf $1;;
			*.zip)		unzip $1;;
			*.Z)		uncompress $1;;
			*.7z)		7z x $1;;
			*)     		echo "'$1' cannot be extracted via extract()";;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Create a new basic Java project using Gradle
function ngrad() {
	mkdir -p "$@" && cd "$@"
	gradle init --type java-library
	sed -i "/apply plugin: 'java'/a apply plugin: 'eclipse'" build.gradle
	gradle eclipse
	rm -rf src/main/java/Library.java
	rm -rf src/test/java/LibraryTest.java
	mkdir -p src/main/java/com/renodesper/"$@"
}

# Create a new basic Java project using Maven
function nmvn() {
	mvn archetype:generate -DgroupId=com.renodesper."$@" \
		-DartifactId="$@" \
		-DarchetypeArtifactId=maven-archetype-quickstart \
		-DinteractiveMode=false
	cd "$@" && mvn eclipse:eclipse
    sed -i 's|source>*</maven|source>1.7</maven|g' pom.xml
    sed -i 's|target>*</maven|target>1.7</maven|g' pom.xml
}
