const webpack = require("webpack");
const path = require("path");
const VueLoaderPlugin = require("vue-loader/lib/plugin");

module.exports = {
    entry: "./ClientApp/index.js",
    output: {
        path: path.resolve(__dirname, "public_html", "bundles"),
        filename: "app.min.js",
        publicPath: "/bundles/"
    },
    plugins: [
        new VueLoaderPlugin()
    ],
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
    },
    module: {
        rules: [
            {
                test: /\.sass$/,
                use: [
                    "style-loader",
                    "css-loader",
                    "sass-loader"
                ]
            },
            {
                test: /\.scss$/,
                use: [
                    "style-loader",
                    "css-loader",
                    "sass-loader"
                ]
            },
            {
                test: /\.vue$/,
                use: "vue-loader"
            },
            {
                test: /\.css$/,
                use: [
                    "style-loader",
                    "css-loader"
                ]
            },
            {
                test: /\.ttf$|\.woff(2)?$|\.eot$|\.svg$/,
                use: [{
                    loader: "file-loader",
                    options: {
                        name: "[name].[ext]",
                        outputPath: "fonts"
                    }
                }]
            }
        ]
    },
    resolve: {
        extensions: [".js", ".vue"]
    }
};