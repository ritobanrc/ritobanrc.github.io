for file in images/*.{jpg,png,gif}; do
    [ ! -f "tn/$file" ] && magick "$file"  -thumbnail 250x250 "tn/$file"
done

