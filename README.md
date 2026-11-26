# Aethar01 Tap

Homebrew casks and formulae for Aethar01's apps.

## Installation

Install onon:

```sh
brew install aethar01/tap/onon
```

Or tap the repository first:

```sh
brew tap aethar01/tap
brew install onon
```

In a `Brewfile`:

```ruby
tap "aethar01/tap"
cask "onon"
```

The cask installs `onon.app` into `/Applications` and the `onon` command. It was called `gopdf` before 0.8.0; `brew upgrade` follows the rename.

Install faster (built from source with Go):

```sh
brew install aethar01/tap/faster
```

In a `Brewfile`:

```ruby
brew "aethar01/tap/faster"
```

Install roke (built from source with Rust):

```sh
brew install aethar01/tap/roke
```

In a `Brewfile`:

```ruby
brew "aethar01/tap/roke"
```

## Updates

- `.github/workflows/update.yml` checks for a new onon release every hour, or straight away when the onon release workflow triggers it.
- `.github/workflows/update-roke.yml` checks for a new roke release every hour, or straight away when the roke release workflow triggers it.

Both update versions and checksums, audit and test-install, then push to `main`.

## Documentation

Run `brew help`, `man brew`, or see Homebrew's documentation at https://docs.brew.sh.
