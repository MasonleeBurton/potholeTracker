const columbusLatitude = 39.9612;
const columbusLongitude = -82.9988;

let map;
let infowindow;
let potholeContent;
const formContent =  `<body>
      <form action = "/submit" method="POST" name = "myForm">
         <table cellspacing = "2" cellpadding = "2" border = "1">
            <tr>
               <td align = "right">What size is the pothole?</td>
               <td><input type = "radio" value = "Small" name = "size"/>Small
               <input type = "radio" value = "Medium" name = "size"/> Medium
               <input type = "radio" value = "Large" name = "size"/> Large </td>
            </tr>
            <tr>
               <td align = "right">Please describe the location of the pothole</td>
               <td><input type = "textarea" name = "description" rows="5" /></td>
            </tr>
			<tr>
               <td align = "right">Address Line 1</td>
               <td><input type = "text" name = "address.addressLine1"/></td>
            </tr>
			<tr>
               <td align = "right">Address Line 2</td>
               <td><input type = "text" name = "address.addressLine2"/></td>
            </tr>
			<tr>
               <td align = "right">City</td>
               <td><input type = "text" name = "address.city"/></td>
            </tr>
               <td align = "right">State</td>
               <td>
				  <select name = "address.state">
				  ${formatStates(window.states)}
                  </select>
               </td>
			</tr>
			<tr>
			<td align = "right">Zip Code</td>
			<td><input type = "text" name = "Zip" /></td>
		 </tr>
            <tr>
               <td align = "right"></td>
               <td><input type = "submit" value = "Submit" id = "submit"/></td>
            </tr>
          </table>
      </form>
   </body> `;
function formatStates(states){
let listOfStates = "";	
for(i = 0; i < states.length; i++){
	listOfStates += `<option value = "${i+1}">${states[i]}</option>`
}
return listOfStates;
}

function formatDate(date) {
	return `${date.monthValue}/${date.dayOfMonth}/${date.year}`;
}

function displayForm(location) {
	var marker = new google.maps.Marker({
		position: location,
		map: map
	});
	if (infowindow) {
		infowindow.close();
	}
	infowindow = new google.maps.InfoWindow({
		content: formContent
	});
	infowindow.open(map, marker);
}

function initialize() {
	const mapOptions = {
		zoom: 10,
		center: new google.maps.LatLng(columbusLatitude, columbusLongitude)
	};
	map = new google.maps.Map(document.getElementById('map-canvas'),
		mapOptions);

	google.maps.event.addListener(map, 'click', function (event) {
		displayForm(event.latLng);
	});

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