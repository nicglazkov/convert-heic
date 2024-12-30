convert_heic() {
  setopt +o nomatch  # Prevent zsh from erroring on no matches
  for file in *.HEIC *.heic; do
    [ -f "$file" ] || continue
    sips -s format png "$file" --out "${file%.*}.png" && \
    rm "$file" && \
    [ -f "${file%.*}.mp4" ] && rm "${file%.*}.mp4"
  done
}
