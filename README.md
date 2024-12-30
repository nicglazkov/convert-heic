# convert-heic

## **Overview**
The `convert_heic` script is a shell function designed to streamline the conversion of `.HEIC` (or `.heic`) image files to `.png` format. It also automatically deletes the original `.HEIC` file and any `.MP4` video file with the same base name after conversion.

---

## **Features**
1. Converts `.HEIC` (or `.heic`) files in the current directory to `.png` using the macOS `sips` command.
2. Deletes the original `.HEIC` file after successful conversion.
3. Deletes any `.MP4` file that shares the same base name as the `.HEIC` file.
4. Handles both uppercase and lowercase file extensions.
5. Safely skips over patterns if no matching files are found.

---

## **Prerequisites**
- macOS with the `sips` command (built-in on macOS).
- A shell environment using `zsh` (default on macOS).

---

## **Installation**

### **1. Add the Function to `.zshrc`**
1. Open your `.zshrc` file in a text editor:
   ```bash
   vim ~/.zshrc
   ```
2. Copy and paste the function below into the file:
   ```bash
   convert_heic() {
     setopt +o nomatch  # Prevent zsh from erroring on no matches
     for file in *.HEIC *.heic; do
       [ -f "$file" ] || continue
       sips -s format png "$file" --out "${file%.*}.png" && \
       rm "$file" && \
       [ -f "${file%.*}.mp4" ] && rm "${file%.*}.mp4"
     done
   }
   ```
3. Save and exit (`CTRL + O`, `Enter`, `CTRL + X`).

4. Reload your shell configuration:
   ```bash
   source ~/.zshrc
   ```

---

## **Usage**

1. Open a Terminal window.
2. Navigate to the directory containing the `.HEIC` files:
   ```bash
   cd /path/to/your/directory
   ```
3. Run the `convert_heic` command:
   ```bash
   convert_heic
   ```

### What Happens:
- All `.HEIC` (or `.heic`) files in the current directory are converted to `.png`.
- The original `.HEIC` files are deleted.
- Any `.MP4` files with the same base name are also deleted.

---

## **Example**

### Input Files:
```bash
IMG_3956.HEIC
IMG_3956.MP4
IMG_3957.HEIC
```

### After Running `convert_heic`:
```bash
IMG_3956.png
IMG_3957.png
```

- The `.HEIC` files (`IMG_3956.HEIC` and `IMG_3957.HEIC`) are removed.
- The `.MP4` file (`IMG_3956.MP4`) is removed.

---

## **Troubleshooting**

### **Error: `convert_heic:1: no matches found: *.heic`**
This happens when no `.heic` files are present in the directory. The script includes the `(N)` flag to handle this gracefully.

### **Missing Files**
Ensure the files are in the current directory and have the correct `.HEIC` or `.heic` extension.

---

## **Customizing**
You can modify the script to:
- Change the output format (e.g., `.jpeg` instead of `.png`).
- Preserve the original `.HEIC` or `.MP4` files by removing the `rm` commands.
