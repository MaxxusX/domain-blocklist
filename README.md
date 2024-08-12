# maxxus' domain blocklist

**TODO:** auto-build Normal, Extended, and Maximum, for 3 versions; domains, wildcard (`*.domain`), and ublock (`||domain^$all`)

# No Meta/Facebook
Blocks Meta/Facebook and all services owned by it.

# No ByteDance/TikTok
Blocks ByteDance and all services owned by it (eg. TikTok)

# NORMAL
Blocks Ads, Affiliate, Tracking, Metrics, Telemetry, Phishing, Malware, Scam, Fake, Coins and other crap.
> [!NOTE]
> Minimal false positives and breakage.
## whitelist
 - securepubads.g.doubleclick.net
 - pubads.g.doubleclick.net
 - pagead2.googlesyndication.com
## blacklist
## included blacklists
 - [OISD Big](https://raw.githubusercontent.com/sjhgvr/oisd/main/domainswild2_big.txt)
 - [HaGeZi Normal](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/multi-onlydomains.txt)
 - [HaGeZi Threat Intelligence Feeds - Medium](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/tif.medium-onlydomains.txt)
## included whitelists
 - [HaGeZi Referral Whitelist](https://github.com/hagezi/dns-blocklists/blob/main/domains/whitelist-referral.txt)

# EXTENDED
Blocks Ads, Affiliate, Tracking, Metrics, Telemetry, Phishing, Malware, Scam, Free Hoster, Fake, Coins, Meta, and other crap.
> [!WARNING]
> This'll break things, so you'll need to whitelist stuff often.
## whitelist
## blacklist
## included blacklists
 - No Meta
 - [OISD Big](https://raw.githubusercontent.com/sjhgvr/oisd/main/domainswild2_big.txt)
 - [HaGeZi Ultimate](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/ultimate-onlydomains.txt)
 - [HaGeZi Threat Intelligence Feeds](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/tif-onlydomains.txt)

# MAXIMUM
Very aggressively blocks Ads, Affiliate, Tracking, Metrics, Telemetry, Phishing, Malware, Scam, Free Hoster, Fake, Coins, NSFW, Meta, ByteDance, and other crap.
> [!CAUTION]
> This will DEFINITELY break things, and you'll need to whitelist stuff VERY often.
## whitelist
## blacklist
## included blacklists
 - No Meta
 - No ByteDance
 - [OISD Big](https://raw.githubusercontent.com/sjhgvr/oisd/main/domainswild2_big.txt)
 - [OISD NSFW](https://raw.githubusercontent.com/sjhgvr/oisd/main/domainswild2_nsfw.txt)
 - [HaGeZi Ultimate](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/ultimate-onlydomains.txt)
 - [HaGeZi Fake](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/fake-onlydomains.txt)
 - [HaGeZi Threat Intelligence Feeds](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/tif-onlydomains.txt)
 - [HaGeZi Badware Hoster](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/hoster-onlydomains.txt)
 - [HaGeZi DynDNS](https://raw.githubusercontent.com/hagezi/dns-blocklists/main/wildcard/dyndns-onlydomains.txt)
