#!/bin/sh


WIDTH=720
HEIGHT=1280

case $# in
2) WIDTH="$1"
   HEIGHT="$2"
   ;;
*) echo "Usage: $0 <width> <height>"
   echo "Common sizes:"
   echo "    720 1280"
   echo "    760 1280"
   echo "    822 1462   (for 720x1280 with 7.1% bleed)"
   echo "    868 1462   (for 760x1280 with 7.1% bleed)"
   exit 1
   ;;
esac


cat <<EOF
<!doctype html>
<html amp>
  <head>
    <meta charset="utf-8">
    <title>Web Story Storyboard Template</title>
    <link rel="canonical" href="index.html">
    <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1">
    <style amp-boilerplate>body{-webkit-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-moz-animation:-amp-start 8s steps(1,end) 0s 1 normal both;-ms-animation:-amp-start 8s steps(1,end) 0s 1 normal both;animation:-amp-start 8s steps(1,end) 0s 1 normal both}@-webkit-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-moz-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-ms-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@-o-keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}@keyframes -amp-start{from{visibility:hidden}to{visibility:visible}}</style><noscript><style amp-boilerplate>body{-webkit-animation:none;-moz-animation:none;-ms-animation:none;animation:none}</style></noscript>
    <script async src="https://cdn.ampproject.org/v0.js"></script>
    <script async custom-element="amp-story" src="https://cdn.ampproject.org/v0/amp-story-1.0.js"></script>
    <style amp-custom>
      amp-story-page {
        background-color: #fff;
      }
      amp-story-grid-layer {
        padding: 0;
      }
    </style>
  </head>
  <body>
    <amp-story standalone
        title="Web Story Storyboard Template"
        publisher="Alan Kent"
        publisher-logo-src="https://example.com/publisher-logo-96x96.png"
        poster-portrait-src="poster-portrait.png"
        poster-landscape-src="poster-landscape.png"
        poster-square-src="poster-square.png">
EOF


for i in {1..96}
do
  PAGE=`printf "%02d" $i`
  cat <<EOF
      <amp-story-page id="page-${PAGE}">
        <amp-story-grid-layer preset="2021-background" template="fill">
          <amp-img src="page-${PAGE}.png" width="${WIDTH}" height="${HEIGHT}" layout="responsive"></amp-img>
        </amp-story-grid-layer>
      </amp-story-page>
EOF
done


cat <<EOF
      <amp-story-bookend src="bookend.json" layout="nodisplay"></amp-story-bookend>
    </amp-story>
  </body>
</html>
EOF
