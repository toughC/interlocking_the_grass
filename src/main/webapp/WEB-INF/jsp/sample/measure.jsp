<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<title>선의 거리와 다각형의 면적 계산하기 - Seesunguide 개발자 센터</title>
<meta charset="UTF-8">
<c:import url="/WEB-INF/jsp/inc/header.jsp"></c:import>
<c:import url="/WEB-INF/jsp/inc/body.jsp"></c:import>

<script>
	var pageId = 'DE_002', pageName = 'sample'
</script>
<style>
.tooltip {
	position: relative;
	background: rgba(0, 0, 0, 0.5);
	border-radius: 4px;
	color: white;
	padding: 4px 8px;
	opacity: 0.7;
	white-space: nowrap;
}

.tooltip-measure {
	opacity: 1;
	font-weight: bold;
}

.tooltip-static {
	background-color: #ffcc33;
	color: black;
	border: 1px solid white;
}

.tooltip-measure:before, .tooltip-static:before {
	border-top: 6px solid rgba(0, 0, 0, 0.5);
	border-right: 6px solid transparent;
	border-left: 6px solid transparent;
	content: "";
	position: absolute;
	bottom: -6px;
	margin-left: -7px;
	left: 50%;
}

.tooltip-static:before {
	border-top-color: #ffcc33;
}
</style>
<body>
	<h1>선의 거리와 다각형의 면적 계산하기</h1>
	<ul class="listStyle-01 row">
		<li class="textContent">지도를 마우스로 클릭하면 선과 다각형 그리기가 시작되고 마우스를 더블클릭하면 선과 다각형 그리기가 종료되면서 그려진 선의 거리(단위 : m, km)와 다각형의 총 면적(단위 : m², km²)을 표시합니다.</li>
	</ul>
	<p style="text-align: right; margin-bottom: 3px;">[작성일: 2023-06-02]</p>
	<div id="map" style="width: 100%; height: 330px;"></div>

	<button id="lengthButton" class="zoomBtn">Length (LineString)</button>
	<button id="areaButton" class="zoomBtn">Area (Polygon)</button>

	<script type="text/javascript">
	// OpenLayers 지도 레이어를 생성합니다.
	var raster = new ol.layer.Tile({
	  source: new ol.source.OSM()
	});

	// 벡터 레이어의 데이터를 저장할 소스를 생성합니다.
	var source = new ol.source.Vector();

	// 벡터 레이어를 생성합니다.
	var vector = new ol.layer.Vector({
	  source: source,
	  style: new ol.style.Style({
	    fill: new ol.style.Fill({
	      color: 'rgba(255, 255, 255, 0.2)'
	    }),
	    stroke: new ol.style.Stroke({
	      color: '#ffcc33',
	      width: 2
	    }),
	    image: new ol.style.Circle({
	      radius: 7,
	      fill: new ol.style.Fill({
	        color: '#ffcc33'
	      })
	    })
	  })
	});

	var sketch;
	var helpTooltipElement;
	var helpTooltip;
	var measureTooltipElement;
	var measureTooltip;
	var continuePolygonMsg = 'Click to continue drawing the polygon';
	var continueLineMsg = 'Click to continue drawing the line';

	// 포인터 이동 이벤트 핸들러를 정의합니다.
	var pointerMoveHandler = function(evt) {
	  if (evt.dragging) {
	    return;
	  }
	  
	  var helpMsg = 'Click to start drawing';
	  
	  if (sketch) {
	    var geom = sketch.getGeometry();
	    if (geom instanceof ol.geom.Polygon) {
	      helpMsg = continuePolygonMsg;
	    } else if (geom instanceof ol.geom.LineString) {
	      helpMsg = continueLineMsg;
	    }
	  }
	  
	  helpTooltipElement.innerHTML = helpMsg;
	  helpTooltip.setPosition(evt.coordinate);
	  helpTooltipElement.classList.remove('hidden');
	};

	// 지도를 생성합니다.
	var map = new ol.Map({
	  layers: [raster, vector],
	  target: 'map',
	  view: new ol.View({
	    center: ol.proj.fromLonLat([126.9784, 37.5667]),
	    zoom: 17
	  })
	});

	// 포인터 이동 이벤트를 등록합니다.
	map.on('pointermove', pointerMoveHandler);

	// 마우스가 지도 영역을 벗어났을 때 도움말 툴팁을 숨깁니다.
	map.getViewport().addEventListener('mouseout', function() {
	  helpTooltipElement.classList.add('hidden');
	});

	// 길이 측정 버튼과 면적 측정 버튼을 가져옵니다.
	var lengthButton = document.getElementById('lengthButton');
	var areaButton = document.getElementById('areaButton');

	var draw;

	// 선 길이를 포맷하는 함수를 정의합니다.
	var formatLength = function(line) {
	  var length = ol.Sphere.getLength(line);
	  var output;
	  
	  if (length > 100) {
	    output = (Math.round(length / 1000 * 100) / 100) + ' km';
	  } else {
	    output = (Math.round(length * 100) / 100) + ' m';
	  }
	  
	  return output;
	};

	// 면적을 포맷하는 함수를 정의합니다.
	var formatArea = function(polygon) {
	  var area = ol.Sphere.getArea(polygon);
	  var output;
	  
	  if (area > 10000) {
	    output = (Math.round(area / 1000000 * 100) / 100) + ' km<sup>2</sup>';
	  } else {
	    output = (Math.round(area * 100) / 100) + ' m<sup>2</sup>';
	  }
	  
	  return output;
	};

	// 그리기 도구를 추가하는 함수를 정의합니다.
	function addInteraction(type) {
	  draw = new ol.interaction.Draw({
	    source: source,
	    type: type,
	    style: new ol.style.Style({
	      fill: new ol.style.Fill({
	        color: 'rgba(255, 255, 255, 0.2)'
	      }),
	      stroke: new ol.style.Stroke({
	        color: 'rgba(0, 0, 0, 0.5)',
	        lineDash: [10, 10],
	        width: 2
	      }),
	      image: new ol.style.Circle({
	        radius: 5,
	        stroke: new ol.style.Stroke({
	          color: 'rgba(0, 0, 0, 0.7)'
	        }),
	        fill: new ol.style.Fill({
	          color: 'rgba(255, 255, 255, 0.2)'
	        })
	      })
	    })
	  });
	  
	  map.addInteraction(draw);
	  
	  createMeasureTooltip();
	  createHelpTooltip();
	  
	  var listener;
	  
	  draw.on('drawstart', function(evt) {
	    sketch = evt.feature;
	    
	    var tooltipCoord = evt.coordinate;
	    
	    listener = sketch.getGeometry().on('change', function(evt) {
	      var geom = evt.target;
	      var output;
	      
	      if (geom instanceof ol.geom.Polygon) {
	        output = formatArea(geom);
	        tooltipCoord = geom.getInteriorPoint().getCoordinates();
	      } else if (geom instanceof ol.geom.LineString) {
	        output = formatLength(geom);
	        tooltipCoord = geom.getLastCoordinate();
	      }
	      
	      measureTooltipElement.innerHTML = output;
	      measureTooltip.setPosition(tooltipCoord);
	    });
	  }, this);
	  
	  draw.on('drawend', function() {
	    measureTooltipElement.className = 'tooltip tooltip-static';
	    measureTooltip.setOffset([0, -7]);
	    sketch = null;
	    measureTooltipElement = null;
	    createMeasureTooltip();
	    ol.Observable.unByKey(listener);
	  }, this);
	}

	// 도움말 툴팁을 생성하는 함수를 정의합니다.
	function createHelpTooltip() {
	  if (helpTooltipElement) {
	    helpTooltipElement.parentNode.removeChild(helpTooltipElement);
	  }
	  
	  helpTooltipElement = document.createElement('div');
	  helpTooltipElement.className = 'tooltip hidden';
	  
	  helpTooltip = new ol.Overlay({
	    element: helpTooltipElement,
	    offset: [15, 0],
	    positioning: 'center-left'
	  });
	  
	  map.addOverlay(helpTooltip);
	}

	// 측정 결과 툴팁을 생성하는 함수를 정의합니다.
	function createMeasureTooltip() {
	  if (measureTooltipElement) {
	    measureTooltipElement.parentNode.removeChild(measureTooltipElement);
	  }
	  
	  measureTooltipElement = document.createElement('div');
	  measureTooltipElement.className = 'tooltip tooltip-measure';
	  
	  measureTooltip = new ol.Overlay({
	    element: measureTooltipElement,
	    offset: [0, -15],
	    positioning: 'bottom-center'
	  });
	  
	  map.addOverlay(measureTooltip);
	}

	// 길이 측정 버튼 클릭 이벤트를 처리하는 핸들러를 등록합니다.
	lengthButton.addEventListener('click', function() {
	  map.removeInteraction(draw);
	  addInteraction('LineString');
	});

	// 면적 측정 버튼 클릭 이벤트를 처리하는 핸들러를 등록합니다.
	areaButton.addEventListener('click', function() {
	  map.removeInteraction(draw);
	  addInteraction('Polygon');
	});

	// 초기에 선 길이 측정 도구를 활성화합니다.
	addInteraction('LineString');

