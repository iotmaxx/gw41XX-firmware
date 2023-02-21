#!/bin/bash

gh_token_get() {
        auth_header=(--header "Authorization: token $(<~/.gh_token)")
        wget "${auth_header[@]}" $1 -O -| ifne tee $2 > /dev/null
}

export -f gh_token_get

gh_token_extract() {
	transform=(--transform "s,/*[^/]*,$2,")
	tar xvzf $1 "${transform[@]}" -C $3
}

export -f gh_token_extract

