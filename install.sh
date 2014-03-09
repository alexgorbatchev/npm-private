#!/bin/bash
curl -X PUT http://127.0.0.1:5985/registry

git clone https://github.com/npm/npmjs.org.git
cd npmjs.org
npm install

npm start --npmjs.org:couch=http://127.0.0.1:5985/registry
npm run load --npmjs.org:couch=http://127.0.0.1:5985/registry
yes yes | npm run copy --npmjs.org:couch=http://127.0.0.1:5985/registry
