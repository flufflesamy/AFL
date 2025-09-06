# Building AFL

This repo uses HEMTT for building and packaging.

```admonish info
These instructions are intended for use on Microsoft Windows. They are not guaranteed to work on other operating systems.
```

## Clone Repo

Clone the AFL repo using git.

```ps1
git clone https://github.com/flufflesamy/AFL
```

## Install HEMTT

To install HEMTT on Windows, run the following command:

```ps1
winget install BrettMayson.HEMTT
```

## Using HEMTT to Build AFL

To build a development version, run:

```ps1
hemtt dev
```

The following command launches a development version of the mod:

```ps1
hemtt launch
```

To build a release version, run:

```ps1
hemtt release
```

For more information on HEMTT, refer to the [HEMTT Book](https://hemtt.dev/).