</script>

	<div class="wrap_tab">
		<ul>
			<li class="code-01" onclick="toggleCodeDisplay('jsCode')">Javascript</li>
			<li class="code-02" onclick="toggleCodeDisplay('htmlCode')">Javascript
				+ HTML</li>
		</ul>
		<div id="jsCode" class="tabbody">
			<figure class="highlight">
				<pre>
					<code class="language-js"
						style="margin-top: 0; margin-bottom: 30px;" data-lang="js">
// OpenLayers 지도 레이어를 생성합니다.
var raster = new ol.layer.Tile({
		source: new ol.source.OSM()
});

// 벡터 레이어의 데이터를 저장할 소스를 생성합니다.
var source = new ol.source.Vector();

// 벡터 레이어를 생성합니다.
var vector = new ol.layer.Vector({
		source: source,
		style: new ol.style.Style({
				fill: new ol.style.Fill({
						color: 'rgba(255, 255, 255, 0.2)'
				}),
				stroke: new ol.style.Stroke({
				  		color: '#ffcc33',
				  		width: 2
				}),
				image: new ol.style.Circle({
				  		radius: 7,
						fill: new ol.style.Fill({
								color: '#ffcc33'
						})
				})
		})
});

var sketch;
var helpTooltipElement;
var helpTooltip;
var measureTooltipElement;
var measureTooltip;
var continuePolygonMsg = 'Click to continue drawing the polygon';
var continueLineMsg = 'Click to continue drawing the line';

