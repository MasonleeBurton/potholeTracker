<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>Submit Pothole</h2>

<div>

	<c:url value="/submit" var="submitURL" />


	<form:form action="${submitURL}" method="POST" modelAttribute="pothole">

		<label for="size">Size</label>
		<form:input path="size" />

		<label for="description">Description</label>
		<form:input path="description" />

		<label for="latitude">Latitude</label>
		<form:input path="latitude" />

		<label for="longitude">Longitude</label>
		<form:input path="longitude" />

		<p>Address</p>
		<label for="address.addressLine1">Address Line 1</label>
		<form:input path="address.addressLine1" />

		<label for="address.addressLine2">Address Line 2</label>
		<form:input path="address.addressLine2" />

		<label for="address.city">City</label>
		<form:input path="address.city" />

		<label for="address.zipCode">Zip Code</label>
		<form:input path="address.zipCode" />

		<input type="submit" value="Submit" />

	</form:form>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />