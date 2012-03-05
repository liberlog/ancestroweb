function createMap(aname)
{
var map = new L.Map('map');

var cloudmadeUrl = 'http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/22677/256/{z}/{x}/{y}.png',
	cloudmadeAttribution = 'Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade',
	cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: [Zoom], attribution: cloudmadeAttribution});

map.setView(new L.LatLng([Latitud], [Longitud]), 13).addLayer(cloudmade);
		
var littleDot = new LeafIcon('Images/Map/littleDot.gif');
var littleMiddleDot = new LeafIcon('Images/Map/littleMiddleDot.gif');
var middleDot = new LeafIcon('Images/Map/middleDot.gif');
var bigMiddleDot = new LeafIcon('Images/Map/bigMiddleDot.gif');
var bigDot = new LeafIcon('Images/Map/bigDot.gif');
switch ( aname ) {
[MapLine]
}

}
