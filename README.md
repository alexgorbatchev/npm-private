# npm-private

A private NPM registry running on localhost that falls back to public. Requires `couchdb` installed.

[![Dependency status](https://david-dm.org/alexgorbatchev/npm-private.png)](https://david-dm.org/alexgorbatchev/npm-private)
[![devDependency Status](https://david-dm.org/alexgorbatchev/npm-private/dev-status.png)](https://david-dm.org/alexgorbatchev/generator-coffee-module#info=devDependencies)

[![NPM](https://nodei.co/npm/npm-private.png?downloads=true)](https://npmjs.org/package/npm-private)

## Installation

    $ npm install npm-private
    $ brew install couchdb
    $ npm-private install

## Usage Example

    $ npm-private start

    $ npm info npm
    ...

    $ npm config get registry
    http://localhost:5986

    $ npm-private stop

    $ npm config get registry
    https://registry.npmjs.org/

## Publishing Private Modules

Before you can publish locally, you need to create and login with a local NPM user. If you create a user with the same credential locally as you have in the public registry you won't have to relogin every time when you toggle private/public.

    $ npm login
    ...

# License

The MIT License (MIT)

Copyright (c) 2014 Alex Gorbatchev

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
