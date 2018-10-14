#!/bin/bash
export MSYS_NO_PATHCONV=1 # needed for git bash on windows
HELP='These are the commands supported:\n'
GENERAL_INFO=''
H_COLOR='\e[1;36m'
R_COLOR='\e[0m'
DOCKERC_FILES='-f ./docker-compose.yaml'

case $ENV in
	development|devel)
		DOCKERC_FILES=$DOCKERC_FILES' -f ./docker-compose.devel.yaml'
		;;
esac

function fn_exists() {
	"$(type -t ${1})" = 'function'
}

function addHelp {
	HELP=$HELP$1'\n\n'
}

function addGI {
	GENERAL_INFO=$GENERAL_INFO$1'\n'
}

function highlight {
	echo $H_COLOR$1$R_COLOR
}

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

addHelp "$(highlight help)\tshow this help"
function cmd_help {
	if [[ ! -z "$1" ]]; then
		HELP=$1'\n\n'$HELP
	fi
	echo -e $HELP
}

###############################################################################
# MAIN
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
