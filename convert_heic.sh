convert_heic() {
  for file in *.HEIC *.heic(N); do
    [ -f "$file" ] || continue
    sips -s format png "$file" --out "${file%.*}.png" && \
    rm "$file" && \
    [ -f "${file%.*}.mp4" ] && rm "${file%.*}.mp4"
  done
}
