// webpack.config.js
var path = require("path");

module.exports = {
  entry: "/src/widgets.jsx",
  output: {
    filename: "./bundle.js",
  },
  // devServer: {
  //   port: 8080,
  //   contentBase: "./deploy",
  // },
  // watchOptions: {
  //   poll: true,
  //   ignored: /node_modules/,
  // },
  module: {
    rules: [
      {
        test: [/\.jsx?$/],
        exclude: /(node_modules)/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/env", "@babel/react"],
          },
        },
      },
    ],
  },
  devtool: "source-map",
  resolve: {
    extensions: [".js", ".jsx", "*"],
  },
};
