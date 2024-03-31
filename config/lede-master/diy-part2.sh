#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Add autocore support for armvirt
sed -i 's/TARGET_rockchip/TARGET_rockchip\|\|TARGET_armvirt/g' package/lean/autocore/Makefile

# Modify default IP
sed -i 's/192.168.1.1/192.168.2.24/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

#删除旧的软件包
rm -rf package/feeds/smpackage/UnblockNeteaseMusic
rm -rf package/feeds/smpackage/UnblockNeteaseMusic-Go
rm -rf package/feeds/luci/luci-app-unblockmusic

#下载新的解锁网易云插件
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git package/feeds/luci-app-unblockneteasemusic

#下载新的clahs
git clone https://github.com/vernesong/OpenClash.git package/feeds/luci-app-openclash
# 编译 po2lmo (如果有po2lmo可跳过)
pushd luci-app-openclash/tools/po2lmo
make && sudo make install
popd



