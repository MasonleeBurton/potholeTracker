const columbusLatitude = 39.9612;
const columbusLongitude = -82.9988;

let map;
let infowindow;
let potholeContent;

function formatDate(date) {
	return `${date.monthValue}/${date.dayOfMonth}/${date.year}`;
}

function initialize() {
	const mapOptions = {
		zoom: 10,
		center: new google.maps.LatLng(columbusLatitude, columbusLongitude)
	};
	map = new google.maps.Map(document.getElementById('map-canvas'),
		mapOptions);

	window.potholes.forEach(pothole => {
		try {
			const potholePosition = {
				lat: parseFloat(pothole.latitude),
				lng: parseFloat(pothole.longitude)
			};

			let marker = new google.maps.Marker({
				position: potholePosition,
				map: map
			});

			marker.addListener('click', function () {
				if (infowindow) {
					infowindow.close();
				}

				potholeContent = `<div class="card-text bold">Address:</div> ${pothole.address.addressLine1}, 
					${pothole.address.addressLine2 != null ? pothole.address.addressLine2 : ''}
					<br> ${pothole.address.city}, ${pothole.address.state}
					${pothole.address.zipCode}
					<div class="bold">Size:</div> ${pothole.size}
					`;
				if (pothole.description != null && pothole.description.length > 0) {
					potholeContent += `<div class="bold">Description:</div> ${pothole.description}`;
				}
				potholeContent += `<div class="bold">Created On:</div> ${formatDate(pothole.createdOn)}`;
				potholeContent += pothole.status.reportedOn != null ? `<div class="bold">Reported On:</div>${formatDate(pothole.status.reportedOn)}` : '';
				potholeContent += pothole.status.inspectedOn != null ? `<div class="bold">Inspected On:</div>${formatDate(pothole.status.inspectedOn)}` : '';
				potholeContent += pothole.status.repairedOn != null ? `<div class="bold">Repaired On:</div>${formatDate(pothole.status.repairedOn)}` : '';
				potholeContent += pothole.status.rank != null ? `<div class="bold">Severity: </div>${pothole.status.rank}` : '';

				infowindow = new google.maps.InfoWindow({
					content: potholeContent
				});
				infowindow.open(map, marker);
			});
		} catch (error) {
			console.error(error);
		}
	});
}

google.maps.event.addDomListener(window, 'load', initialize);