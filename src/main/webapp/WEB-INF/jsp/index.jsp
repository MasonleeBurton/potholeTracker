<h2>Homepage</h2>
<div class="homePageOfPotholes">

	<c:forEach items="${potholeList}" var="pothole">

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