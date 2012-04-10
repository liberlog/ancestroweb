
		echo "var marker[n] = new L.Marker(new L.LatLng([Latitud],[Longitud]), {icon: [Icon]});\n";
		echo "map.addLayer(marker[n]);\n";
		if ( $_GET["name"]=="" )
			echo "marker[n].bindPopup('[NameOrCity]');\n";
		else
			echo "marker[n].bindPopup('[NameOrCity]').openPopup();\n";
[MapLine]