// 포인터 이동 이벤트 핸들러를 정의합니다.
var pointerMoveHandler = function(evt) {
		if (evt.dragging) {
				return;
		}
  
		var helpMsg = 'Click to start drawing';
		
		if (sketch) {
				var geom = sketch.getGeometry();
				if (geom instanceof ol.geom.Polygon) {
						helpMsg = continuePolygonMsg;
				} else if (geom instanceof ol.geom.LineString) {
						helpMsg = continueLineMsg;
				}
		}
				
		helpTooltipElement.innerHTML = helpMsg;
		helpTooltip.setPosition(evt.coordinate);
		helpTooltipElement.classList.remove('hidden');
};

// 지도를 생성합니다.
var map = new ol.Map({
		layers: [raster, vector],
		target: 'map',
		view: new ol.View({
				center: ol.proj.fromLonLat([126.9784, 37.5667]),
				zoom: 17
		})
});

// 포인터 이동 이벤트를 등록합니다.
map.on('pointermove', pointerMoveHandler);

// 마우스가 지도 영역을 벗어났을 때 도움말 툴팁을 숨깁니다.
map.getViewport().addEventListener('mouseout', function() {
		helpTooltipElement.classList.add('hidden');
});

// 길이 측정 버튼과 면적 측정 버튼을 가져옵니다.
var lengthButton = document.getElementById('lengthButton');
var areaButton = document.getElementById('areaButton');

var draw;

// 선 길이를 포맷하는 함수를 정의합니다.
var formatLength = function(line) {
		var length = ol.Sphere.getLength(line);
		var output;
		
		if (length > 100) {
				output = (Math.round(length / 1000 * 100) / 100) + ' km';
		} else {
				output = (Math.round(length * 100) / 100) + ' m';
		}
		
		return output;
};

