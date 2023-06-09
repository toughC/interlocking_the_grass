<!DOCTYPE html>
<html>
  <head>
    <title>Tiled WMS</title>
    <link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>
  </head>
  <body>
    <div id="map" class="map"></div>
    <script>
    var projExtent = ol.proj.get('EPSG:3857').getExtent();
    var startResolution = ol.extent.getWidth(projExtent) / 256;
    var resolutions = new Array(22);
    for (var i = 0, ii = resolutions.length; i < ii; ++i) {
      resolutions[i] = startResolution / Math.pow(2, i);
    }
    var tileGrid = new ol.tilegrid.TileGrid({
      extent: [-13884991, 2870341, -7455066, 6338219],
      resolutions: resolutions,
      tileSize: [512, 256]
    });

    var layers = [
      new ol.layer.Tile({
        source: new ol.source.OSM()
      }),
      new ol.layer.Tile({
        source: new ol.source.TileWMS({
          url: 'http://seesunit.iptime.org:18989/geoserver/ows?',
          params: {'LAYERS': 'seesun:ndms_tdr_alc', 'TILED': true},
          serverType: 'geoserver',

          version : "1.3.0",
          transparent : "true",
          format : "image/png",
          tiled : "true",
        })
      })
    ];
	var map = new ol.Map({
		  layers: layers, // 레이어 목록 설정
		  target: 'map', // 지도를 렌더링할 HTML 요소 ID
		  view: new ol.View({
		    center: ol.proj.fromLonLat([129.0756, 35.1795]), // 중심점 좌표 설정
		    zoom: 10 // 초기 줌 레벨 설정
		  })
		});
    </script>
  </body>
</html>