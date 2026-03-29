include $(TOPDIR)/rules.mk

PKG_NAME:=gost
PKG_VERSION:=0.0.0
PKG_RELEASE:=1

PKG_LICENSE:=MIT
PKG_MAINTAINER:=claw-ruyi-homes

include $(INCLUDE_DIR)/package.mk

define Package/gost
  SECTION:=net
  CATEGORY:=Network
  TITLE:=GO Simple Tunnel for OpenWrt
  URL:=https://github.com/go-gost/gost
  DEPENDS:=+libc
endef

define Package/gost/description
 A flexible tunnel/proxy tool packaged for OpenWrt 22.03.x.
endef

define Package/gost/conffiles
/etc/config/gost
/etc/gost/config.yaml
endef

define Build/Compile
	true
endef

define Package/gost/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gost $(1)/usr/bin/gost
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/etc/init.d/gost $(1)/etc/init.d/gost
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/etc/config/gost $(1)/etc/config/gost
	$(INSTALL_DIR) $(1)/etc/gost
	$(INSTALL_CONF) ./files/etc/gost/config.yaml $(1)/etc/gost/config.yaml
endef

$(eval $(call BuildPackage,gost))
