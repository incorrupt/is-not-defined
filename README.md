# not-defined

> checks if foo is not defined, i.e. undefined, null, an empty string, array, object or NaN

This is a fork of [fibo/not-defined](https://github.com/fibo/not-defined) to add browser compatibility

[Installation](#installation) |
[Usage](#usage) |
[Annotated source](#annotated-source) |
[License](#license)

[![NPM version](https://badge.fury.io/js/is-not-defined.svg)](http://badge.fury.io/js/not-defined)
[![KLP](https://img.shields.io/badge/kiss-literate-orange.svg)](http://g14n.info/kiss-literate-programming)

## Installation

```bash
npm install not-defined
```

## Usage

This snippet of code

```javascript
const isNotDefined = require("is-not-defined");

if (isNotDefined(foo)) {
  // do something, usually throw a TypeError
}
```

is equivalent to the following pseudocode

```
if (foo is not defined, i.e. is null, undefined, NaN, an empty string, array or object) {
  // do something, usually throw a TypeError
}
```

You can also use a shorter but still semantic form like

```javascript
const no = require("is-not-defined");

if (no(foo)) {
  // do something, usually throw a TypeError
}
```

Follows a list of [tested examples](https://github.com/fibo/not-defined/blob/master/test.js)

```javascript
no(); // true
no(undefined); // true
no(null); // true
no(""); // true
no([]); // true
no({}); // true
no(NaN); // true

no(0); // false
no(true); // false
no(false); // false
no("string"); // false
no(["foo"]); // false
no({ foo: true }); // false
no(42); // false
no(Infinity); // false
no(function () {
  return 1;
}); // false
```

### Pros

- Type less.
- Better readability (even your boss will understand your code ^:).
- Can save bytes in your builds.
- Easier to autocomplete in editors (for instance easier than `typeof foo === 'undefined'`).

## Annotated source

This is my first npm package written using [KISS Literate Programming][klp].

    function isNotDefined(x){return x==null||(typeof x == 'number'&&isNaN(x))||(x.length<1&&typeof x!='function')||(typeof x=='object'&&x.constructor.name=='Object'&&Object.keys(x).length<1)}try{module.exports=isNotDefined}catch(e){}

Snippet `length<1` is used instead of equivalent `length==0` to save two characters, considering it is used twice.

## License

MIT
