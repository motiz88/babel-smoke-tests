# babel-smoke-tests 🌋 [![Travis Build Status](https://travis-ci.org/motiz88/babel-smoke-tests.svg?branch=master)](https://travis-ci.org/motiz88/babel-smoke-tests)


This is a proof-of-concept setup inspired by discussion in [babel/babel#1837](https://github.com/babel/babel/issues/1837).

* _Our_ packages - [Babel](https://github.com/babel/babel/) and [Babylon](https://github.com/babel/babylon/) - are checked out (at specific commits) under [`us/`](https://github.com/motiz88/babel-smoke-tests/tree/master/us).
* _Their_ packages - e.g. [React](https://github.com/facebook/react/) (others to follow soon) - are similarly checked out under [`them/`](https://github.com/motiz88/babel-smoke-tests/tree/master/them).
* On CI, we publish patch versions of Babel and Babylon to a local npm proxy ([verdaccio](https://github.com/verdaccio/verdaccio), a maintained fork of sinopia), and run _their_ tests.

PRs and further discussion absolutely welcome!
