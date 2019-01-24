function initMap(locations) {
  var locationsListener = document.getElementsByClassName('location-name')
  for(var i = 0; i < locationsListener.length; i++) {
    locationsListener[i].addEventListener('click', function(){
      let lat = parseFloat(this.getAttribute('data-latitude'))
      let long = parseFloat(this.getAttribute('data-longitude'))
      let feature = new ol.Feature({
        geometry: new ol.geom.Point(ol.proj.fromLonLat([long,lat]))
      })
      var point = feature.getGeometry()
      map.getView().setCenter(point.getCoordinates())
    }, false)
  }

  let iconFeatures = []
  let view = new ol.View({
    center: [0, 0],
    zoom: 3
  })

  if(locations.length > 0) {
    for(let i in locations) {
      let iconFeature =  new ol.Feature({
        geometry: new ol.geom.Point(ol.proj.fromLonLat([locations[i][0], locations[i][1]]))
      })
      iconFeatures.push(iconFeature)
    }
  }

  let vectorSource = new ol.source.Vector({
    features: iconFeatures
  })

  let vectorLayer = new ol.layer.Vector({
    source: vectorSource,
     // style for all elements on a layer
    style: new ol.style.Style({
      image: new ol.style.Icon({
        anchor: [0.5, 46],
        anchorXUnits: 'fraction',
        anchorYUnits: 'pixels',
        src: 'https://openlayers.org/en/latest/examples/data/icon.png'
       })
    })
  })

  let tileLayer = new ol.layer.Tile({
      source: new ol.source.OSM()
    })


  let map = new ol.Map({
    layers: [tileLayer,vectorLayer],
    target: document.getElementById('map'),
    view: view
  })
}
