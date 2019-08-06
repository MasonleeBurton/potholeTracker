<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<h2>Homepage</h2>
<div class="homePageOfPotholes">

	<c:forEach items="${potholes}" var="potholes">

		<span> Address:</span>
		<c:out value="${pothole.address.addressLine1}" />
		<br>
		<span> Address Line 2:</span>
		<c:out value="${pothole.address.addressLine2}" />
		<br>
		<span> ZipCode:</span>
		<c:out value="${pothole.address.zipCode}" />
		<br>
		<span> City:</span>
		<c:out value="${pothole.address.city}" />
		<br>
		<span> Size:</span>
		<c:out value="${pothole.size}" />
		<br>
		<span> Description:</span>
		<c:out value="${pothole.description}" />
		<br>
		<span> Created On:</span>
		<c:out value="${pothole.createdOn}" />
		<br>
		
	</c:forEach>
	
</div>