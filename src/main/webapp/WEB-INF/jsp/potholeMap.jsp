<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<c:set var="columbusLatitude" value="39.9612"/>
<c:set var="columbusLongitude" value="-82.9988"/>

 <div id="map-canvas" style="height:300px; width:500px"></div>
 
 <script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANsplbu_wQ2HF2Fp29fD_X0LA_xczXkgc"></script>
<script>
var map;
function initialize() {
  const mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng(`${columbusLatitude}`, `${columbusLongitude}`)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  
  const potholes = `{$potholes}`;
  
  <c:forEach var="pothole" items="${potholes}">
  	const potholePosition = {lat: ${pothole.latitude}, lng: ${pothole.longitude}};
  
      let contentString = `
          <strong>${pothole.description}</strong>
          <h1>${pothole.address.addressLine1}</h1>
          `;
          let infowindow = new google.maps.InfoWindow({
            content: contentString
          });
          let marker = new google.maps.Marker({
            position: potholePosition,
            map: map
          });
          marker.addListener('click', function() {
            infowindow.open(map, marker);
          });
  </c:forEach>
  
  
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
 
<c:import url="/WEB-INF/jsp/footer.jsp" />