// 면적을 포맷하는 함수를 정의합니다.
var formatArea = function(polygon) {
		var area = ol.Sphere.getArea(polygon);
		var output;
		
		if (area > 10000) {
				output = (Math.round(area / 1000000 * 100) / 100) + ' km<sup>2</sup>';
		} else {
		  		output = (Math.round(area * 100) / 100) + ' m<sup>2</sup>';
		}
		
		return output;
};

// 그리기 도구를 추가하는 함수를 정의합니다.
function addInteraction(type) {
		draw = new ol.interaction.Draw({
				source: source,
				type: type,
				style: new ol.style.Style({
						fill: new ol.style.Fill({
								color: 'rgba(255, 255, 255, 0.2)'
						}),
						stroke: new ol.style.Stroke({
						  		color: 'rgba(0, 0, 0, 0.5)',
						  		lineDash: [10, 10],
						  		width: 2
						}),
						image: new ol.style.Circle({
								radius: 5,
								stroke: new ol.style.Stroke({
										color: 'rgba(0, 0, 0, 0.7)'
								}),
								fill: new ol.style.Fill({
								  		color: 'rgba(255, 255, 255, 0.2)'
								})
						})
				})
		});
		
		map.addInteraction(draw);
		
		createMeasureTooltip();
		createHelpTooltip();
		
		var listener;
		
		draw.on('drawstart', function(evt) {
				sketch = evt.feature;
				
				var tooltipCoord = evt.coordinate;
				
				listener = sketch.getGeometry().on('change', function(evt) {
						var geom = evt.target;
						var output;
						
						if (geom instanceof ol.geom.Polygon) {
								output = formatArea(geom);
								tooltipCoord = geom.getInteriorPoint().getCoordinates();
						} else if (geom instanceof ol.geom.LineString) {
								output = formatLength(geom);
								tooltipCoord = geom.getLastCoordinate();
						}
						
						measureTooltipElement.innerHTML = output;
						measureTooltip.setPosition(tooltipCoord);
				});
		}, this);
		
		draw.on('drawend', function() {
				measureTooltipElement.className = 'tooltip tooltip-static';
				measureTooltip.setOffset([0, -7]);
				sketch = null;
				measureTooltipElement = null;
				createMeasureTooltip();
				ol.Observable.unByKey(listener);
		}, this);
}

// 도움말 툴팁을 생성하는 함수를 정의합니다.
function createHelpTooltip() {
		if (helpTooltipElement) {
				helpTooltipElement.parentNode.removeChild(helpTooltipElement);
		}
		
		helpTooltipElement = document.createElement('div');
		helpTooltipElement.className = 'tooltip hidden';
		
		helpTooltip = new ol.Overlay({
				element: helpTooltipElement,
				offset: [15, 0],
				positioning: 'center-left'
		});
		
		map.addOverlay(helpTooltip);
}

// 측정 결과 툴팁을 생성하는 함수를 정의합니다.
function createMeasureTooltip() {
		if (measureTooltipElement) {
				measureTooltipElement.parentNode.removeChild(measureTooltipElement);
		}
		
		measureTooltipElement = document.createElement('div');
		measureTooltipElement.className = 'tooltip tooltip-measure';
		
		measureTooltip = new ol.Overlay({
				element: measureTooltipElement,
				offset: [0, -15],
				positioning: 'bottom-center'
		});
		
		map.addOverlay(measureTooltip);
}

// 길이 측정 버튼 클릭 이벤트를 처리하는 핸들러를 등록합니다.
lengthButton.addEventListener('click', function() {
		map.removeInteraction(draw);
		addInteraction('LineString');
});

// 면적 측정 버튼 클릭 이벤트를 처리하는 핸들러를 등록합니다.
areaButton.addEventListener('click', function() {
		map.removeInteraction(draw);
		addInteraction('Polygon');
});

// 초기에 선 길이 측정 도구를 활성화합니다.
addInteraction('LineString');

</code>
				</pre>
			</figure>
		</div>
		<div id="htmlCode" class="tabbody">
			<figure class="highlight">
				<pre>
					<code class="language-html"
						style="margin-top: 0; margin-bottom: 30px;" data-lang="html">
