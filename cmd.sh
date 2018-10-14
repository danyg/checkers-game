#!/bin/bash
source .cmd-sources.sh
###############################################################################
# COMMANDS

addHelp "$(highlight bash)\topens a bash command line to the docker container"
function cmd_bash {
	docker-compose $DOCKERC_FILES run --rm core /bin/bash
}

addHelp "$(highlight build)\trebuilds docker-compose services"
function cmd_build {
	docker-compose $DOCKERC_FILES build
}

addHelp "$(highlight up)\tstarts docker-compose services"
function cmd_up {
	docker-compose $DOCKERC_FILES up
}

addHelp "$(highlight down)\tStops docker-compose services"
function cmd_down {
	docker-compose $DOCKERC_FILES down
}

addHelp "$(highlight test)\tRuns the tests"
function cmd_test {
	setDevelEnv
	docker-compose $DOCKERC_FILES run --rm core /bin/bash -c 'npm test'
}

addHelp "$(highlight help)\tshows this help"
function cmd_help {
	if [[ ! -z "$1" ]]; then
		HELP=$1'\n\n'$HELP
	fi
	echo -e $HELP
}

###############################################################################
# MAIN
checkEnv
addGI "$(highlight DOCKERC_FILES)=${DOCKERC_FILES}"

echo -e $GENERAL_INFO
if [ "$(type -t cmd_${1})" = 'function' ]; then
	cmd_${1} $2 $3 $4 $5 $6 $7 $8 $9
else
	if [ -z "$1" ]; then
		cmd_help
	else
		cmd_help "Command $(highlight $1) not recognised."
	fi
fi
