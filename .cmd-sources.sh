#!/bin/bash

export MSYS_NO_PATHCONV=1 # needed for git bash on windows
HELP='These are the commands supported:\n'
GENERAL_INFO=''
H_COLOR='\e[1;36m'
R_COLOR='\e[0m'
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
	HELP=$HELP$1'\n\n'
}

function addGI {
	GENERAL_INFO=$GENERAL_INFO$1'\n'
}

function highlight {
	echo $H_COLOR$1$R_COLOR
}
