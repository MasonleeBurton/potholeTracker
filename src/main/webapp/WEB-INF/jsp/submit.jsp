<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>Submit Pothole</h2>

<div>

	<c:url value="/submit" var="submitURL" />


	<form:form action="${submitURL}" method="POST" modelAttribute="pothole">

		<label for="size">Size</label>
		<form:input path="size" />
		<form:errors path="size" cssClass="error" />

		<label for="description">Description</label>
		<form:input path="description" />
		<form:errors path="description" cssClass="error" />

		<label for="latitude">Latitude</label>
		<form:input path="latitude" />
		<form:errors path="latitude" cssClass="error" />

		<label for="longitude">Longitude</label>
		<form:input path="longitude" />
		<form:errors path="longitude" cssClass="error" />

		<p>Address</p>
		<label for="address.addressLine1">Address Line 1</label>
		<form:input path="address.addressLine1" />
		<form:errors path="address.addressLine1" cssClass="error" />

		<label for="address.addressLine2">Address Line 2</label>
		<form:input path="address.addressLine2" />
		<form:errors path="address.addressLine2" cssClass="error" />

		<label for="address.city">City</label>
		<form:input path="address.city" />
		<form:errors path="address.city" cssClass="error" />

		<label for="address.zipCode">Zip Code</label>
		<form:input path="address.zipCode" />
		<form:errors path="address.zipCode" cssClass="error" />

		<input type="submit" value="Submit" />

	</form:form>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />