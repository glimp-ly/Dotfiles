function zen-browser --wraps='flatpak run app.zen_browser.zen &> /dev/null &' --description 'alias zen-browser=flatpak run app.zen_browser.zen &> /dev/null &'
    flatpak run app.zen_browser.zen &> /dev/null & $argv
end
