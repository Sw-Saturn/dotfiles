#!/bin/bash

# Number of parallel processes to run
PARALLEL_JOBS=8

function move_file {
    # Get all metadata at once to avoid multiple exiftool calls
    local metadata
    metadata=$(exiftool -d %Y-%m-%d -DateTimeOriginal -Model -LensModel -S -s "$1")

    # Parse metadata using a while loop to handle newline-separated output
    local createdate=""
    local model=""
    local lens=""

    # Read each line of metadata
    while IFS= read -r line; do
        case "$line" in
        "") continue ;; # 空行をスキップ
        *)
            if [[ -z "$createdate" ]]; then
                createdate=$(echo "$line" | xargs) # 最初の行を作成日として取得
            elif [[ -z "$model" ]]; then
                model=$(echo "$line" | xargs) # 2行目をモデルとして取得
            else
                lens=$(echo "$line" | xargs) # 3行目をレンズとして取得
            fi
            ;;
        esac
    done <<<"$metadata"

    if [ -z "$createdate" ]; then
        return
    fi

    # Clean up lens variable
    lens=${lens//\// }

    # Determine target directory
    local target_dir
    if [ -z "$model" ]; then
        target_dir="$createdate"
    elif [ -z "$lens" ]; then
        target_dir="$createdate/$model"
    else
        target_dir="$createdate/$model/$lens"
    fi

    # Create target directory if it doesn't exist (once per path)
    mkdir -p "$target_dir"

    # Move the file
    mv "$1" "$target_dir/$(basename "$1")"
}

export -f move_file

# Find all files in current directory, excluding .DS_Store
find . ! -name "*.DS_Store" -type f -maxdepth 1 -print0 |
    xargs -0 -n1 -P$PARALLEL_JOBS -I {} bash -c 'move_file "{}"'

exit 0
