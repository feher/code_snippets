#
# Usage: env_list_append /etc/environment PATH "/whatever/new/path"
#
# Appends $3 to the env var called $2 in the file $1.
# The $1 file should be a simple KEY="VALUE" file.
#
function env_list_append {
  ENV_FILE="$1"
  ENV_NAME="$2"
  ENV_VAL="$3"
  if grep "^$ENV_NAME=.*$" "$ENV_FILE" 2>&1 > /dev/null; then
    sed -i "s,^$ENV_NAME=\"\(.*\)\"$,$ENV_NAME=\"\1:$ENV_VAL\",g" "$ENV_FILE"
  else
    echo "$ENV_NAME=\"$ENV_VAL\"" >> "$ENV_FILE"
  fi
}
