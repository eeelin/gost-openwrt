include $(TOPDIR)/rules.mk

PKG_NAME:=gost
PKG_VERSION:=0.0.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/go-gost/gost.git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_MIRROR_HASH:=skip

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=claw-ruyi-homes

PKG_BUILD_DEPENDS:=golang/host
PKG_BUILD_PARALLEL:=1
PKG_USE_MIPS16:=0

GO_PKG:=github.com/go-gost/gost/v3
GO_PKG_BUILD_PKG:=$(GO_PKG)/cmd/gost

include $(INCLUDE_DIR)/package.mk
include ../../lang/golang/golang-package.mk

define Package/gost
  SECTION:=net
  CATEGORY:=Network
  TITLE:=GO Simple Tunnel for OpenWrt
  URL:=https://github.com/go-gost/gost
  DEPENDS:=$(GO_ARCH_DEPENDS)
endef

define Package/gost/description
 A flexible tunnel/proxy tool packaged for OpenWrt 22.03.x.
endef

define Package/gost/conffiles
/etc/config/gost
/etc/gost/config.yaml
endef

define Package/gost/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(GO_PKG_BUILD_DIR)/bin/gost $(1)/usr/bin/gost
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/gost $(1)/etc/init.d/gost
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/gost $(1)/etc/config/gost
	$(INSTALL_DIR) $(1)/etc/gost
	$(INSTALL_CONF) ./files/etc/gost/config.yaml $(1)/etc/gost/config.yaml
endef

$(eval $(call GoBinPackage,gost))
$(eval $(call BuildPackage,gost))
