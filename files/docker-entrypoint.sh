#!/bin/bash

#[[ -s "/home/developer/.sdkman/bin/sdkman-init.sh" ]] && source "/home/developer/.sdkman/bin/sdkman-init.sh"
#sdk use grails 3.1.7

if [ $1 == "GRADLE" ]; then

	echo "Executing gradle"
	./gradlew "${@:2}"

else

	echo "Executing grails using variables $@"
	echo "Using GRAILS_HOME=$GRAILS_HOME"
	grails "$@"

fi


