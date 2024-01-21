# MacOs is shit, but we can make it better...
# This is a continuous effort

# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
