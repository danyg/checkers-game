#!/bin/bash

export MSYS_NO_PATHCONV=1 # needed for git bash on windows
COMMANDS=''
HELP='These are the supported commands:\n'
GENERAL_INFO=''
H_COLOR='\x1b[1;36m'
R_COLOR='\x1b[0m'
DEFAULT_DOCKERC_FILES='-f ./docker-compose.yaml'

function setDevelEnv {
	DOCKERC_FILES=$DEFAULT_DOCKERC_FILES' -f ./docker-compose.devel.yaml'
}

function checkEnv {
	case $ENV in
		development|devel)
			setDevelEnv
			;;
		*)
			DOCKERC_FILES=$DEFAULT_DOCKERC_FILES
	esac
}

function fn_exists() {
	"$(type -t ${1})" = 'function'
}

function addHelp {
	COMMANDS=$COMMANDS" ${1}"
	HELP=$HELP"$(highlight $1)\t$2\n\n"
}

function addGI {
	GENERAL_INFO=$GENERAL_INFO$1'\n'
}

function highlight {
	echo $H_COLOR$@$R_COLOR
}

addHelp autocomplete "Sets the autocomplete in your local instance of bash, usage: \n\t\t`pwd`$ $(highlight source $0 autocomplete)"
function cmd_autocomplete {
	complete -W "${COMMANDS}" _
}
