#!/bin/bash

# Just a basic script U can improvise lateron asper ur need xD 

# Function to show an informational message
msg() {
    echo -e "\e[1;32m$*\e[0m"
}

err() {
    echo -e "\e[1;41m$*\e[0m"
}

DATE=$(date +"%F-%S")
START=$(date +"%s")

# Inlined function to post a message
export BOT_MSG_URL="https://api.telegram.org/bot$TG_TOKEN/sendMessage"
tg_post_msg() {
	curl -s -X POST "$BOT_MSG_URL" -d chat_id="$TG_CHAT_ID" \
	-d "disable_web_page_preview=true" \
	-d "parse_mode=html" \
	-d text="$1"

}

tg_post_build() {
	curl --progress-bar -F document=@"$1" "$BOT_MSG_URL" \
	-F chat_id="$TG_CHAT_ID"  \
	-F "disable_web_page_preview=true" \
	-F "parse_mode=html" \
	-F caption="$3"
}

# Send a notificaton to TG
tg_post_msg "<b>Recovery Compilation Started...</b>%0A<b>DATE : </b><code>$DATE</code>%0A"
cd ~/OrangeFox_10/fox_10.0)
  source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"
lunch omni_<device>-eng && mka recoveryimage

tg_post_msg "<b>===+++ Setting up Build Environment +++===</b>"
echo " ===+++ Setting up Build Environment +++==="
mkdir ~/OrangeFox_10
cd ~/OrangeFox_10
git clone https://gitlab.com/OrangeFox/sync.git # or, "git clone git@gitlab.com:OrangeFox/sync.git"
cd ~/OrangeFox_10/sync
./get_fox_10.sh ~/OrangeFox_10/fox_10.0

tg_post_msg "<b>===+++ Syncing Recovery Sources +++===</b>"
echo " ===+++ Syncing Recovery Sources +++==="
cd ~/OrangeFox_10/fox_10.0)
mkdir -p device/sony
cd device/sony
git clone https://github.com/whatawurst/android_device_sony_poplar -b android-9.0 poplar

tg_post_msg "<b>===+++ Starting Build Recovery +++===</b>"
echo " ===+++ Building Recovery +++==="
cd ~/OrangeFox_10/fox_10.0)
  source build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"
lunch omni_<device>-eng && mka recoveryimage

# Upload zips & recovery.img (U can improvise lateron adding telegram support etc etc)
tg_post_msg "<b>===+++ Uploading Recovery +++===</b>"
echo " ===+++ Uploading Recovery +++==="

# Push Recovery to channel
    cd out/target/product/$DEVICE
    ZIP=$(echo *$DEVICE.zip)
    curl -F document=@$ZIP "https://api.telegram.org/bot$TG_TOKEN/sendDocument" \
        -F chat_id="$TG_CHAT_ID" \
        -F "disable_web_page_preview=true" \
        -F "parse_mode=html" 
