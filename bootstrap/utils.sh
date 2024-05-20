ROOT_PATH=.
DOWNLOAD_PATH="$HOME/Downloads/programs"
PACKAGES_PATH="$ROOT_PATH/packages"
BASE_PACKAGES="$PACKAGES_PATH/base-packages.list"
COMMON_PACKAGES="$PACKAGES_PATH/common-packages.list"
FLATPAK_PACKAGES="$PACKAGES_PATH/flatpak.list"
MANJARO_PACKAGES="$PACKAGES_PATH/manjaro-packages.list"

get_formatted_packages() {
    local packages="$( sed 's/$/ \\/' $1 )"
    echo $packages
}
