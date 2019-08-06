<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>Homepage</h2>
<div class="homePageOfPotholes">


	<c:forEach items="${potholes}" var="potholes">


		<span> Address:</span>
		<c:out value="${potholes.address.addressLine1}" />
		<br>
		<span> Address Line 2:</span>
		<c:out value="${potholes.address.addressLine2}" />
		<br>
		<span> ZipCode:</span>
		<c:out value="${potholes.address.zipCode}" />
		<br>
		<span> City:</span>
		<c:out value="${potholes.address.city}" />
		<br>
		<span> Size:</span>
		<c:out value="${potholes.size}" />
		<br>
		<span> Description:</span>
		<c:out value="${potholes.description}" />
		<br>
		<span> Created On:</span>
		<c:out value="${potholes.createdOn}" />
		<br>
		
	</c:forEach>
	
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />