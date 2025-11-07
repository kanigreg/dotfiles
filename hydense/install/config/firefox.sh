# Startup firefox in the background to allow it create configuration folder
firefox --headless &
killall firefox

cp -R "$HYDENSSE"/defaults/firefox/chrome "$HOME"/.mozilla/firefox/*.default-release

# Change configuration to allow firefox use custom CSS
sed -i s/legacyUserProfileCustomizations.stylesheets\", false/ \
  legacyUserProfileCustomizations.stylesheets\", true/g \
  "$HOME"/.mozilla/firefox/*.default-release

log "Firefox installed"
