#!/bin/bash

# Check if Git is installed
if ! command -v git >/dev/null; then
    echo "Git is not installed. Aborted."
    exit 1
fi

# Rest of the script
read -p "This will permanently delete your current Vim setup. Are you sure you want to continue? [y/N]: " yn
case $yn in
    [Yy]* ) ;;
    * ) echo "Aborted."; exit 0;;
esac

# Get absolute path of repository
repo_path=$(dirname "$(realpath "${BASH_SOURCE[0]}")")

# Delete existing Vim setup
echo "Deleting existing Vim setup..."
rm -rf "$HOME/.vim";
rm -f "$HOME/.vimrc";
echo "Existing Vim setup has been deleted!"

# Copy new Vim setup
echo "Copying new Vim setup..."
cp -r "$repo_path/.vim" "$HOME"
cp "$repo_path/.vimrc" "$HOME"
mkdir "$HOME/.vim/undodir"
echo "New Vim setup has been copied!"

# Install plugins
echo "Installing plugins..."
while read line; do
	# Skip comments and empty lines
	[[ $line == \#* || -z $line ]] && continue

	# Extract plugin type, name and version from line
	plg_type=$(echo "$line" | cut -d' ' -f1)
	owner=$(echo "$line" | cut -d' ' -f2)
	name=$(echo "$line" | cut -d' ' -f3)
	version=$(echo "$line" | cut -d' ' -f4)

	# Clone plugin
	echo "Cloning $name..."
	case $plg_type in
		"ps" )
			git clone --depth=1 --branch "$version" "https://github.com/$owner/$name.git" "$HOME/.vim/pack/primary_plugins/start/$name";;
		"po" )
			git clone --depth=1 --branch "$version" "https://github.com/$owner/$name.git" "$HOME/.vim/pack/primary_plugins/opt/$name";;
		"ts" )
			git clone --depth=1 --branch "$version" "https://github.com/$owner/$name.git" "$HOME/.vim/pack/theme_plugins/start/$name";;
		"to" )
			git clone --depth=1 --branch "$version" "https://github.com/$owner/$name.git" "$HOME/.vim/pack/theme_plugins/opt/$name";;
		* ) ;;
	esac
	echo "$name has been cloned!"

done < "$repo_path/plugins.txt"

echo "Installation complete."
