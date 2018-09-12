for file in $(find $@ \! -name *.DS_Store -type f -print0 -maxdepth 1)
do
    createdate=$(exiftool -d %Y-%m-%d -DateTimeOriginal -S -s $file)
    model=$(exiftool -Model -S -s $file)
    lens=$(exiftool -LensModel -S -s $file)
    lens=${lens//\// }

    if [ ! -d "$createdate/$model/$lens" ]; then
        mkdir -p "$createdate/$model/$lens"
    fi
    mv $file "$createdate/$model/$lens/$(basename $file)"
done
