#!/usr/bin/env bash

#
# Set Colors
#

bold="\e[1m"
dim="\e[2m"
underline="\e[4m"
reset="\e[0m"
red="\e[31m"
green="\e[32m"
blue="\e[34m"

#
# Common Output Styles
#

h1() {
	printf "\n${bold}${underline}%s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
h2() {
	printf "\n${bold}%s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
info() {
	printf "${dim}➜ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
success() {
	printf "${green}✔ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
error() {
	printf "${red}${bold}✖ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
warnError() {
	printf "${red}✖ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
warnNotice() {
	printf "${blue}✖ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
note() {
	printf "\n${bold}${blue}Note:${reset} ${blue}%s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
withinBlock() {
	printf " --- %s\n" "$(echo "$@" | sed '/./,$!d')"
}

# Runs the specified command and logs it appropriately.
#   $1 = command
#   $2 = (optional) error message
#   $3 = (optional) success message
#   $4 = (optional) global variable to assign the output to
run_command() {
	command="${1:-}"
	info "$command"
	error_message="${2:-}"
	success_message="${3:-}"
	gvar="${4:-}"
	exec 5>&1
	output="$(eval "${command}" 2>&1 | tee >(cat - >&5); exit "${PIPESTATUS[0]}")"
	ret_code=$?

	if [[ ${ret_code} != 0 ]]; then
		if [[ -n "$error_message" ]]; then
			error "$error_message"
		fi
		exit ${ret_code}
	fi
	if [[ -n "$success_message" ]]; then
		success "$success_message"
	fi
	if [[ -n "$gvar" ]]; then
		eval "$gvar='$output'"
	fi
}

# Compare version numbers
# Returns 0 when numbers match, or when given is greater than expected
# Returns 2 or when given is less than expected
#
# Usage:
# 	$1 = given
# 	$2 = expected
#		-e = (optional) require an exact match
#
# vercomp $given $expected
# vercomp "2.1.3" "2.2.0"
compare_versions() {
	local exact_match_only
	exact_match_only=0
	OPTIND=1
	while getopts ":e" opt; do
		case $opt in
			e)
				exact_match_only=1
				shift $((OPTIND-1))
				;;
			\?)
				echo "Invalid option: -$OPTARG" >&2
				;;
		esac
	done

	local given
	local expected
	given="${1:-}"
	expected="${2:-}"
	if [[ "${given}" == "${expected}" ]]; then
		return 0
	elif [[ $exact_match_only -eq 1 ]]; then
		return 2
	fi
	local IFS=.
	local i ver1=($given) ver2=($expected)

	# fill empty fields in ver1 with zeros
	for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
	do
		ver1[i]=0
	done

	for ((i=0; i<${#ver1[@]}; i++))
	do
		if [[ -z ${ver2[i]} ]]
		then
			# fill empty fields in ver2 with zeros
			ver2[i]=0
		fi
		if ((10#${ver1[i]} > 10#${ver2[i]}))
		then
			return 0
		fi
		if ((10#${ver1[i]} < 10#${ver2[i]}))
		then
			return 2
		fi
	done
	return 0
}

get_version_for_plugin() {
	local plugin_name="$1"

	local asdf_version
	asdf_version="$(parse_asdf_version_file "./.tool-versions" "$plugin_name")"
	if [ -n "$asdf_version" ]; then
		echo "$asdf_version"
		return 0
	fi
}

parse_asdf_version_file() {
	local file_path=$1
	local plugin_name=$2

	if [ -f "$file_path" ]; then
		local version
		version=$(strip_tool_version_comments "$file_path" | grep "^${plugin_name} " | sed -e "s/^${plugin_name} //")
		if [ -n "$version" ]; then
			echo "$version"
			return 0
		fi
	fi
}

strip_tool_version_comments() {
	local tool_version_path="$1"

	while IFS= read -r tool_line || [ -n "$tool_line" ]; do
		# Remove whitespace before pound sign, the pound sign, and everything after it
		new_line="$(echo "$tool_line" | cut -f1 -d"#" | sed -e 's/[[:space:]]*$//')"

		# Only print the line if it is not empty
		if [[ -n "$new_line" ]]; then
			echo "$new_line"
		fi
	done <"$tool_version_path"
}

error_message_for_binary_missing() {
	local binary
	local documentation_url
	local version
	binary="${1:-}"
	documentation_url="${2:-}"
	version="$(get_version_for_plugin "${binary}")"
	read -r -d '' MSG <<- EOM
		${red}${bold}✖ ${binary} ${version} isn't installed on your system.${reset}

		You can install it with:
		  asdf plugin-add ${binary} && asdf install

		Follow the instructions at ${documentation_url} for other options

		${red}Once ${binary} ${version} has been installed, run bin/setup to continue${reset}
	EOM
	printf "%b" "$MSG"
}

error_message_for_version_mismatch() {
	local binary
	local documentation_url
	local current_version
	local expected_version
	binary="${1:-}"
	documentation_url="${2:-}"
	current_version="${3:-}"
	expected_version="$(get_version_for_plugin "${binary}")"
	read -r -d '' MSG <<- EOM
		${red}${bold}✖ Your current ${binary} version ${current_version} does not match the expected ${binary} version ${expected_version}${reset}

		You can install it with:
		  asdf plugin-add ${binary} && asdf install

		Follow the instructions at ${documentation_url} for other options

		${red}Once ${binary} ${expected_version} has been installed, run bin/setup to continue${reset}
	EOM
	printf "%b" "$MSG"
}
