<div id="center">
<h1 id="map"><IMG SRC="Images/map.gif" ALT="Map" />[Caption]</h1>
	<div id="mapnames" style="height: 440px; margin-bottom: 18px"></div>
</div>
	<script>
		var map = new L.Map('mapnames', { trackResize : true });

		var cloudmadeUrl = 'http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/22677/256/{z}/{x}/{y}.png',
			cloudmadeAttribution = 'Map data &copy; 2011 OpenStreetMap contributors, Imagery &copy; 2011 CloudMade',
			cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: [MaxZoom], attribution: cloudmadeAttribution, reuseTiles:true});

var littleIcon = L.Icon.extend({
	iconUrl: 'Images/Map/littleDot.png',
	shadowUrl: 'Images/Map/littleDotShadow.png',
	iconSize: new L.Point(3, 3),
	shadowSize: new L.Point(4, 4),
	iconAnchor: new L.Point(1, 1),
	popupAnchor: new L.Point(-3, -3)
	});
var littleMiddleIcon = L.Icon.extend({
	iconUrl: 'Images/Map/littleMiddleDot.png',
	shadowUrl: 'Images/Map/littleMiddleDotShadow.png',
	iconSize: new L.Point(5, 5),
	shadowSize: new L.Point(7, 7),
	iconAnchor: new L.Point(2, 2),
	popupAnchor: new L.Point(-3, -3)
	});
var middleIcon = L.Icon.extend({
	iconUrl: 'Images/Map/middleDot.png',
	shadowUrl: 'Images/Map/middleDotShadow.png',
	iconSize: new L.Point(7, 7),
	shadowSize: new L.Point(9, 9),
	iconAnchor: new L.Point(3, 3),
	popupAnchor: new L.Point(-3, -3)
	});
var bigMiddleIcon = L.Icon.extend({
	iconUrl: 'Images/Map/middleBigDot.png',
	shadowUrl: 'Images/Map/middleBigDotShadow.png',
	iconSize: new L.Point(9, 9),
	shadowSize: new L.Point(11, 11),
	iconAnchor: new L.Point(4, 4),
	popupAnchor: new L.Point(-3, -3)
	});
var bigIcon = L.Icon.extend({
	iconUrl: 'Images/Map/bigDot.png',
	shadowUrl: 'Images/Map/bigDotShadow.png',
	iconSize: new L.Point(11, 11),
	shadowSize: new L.Point(13, 13),
	iconAnchor: new L.Point(5, 5),
	popupAnchor: new L.Point(-3, -3)
	});

var littleDot = new littleIcon();
var littleMiddleDot = new littleMiddleIcon();
var middleDot = new middleIcon();
var bigMiddleDot = new bigMiddleIcon();
var bigDot = new bigIcon();

<?

switch ($_GET["name"]) 
{
[MapCase]
}
?>
</script>

