const webpack = require("webpack");
const path = require("path");

module.exports = {
    entry: "./ClientApp/index.js",
    output: {
        path: path.resolve(__dirname, "public_html", "bundles"),
        filename: "app.min.js",
        publicPath: "/bundles/"
    },
    devServer: {
        port: 1337,
        overlay: {
            warnings: true,
            errors: true
        },
        open: true,
        proxy: {
            "*": {
                target: "http://localhost:8080",
                secure: false
            }
        }
    }
};