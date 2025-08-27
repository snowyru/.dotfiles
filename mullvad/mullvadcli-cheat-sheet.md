# Mullvad CLI Cheat Sheet

This document is a comprehensive guide to the Mullvad command-line interface (CLI) for managing your Mullvad VPN connection on Linux, macOS, and Windows. It covers essential commands, feature toggles, and advanced configurations.

---

## 1. Basic Commands

| Command                                  | Description                                              | Example                              |
|-------------------------------------------|----------------------------------------------------------|--------------------------------------|
| `mullvad status`                         | Checks the current VPN connection status.<br>Add `-v` for verbose output. | `mullvad status -v`                  |
| `mullvad connect`                        | Connects to the last configured VPN location.            | `mullvad connect`                    |
| `mullvad disconnect`                     | Disconnects the VPN.                                     | `mullvad disconnect`                 |
| `mullvad refresh`                        | Refreshes the list of available Mullvad servers.         | `mullvad refresh`                    |
| `mullvad version`                        | Displays the Mullvad client and daemon version.          | `mullvad version`                    |
| `mullvad account get`                    | Shows your account info, including remaining time.       | `mullvad account get`                |
| `mullvad account login <account_number>` | Logs in to your Mullvad account.<br>Replace `<account_number>` with your actual number. | `mullvad account login 1234567890123456` |

---

## 2. Connection Management & Location

| Command                                              | Description                                                                      | Example                              |
|------------------------------------------------------|----------------------------------------------------------------------------------|--------------------------------------|
| `mullvad relay list`                                 | Lists all available Mullvad servers.                                             | `mullvad relay list`                 |
| `mullvad relay set location <country>`               | Sets a specific country for the next connection.<br>Use 2-letter code (e.g., us, se). | `mullvad relay set location us`      |
| `mullvad relay set location <city_code>`             | Sets a specific city. Use 2-letter country code and city abbreviation.           | `mullvad relay set location us nyc`  |
| `mullvad relay set tunnel-protocol <protocol>`       | Sets the connection protocol: `wireguard` (default) or `openvpn`.                | `mullvad relay set tunnel-protocol openvpn` |
| `mullvad connect <location>`                        | Connects directly to a specified location.                                       | `mullvad connect us la`              |

---

## 3. Feature Toggles & Security

| Command                                          | Description                                                      | Example                              |
|--------------------------------------------------|------------------------------------------------------------------|--------------------------------------|
| `mullvad settings set kill-switch on`            | Activates the kill switch (blocks all traffic if VPN disconnects). | `mullvad settings set kill-switch on`|
| `mullvad settings set kill-switch off`           | Deactivates the kill switch.                                     | `mullvad settings set kill-switch off`|
| `mullvad settings set dns <dns_type>`            | Toggles DNS blocking. Types: `default`, `adblock`, `base`, `extended`, `family`, `all`. | `mullvad settings set dns adblock`   |
| `mullvad settings set ipv6 on`                   | Enables IPv6 connections.                                        | `mullvad settings set ipv6 on`       |
| `mullvad settings set ipv6 off`                  | Disables IPv6 connections.                                       | `mullvad settings set ipv6 off`      |
| `mullvad lan set allow`                          | Allows local network (LAN) traffic while connected to VPN.       | `mullvad lan set allow`              |
| `mullvad lan set block`                          | Blocks local network traffic.                                    | `mullvad lan set block`              |

---

## 4. Obfuscation & Bridges

| Command                                          | Description                                                      | Example                              |
|--------------------------------------------------|------------------------------------------------------------------|--------------------------------------|
| `mullvad obfuscation set mode <mode>`            | Enables traffic obfuscation. Options: `udp2tcp`, `shadowsocks`.  | `mullvad obfuscation set mode shadowsocks` |
| `mullvad obfuscation set mode auto`              | Disables obfuscation (sets to automatic).                        | `mullvad obfuscation set mode auto`  |
| `mullvad bridge set state on`                    | Activates Shadowsocks bridge mode.                               | `mullvad bridge set state on`        |
| `mullvad bridge set state off`                   | Deactivates Shadowsocks bridge mode.                             | `mullvad bridge set state off`       |
| `mullvad bridge set location <country>`          | Sets a bridge location for Shadowsocks.                          | `mullvad bridge set location se`     |

