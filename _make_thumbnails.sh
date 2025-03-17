for file in images/*.{jpg,png}; do
    [ ! -f "tn/$file" ] && magick "$file"  -thumbnail 250x250 "tn/$file"
done

cp images/*.gif tn/images/