&lt;!DOCTYPE html&gt;
&lt;html&gt;
&lt;head&gt;
		&lt;meta charset="utf-8"/&gt;
		&lt;title&gt;사각형, 박스, 별 그리기&lt;/title&gt;
		&lt;style&gt;
		.tooltip {
			position: relative;
			background: rgba(0, 0, 0, 0.5);
			border-radius: 4px;
			color: white;
			padding: 4px 8px;
			opacity: 0.7;
			white-space: nowrap;
		}
		
		.tooltip-measure {
			opacity: 1;
			font-weight: bold;
		}
		
		.tooltip-static {
			background-color: #ffcc33;
			color: black;
			border: 1px solid white;
		}
		
		.tooltip-measure:before, .tooltip-static:before {
			border-top: 6px solid rgba(0, 0, 0, 0.5);
			border-right: 6px solid transparent;
			border-left: 6px solid transparent;
			content: "";
			position: absolute;
			bottom: -6px;
			margin-left: -7px;
			left: 50%;
		}
		
		.tooltip-static:before {
			border-top-color: #ffcc33;
		}
		&lt;/style&gt;
&lt;/head&gt;
&lt;body&gt;
&lt;div id="map" style="width: 100%; height: 330px;"&gt;&lt;/div&gt;

&lt;button id="lengthButton" class="zoomBtn"&gt;Length (LineString)&lt;/buttongt;
&lt;button id="areaButton" class="zoomBtn"&gt;Area (Polygon)&lt;/buttongt;

