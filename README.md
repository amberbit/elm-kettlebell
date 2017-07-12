# Kettlebell Championship

### About:

This project aims to represent a tool to help judges with Kettlebell
championships. Currently, it's using "allometric scaling" to allow fair
comparison between athletes of different weight.

[Kto jest silniejszy? (PL)](http://bestrongfirst.pl/kettlebells/kto-jest-silniejszy/)


### Technical:

Based on a simple Webpack setup for writing [Elm](http://elm-lang.org/) apps:

* Dev server with live reloading, HMR
* Support for CSS/SCSS (with Autoprefixer), image assets
* Bootstrap 3.3+ (Sass version)
* Bundling and minification for deployment
* Basic app scaffold, using `Html.beginnerProgram`
* A snippet of example code to get you started!


### Install:
Clone this repo into a new project folder, e.g. `kettlebell`:
```
git clone https://github.com/amberbit/elm-kettlebell kettlebell
cd kettlebell
```

Install all dependencies using the handy `reinstall` script:
```
npm run reinstall
```
*This does a clean (re)install of all npm and elm packages, plus a global elm install.*


### Serve locally:
```
npm start
```
* Access app at `http://localhost:8080/`
* Get coding! The entry point file is `src/elm/Main.elm`
* Browser will refresh automatically on any file changes..


### Build & bundle for prod:
```
npm run build
```

* Files are saved into the `/dist` folder
* To check it, open `dist/index.html`
