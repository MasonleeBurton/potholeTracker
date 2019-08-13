<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<div id="map-canvas"></div>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyANsplbu_wQ2HF2Fp29fD_X0LA_xczXkgc"></script>
<<<<<<< HEAD
<script>
let map;
let infowindow;
let potholeContent;

function initialize() {
  const mapOptions = {
    zoom: 10,
    center: new google.maps.LatLng(`${columbusLatitude}`, `${columbusLongitude}`)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
  
  const potholes = `{$potholes}`;
  
  <c:forEach var="pothole" items="${potholes}">
  
  
  
  
  try {
 		const potholePosition = {lat: ${pothole.latitude}, lng: ${pothole.longitude}};
            
	   let marker = new google.maps.Marker({
	     position: potholePosition,
	     map: map
	   });
	   
	   marker.addListener('click', function() {
	 	if (infowindow) {
	        infowindow.close();
	    }
	 	<fmt:parseDate value="${ pothole.status.reportedOn }"
			pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
		<fmt:formatDate pattern="MM/dd/yyyy" var="reported"
			value="${ parsedDateTime }" />

		<fmt:parseDate value="${ pothole.status.inspectedOn }"
			pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
		<fmt:formatDate pattern="MM/dd/yyyy" var="inspected"
			value="${ parsedDateTime }" />

		<fmt:parseDate value="${ pothole.status.repairedOn }"
			pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
		<fmt:formatDate pattern="MM/dd/yyyy" var="repaired"
			value="${ parsedDateTime }" />

		<fmt:parseDate value="${ pothole.createdOn }" pattern="yyyy-MM-dd"
			var="parsedDateTime" type="both" />
		<fmt:formatDate pattern="MM/dd/yyyy" var="created"
			value="${ parsedDateTime }" />
	  
 	  potholeContent = `<div class="card-text bold">Address:</div> <c:out
			value="${pothole.address.addressLine1}" />, <c:if
			test="${not empty pothole.address.addressLine2}">
			<c:out value="${pothole.address.addressLine2}" />
		</c:if><br> <c:out value="${pothole.address.city}" />, <c:out
			value="${pothole.address.state}" />, <c:out
			value="${pothole.address.zipCode}" />


		<div class="bold">Description:</div> <c:out
			value="${pothole.description}" />

		<div class="bold">Size:</div> <c:out value="${pothole.size}" />

		<div class="bold">Created On:</div> <c:out value="${created}" />
		<div class="longlatBoxed">
		</div> <c:if test="${not empty reported}">
			<div class="bold">Reported On:</div>
			<c:out value="${reported}" />
		</c:if> <c:if test="${not empty inspected}">

			<div class="bold">Inspected On:</div>
			<c:out value="${inspected}" />
		</c:if> <c:if test="${not empty repaired}">

			<div class="bold">Repaired On:</div>
			<c:out value="${repaired}" />
		</c:if> <c:if test="${not empty pothole.status.rank}">

			<div class="bold">Severity:</div>
			<c:out value="${pothole.status.rank}" />
		</c:if>`;
	  	
	  	infowindow = new google.maps.InfoWindow({
	  		
	  		
	  		
     	content: potholeContent
	    });
	    infowindow.open(map, marker);
	   });
  } catch(error) {
	  console.error(error);
  }
  </c:forEach>
}
=======
>>>>>>> a67eec207e709aefac0bcbb3e271e0766d320708

<c:url var="potholeMapJs" value="/js/potholeMap.js" />
<script>window.potholes = ${potholes}</script>
<script src="${potholeMapJs}"></script>

<c:import url="/WEB-INF/jsp/footer.jsp" />