&lt;script&gt;
		// OpenLayers 지도 레이어를 생성합니다.
		var raster = new ol.layer.Tile({
				source: new ol.source.OSM()
		});
		
		// 벡터 레이어의 데이터를 저장할 소스를 생성합니다.
		var source = new ol.source.Vector();
		
		// 벡터 레이어를 생성합니다.
		var vector = new ol.layer.Vector({
				source: source,
				style: new ol.style.Style({
						fill: new ol.style.Fill({
								color: 'rgba(255, 255, 255, 0.2)'
						}),
						stroke: new ol.style.Stroke({
						  		color: '#ffcc33',
						  		width: 2
						}),
						image: new ol.style.Circle({
						  		radius: 7,
								fill: new ol.style.Fill({
										color: '#ffcc33'
								})
						})
				})
		});
		
		var sketch;
		var helpTooltipElement;
		var helpTooltip;
		var measureTooltipElement;
		var measureTooltip;
		var continuePolygonMsg = 'Click to continue drawing the polygon';
		var continueLineMsg = 'Click to continue drawing the line';
		
		// 포인터 이동 이벤트 핸들러를 정의합니다.
		var pointerMoveHandler = function(evt) {
				if (evt.dragging) {
						return;
				}
		  
				var helpMsg = 'Click to start drawing';
				
				if (sketch) {
						var geom = sketch.getGeometry();
						if (geom instanceof ol.geom.Polygon) {
								helpMsg = continuePolygonMsg;
						} else if (geom instanceof ol.geom.LineString) {
								helpMsg = continueLineMsg;
						}
				}
						
				helpTooltipElement.innerHTML = helpMsg;
				helpTooltip.setPosition(evt.coordinate);
				helpTooltipElement.classList.remove('hidden');
		};
		
		// 지도를 생성합니다.
		var map = new ol.Map({
				layers: [raster, vector],
				target: 'map',
				view: new ol.View({
						center: ol.proj.fromLonLat([126.9784, 37.5667]),
						zoom: 17
				})
		});
		
		// 포인터 이동 이벤트를 등록합니다.
		map.on('pointermove', pointerMoveHandler);
		
		// 마우스가 지도 영역을 벗어났을 때 도움말 툴팁을 숨깁니다.
		map.getViewport().addEventListener('mouseout', function() {
				helpTooltipElement.classList.add('hidden');
		});
		
		// 길이 측정 버튼과 면적 측정 버튼을 가져옵니다.
		var lengthButton = document.getElementById('lengthButton');
		var areaButton = document.getElementById('areaButton');
		
		var draw;
		
		// 선 길이를 포맷하는 함수를 정의합니다.
		var formatLength = function(line) {
				var length = ol.Sphere.getLength(line);
				var output;
				
				if (length > 100) {
						output = (Math.round(length / 1000 * 100) / 100) + ' km';
				} else {
						output = (Math.round(length * 100) / 100) + ' m';
				}
				
				return output;
		};
		
		// 면적을 포맷하는 함수를 정의합니다.
		var formatArea = function(polygon) {
				var area = ol.Sphere.getArea(polygon);
				var output;
				
				if (area > 10000) {
						output = (Math.round(area / 1000000 * 100) / 100) + ' km<sup>2</sup>';
				} else {
				  		output = (Math.round(area * 100) / 100) + ' m<sup>2</sup>';
				}
				
				return output;
		};
		
		// 그리기 도구를 추가하는 함수를 정의합니다.
		function addInteraction(type) {
				draw = new ol.interaction.Draw({
						source: source,
						type: type,
						style: new ol.style.Style({
								fill: new ol.style.Fill({
										color: 'rgba(255, 255, 255, 0.2)'
								}),
								stroke: new ol.style.Stroke({
								  		color: 'rgba(0, 0, 0, 0.5)',
								  		lineDash: [10, 10],
								  		width: 2
								}),
								image: new ol.style.Circle({
										radius: 5,
										stroke: new ol.style.Stroke({
												color: 'rgba(0, 0, 0, 0.7)'
										}),
										fill: new ol.style.Fill({
										  		color: 'rgba(255, 255, 255, 0.2)'
										})
								})
						})
				});
				
				map.addInteraction(draw);
				
				createMeasureTooltip();
				createHelpTooltip();
				
				var listener;
				
				draw.on('drawstart', function(evt) {
						sketch = evt.feature;
						
						var tooltipCoord = evt.coordinate;
						
						listener = sketch.getGeometry().on('change', function(evt) {
								var geom = evt.target;
								var output;
								
								if (geom instanceof ol.geom.Polygon) {
										output = formatArea(geom);
										tooltipCoord = geom.getInteriorPoint().getCoordinates();
								} else if (geom instanceof ol.geom.LineString) {
										output = formatLength(geom);
										tooltipCoord = geom.getLastCoordinate();
								}
								
								measureTooltipElement.innerHTML = output;
								measureTooltip.setPosition(tooltipCoord);
						});
				}, this);
				
				draw.on('drawend', function() {
						measureTooltipElement.className = 'tooltip tooltip-static';
						measureTooltip.setOffset([0, -7]);
						sketch = null;
						measureTooltipElement = null;
						createMeasureTooltip();
						ol.Observable.unByKey(listener);
				}, this);
		}
		
		// 도움말 툴팁을 생성하는 함수를 정의합니다.
		function createHelpTooltip() {
				if (helpTooltipElement) {
						helpTooltipElement.parentNode.removeChild(helpTooltipElement);
				}
				
				helpTooltipElement = document.createElement('div');
				helpTooltipElement.className = 'tooltip hidden';
				
				helpTooltip = new ol.Overlay({
						element: helpTooltipElement,
						offset: [15, 0],
						positioning: 'center-left'
				});
				
				map.addOverlay(helpTooltip);
		}
		
		// 측정 결과 툴팁을 생성하는 함수를 정의합니다.
		function createMeasureTooltip() {
				if (measureTooltipElement) {
						measureTooltipElement.parentNode.removeChild(measureTooltipElement);
				}
				
				measureTooltipElement = document.createElement('div');
				measureTooltipElement.className = 'tooltip tooltip-measure';
				
				measureTooltip = new ol.Overlay({
						element: measureTooltipElement,
						offset: [0, -15],
						positioning: 'bottom-center'
				});
				
				map.addOverlay(measureTooltip);
		}
		
		// 길이 측정 버튼 클릭 이벤트를 처리하는 핸들러를 등록합니다.
		lengthButton.addEventListener('click', function() {
				map.removeInteraction(draw);
				addInteraction('LineString');
		});
		
		// 면적 측정 버튼 클릭 이벤트를 처리하는 핸들러를 등록합니다.
		areaButton.addEventListener('click', function() {
				map.removeInteraction(draw);
				addInteraction('Polygon');
		});
		
		// 초기에 선 길이 측정 도구를 활성화합니다.
		addInteraction('LineString');

&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;

</code>
				</pre>
			</figure>
		</div>
	</div>
</body>
</html>
