#!/usr/bin/env bash

CWD="$(pwd)"

# Transform arguments into their real paths
real_args=()
for arg in "$@"
do
    real_args+=("$(realpath "$arg")")
done

SCRIPT_DIR="$(dirname "$0")"
cd "$SCRIPT_DIR" || exit

# Expand '.' to the actual path
export PYTHONPATH=$(realpath '.')


if [[ "$OSTYPE" == "msys" ]]; then
    source .venv/Scripts/activate
else
    source .venv/bin/activate	
fi

cd $CWD

if [ ${#real_args[@]} -eq 0 ]
then
CMD="aider --browser"
else
CMD="aider --browser $(printf ' %q' "${real_args[@]}")"
fi

echo "== Running: $CMD"
bash -c "$CMD"


