LIST=$(find . -type d \( -path ./nltk_data \
	-o -path ./anaconda3 \
	-o -path ./snap \
	-o -path ./.vscode \
	-o -path ./.cache \
	-o -path ./.local/lib/python2.7 \
	-o -path ./IdeaProjects \
	-o -path ./.local/share \
	-o -path ./R \
	-o -path ./.npm \
	-o -path ./.m2 \
	-o -path ./.IdeaIC2018.2 \
	-o -path ./.TinyTeX \
	-o -path ./.config/google-chrome \
	-o -path ./.config/Code \
	-o -path ./.dbus \
	-o -path ./node_modules \) -prune -o -print)

TOOPEN=$(echo "$LIST" | rofi -dmenu -p "File" -matching fuzzy -sort -columns 1 -no-levenshtein-sort)

exec xdg-open "$TOOPEN"