---

## 5. Multihop (WireGuard Only)

| Command                                                          | Description                                  | Example                              |
|------------------------------------------------------------------|----------------------------------------------|--------------------------------------|
| `mullvad relay set tunnel wireguard --use-multihop on`           | Enables the multihop feature.                | `mullvad relay set tunnel wireguard --use-multihop on` |
| `mullvad relay set tunnel wireguard entry location <entry>`       | Sets the entry location (first hop).         | `mullvad relay set tunnel wireguard entry location dk` |
| `mullvad relay set location <exit>`                              | Sets the exit location (second hop).         | `mullvad relay set location se got`  |
| `mullvad status`                                                 | Verify your connection. Output should show the via entry server.<br>Example: Connected to se-got-wg-001 in Gothenburg, Sweden via dk-cph-wg-001. | |

---

## 6. Advanced OpenVPN Settings

| Command                                                | Description                              | Example                              |
|--------------------------------------------------------|------------------------------------------|--------------------------------------|
| `mullvad relay set tunnel-protocol openvpn`            | Sets protocol to OpenVPN.                | `mullvad relay set tunnel-protocol openvpn` |
| `mullvad relay set tunnel openvpn --transport-protocol tcp` | Sets OpenVPN to use TCP as transport.    | `mullvad relay set tunnel openvpn --transport-protocol tcp` |
| `mullvad relay set tunnel openvpn --port 443`          | Sets OpenVPN port to 443.                | `mullvad relay set tunnel openvpn --port 443` |
| `mullvad bridge set state on`                          | Activates bridge mode (often with OpenVPN TCP). | `mullvad bridge set state on`        |

---

## 7. Advanced WireGuard Settings

| Command                                                | Description                              | Example                              |
|--------------------------------------------------------|------------------------------------------|--------------------------------------|
| `mullvad tunnel set wireguard rotate-key`              | Generates a new WireGuard key.           | `mullvad tunnel set wireguard rotate-key` |
| `mullvad tunnel set wireguard --rotation-interval <hours>` | Sets auto key rotation interval.         | `mullvad tunnel set wireguard --rotation-interval 72` |
| `mullvad tunnel set wireguard --port <port>`           | Specifies custom port for WireGuard. Use `any` to revert. | `mullvad tunnel set wireguard --port 51820` |
| `mullvad tunnel set wireguard --quantum-resistant on`  | Enables quantum-resistant tunnel.         | `mullvad tunnel set wireguard --quantum-resistant on` |
| `mullvad tunnel set wireguard --daita on`              | Enables Defense Against AI-guided Traffic Analysis (DIATA). | `mullvad tunnel set wireguard --daita on` |
| `mullvad tunnel set wireguard --daita off`             | Disables DIATA.                          | `mullvad tunnel set wireguard --daita off` |

---
# How to Connect Mullvad with OpenVPN, TCP 443, and Bridge Mode

Follow these steps to configure Mullvad VPN to use OpenVPN (TCP, port 443) with bridge mode for maximum compatibility and obfuscation:

---

## 1. Set the Tunnel Protocol

Tell Mullvad to use **OpenVPN** instead of the default WireGuard protocol:

```sh
mullvad relay set tunnel-protocol openvpn
```

---

## 2. Set the Transport Protocol to TCP

Specify that OpenVPN should use the **TCP** protocol. Useful for bypassing firewalls:

```sh
mullvad relay set tunnel openvpn --transport-protocol tcp
```

---

## 3. Set the Port

Use **TCP on port 443** (commonly used for HTTPS traffic and useful for obfuscation):

```sh
mullvad relay set tunnel openvpn --port 443
```

---

## 4. Enable Bridge Mode

Enable **bridge mode** (Shadowsocks), which helps with obfuscation in restrictive networks:

```sh
mullvad bridge set state on
```

---

## 5. Set the Connection Location

Specify the location you want to connect to (e.g., London, UK: `uk lon`):

```sh
mullvad relay set location uk lon
```

---

## 6. Connect to the VPN

Initiate the connection with your configured settings:

```sh
mullvad connect
```

---

## 7. Verify Connection

Check your connection status and settings at any time:

```sh
mullvad status -v
```
