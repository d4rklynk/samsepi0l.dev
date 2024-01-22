# samsepi0l.dev

[![Netlify Status](https://api.netlify.com/api/v1/badges/a94ba769-bad3-4756-bda7-5cc1b7c3a574/deploy-status)](https://app.netlify.com/sites/samsepi0l/deploys)

My personal blog with [Blowfish](https://github.com/nunocoracao/blowfish) Hugo theme.

Some improvements:
- Improve Youtube shortcodes ([d07bc6d](https://github.com/d4rklynk/samsepi0l.dev/commit/d07bc6dfbaf9290e62c07a756711d82cab9dc0e5)) based on [Wonderfall's one](https://github.com/Wonderfall/hugo-WonderMod/commit/4dc3bee5477b6d22ce830faa13375f4c2e6a216b).

## Technical stuff
### Licensing

The website content (under `/content`) is under the [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) license.

The Hugo Framework used to create this website is under the [Apache License](https://github.com/gohugoio/hugo/blob/master/LICENSE).

The Blowfish theme used for the website and modifications made by me are under the [MIT License](https://github.com/nunocoracao/blowfish/blob/main/LICENSE). 

This README has been partially copied from [PrivSec.dev](https://github.com/PrivSec-dev/privsec.dev) which is under the [Attribution-ShareAlike 4.0 International](https://github.com/PrivSec-dev/privsec.dev/blob/main/LICENSE.md)

### Local Development

1. [Install Hugo](https://gohugo.io/getting-started/installing/)
2. Clone this repository: `git clone --recurse-submodules https://github.com/d4rklynk/samsepi0l.dev`
3. Run `hugo serve` to start the local development server at (by default) `http://localhost:1313`
   - Alternatively run `hugo` to simply build the site into the `/public` directory

- Run `git submodule update --merge` to update the [Blowfish theme](https://github.com/nunocoracao/blowfish) to the version specified in this repo
  - Run `git submodule update --remote --merge` to update to the upstream master branch of Blowfish