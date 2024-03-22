const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend(
  'provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    JQuery: 'jquery/src/jquery',
    popper: 'popper.js'
  })
)