module.exports = {
  "servers": [
    {
      "host": "localhost",
      "port": 5986
    }
  ],
  "plugins": {
    "kappa": {
      "vhost": "localhost",
      "paths": [
        "http://localhost:5985",
        "https://registry.npmjs.org/"
      ]
    }
  }
}