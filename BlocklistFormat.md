# Blocklist Format
Lines MUST NOT contain more than one filter.

Blank lines have no meaning and will be ignored by the parser.

Lines starting with `#` are comments and are ignored by the parser.

Lines starting with `!` are metadata. Valid metadata types:
 * `!title: <String>`: The title of the blocklist
 * `!desc: <String>`: The description of the blocklist
 * `!author: <String>`: The author of the blocklist
 * `!homepage: https://<URL>`: The homepage of the blocklist
 * `!expires: <Integer> days`: The frequency at which to refetch/update the list
 * `!modified: <Date>`: The date the blocklist was last modified, eg. `2025 March 8`

Lines starting with `@` are blocked resources. They MUST be immediately followed by a ***Filter Type***.

Lines starting with `~` are unblocked resources. They MUST be immediately followed by a ***Filter***.

## Data Types

### `<Domain>`
A domain.
#### Syntax
```
example.com
```

### `<GlobDomain>`
Same as `<Domain>` but allows globs.
#### Syntax
```
example*.com
```

### `<DomainList>`
A comma-separated list of domains.
#### Syntax
```
<Domain>[, <Domain>, [...]]
```

### `<GlobDomainList>`
Same as `<DomainList>` but allows globs.
#### Syntax
```
<GlobDomain>[, <GlobDomain>, [...]]
```

### `<Path>`
A path on any domain, not including the domain part.
#### Syntax
```
/valid/path
```

### `<GlobPath>`
Same as `<Path>`, but allows globs.
#### Syntax
```
/*/valid/path
```

### `<URL>`
A full URL, excluding the scheme.
#### Syntax
```
<Domain><Path><searchquery>
```

### `<GlobURL>`
Same as `<URL>`, but allows globs.
#### Syntax
```
<GlobDomain><GlobPath><glob-searchquery>
```

### `<CSSSelector>`
A CSS selector.
#### Syntax
See [CSS Reference - Selectors on MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference#selectors)

### `<CSSStyleList>`
A list of CSS styles.
#### Syntax
See [CSS Reference on MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)

### `<ResourceType>`
The type of resource/request
#### Syntax
```
first-party || third-party || *
```

### `<Scriptlet>`
A predefined JS script
#### Supported Scriptlets
```
set-cookie, <cookie-name>, <new-value>
remove-cookie, <cookie-name>
set-localstorage-item, <item-name>, <new-value>
remove-localstorage-item, <item-name>
set-sessionstorage-item, <item-name>, <new-value>
remove-sessionstorage-item, <item-name>
```

## Filters

Filters define what resource is being blocked/unblocked.

### domain
Blocks a certain domain and its subdomains.
eg. `@domain, example.com` blocks `example.com` and `www.example.com`
#### Syntax
```
@domain, <Domains>
```

### domain-glob
Same as `domain`, but allows globs.
eg. `@domain-glob, example*.com` blocks `example.com` and `example123.com`
#### Syntax
```
@domain-glob, <GlobDomains>
```

### path
Blocks a certain path on all websites.
eg. `@path, /ads` blocks `example.com/ads`
#### Syntax
```
@path, <Path>
```

### path-glob
Same as `path`, but allows globs.
eg. `@path-glob, /*/ads` blocks `example.com/en-US/ads`
#### Syntax
```
@path-glob, <GlobPath>
```

### url
Blocks a certain URL and its sub-paths.
eg. `@url, example.com/stuff/ads` blocks `example.com/stuff/ads` and `example.com/stuff/ads/banner.png`
#### Syntax
```
@url, <URL>
```

### url-glob
Same as `url`, but allows globs.
eg. `@url-glob, example.com/*/ads` blocks `example.com/stuff/ads`
#### Syntax
```
@url-glob, <GlobURL>
```

<!-- TODO
### url-regex
Same as `url`, but allows regex.
eg. `@url-regex, /^example.com/ad.(?:png|jpeg)$/` blocks `example.com/ad.png` and `example.com/ad.jpeg`
#### Syntax
```
@url-regex, /regex/
```
-->

### from
Blocks a requests from a domain(s) and their subdomains to a certain resource type or URL and their sub-paths.
eg. `@from, example.com; => example.net/ads` blocks requests from `example.com` to `example.net/ads/banner.js`
#### Syntax
```
@from, <DomainList>; => <ResourceType> || <URL>
```

### cosmetic
Blocks a certain element(s) on a domain and its subdomains.
eg. `@cosmetic, example.com; div#ad` blocks `<div id="ad"></div>` on `example.com`
#### Syntax
```
@cosmetic, <DomainList>; <CSSSelector>
```

### restyle
Applies a style to certain element(s) on a domain and its subdomains.
eg. `@restyle, example.com; div#ad-bar ;=> { width: 0; }` applies `width: 0;` to `<div id="ad-bar"></div>` on `example.com`
#### Syntax
```
@restyle, <DomainList>; <CSSSelector> ;=> { <CSSStyleList> }
```

### scriptlet
> [!WARNING]
> Scriptlet Filters MUST be prefixed with an `@`
Applies a style to certain element(s) on a domain and its subdomains.
eg. `@scriptlet, example.com; set-cookie, no-track, true`
#### Syntax
```
@scriptlet, <DomainList>; <Scriptlet>[, <Scriptlet.Parameter1>[, <Scriptlet.Parameter2>, [...]]]
```
