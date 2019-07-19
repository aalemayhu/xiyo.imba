let ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  module: {
    rules: [
      {
        test: /\.scss$/,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          use: ['css-loader', 'sass-loader']
        })
      }
    ],
  },
  resolve: {
    extensions: [".js", ".json", ".scss"]
  },
  entry: ["./src/styles/index.scss"],
  plugins: [
    new ExtractTextPlugin('index.css')
  ]
}