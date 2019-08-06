<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>Submit Pothole</h2>

<div>

	<c:url value="/submit" var="submitURL" />

<div class = "form">
	<form:form action="${submitURL}" method="POST" modelAttribute="pothole">

		<label for="size">Size <span>*</span></label>
		<form:input path="size" required="required"/>
		

		<label for="description">Description</label>
		<form:input path="description" />
		
		<h3>Location</h3>
		
		<label for="latitude">Latitude <span>*</span></label>
		<form:input path="latitude" required="required"/>
		

		<label for="longitude">Longitude <span>*</span></label>
		<form:input path="longitude" required="required"/>

 		<h4>Address</h4>
		<label for="address.addressLine1">Address Line 1 <span>*</span></label>
		<form:input path="address.addressLine1" required="required"/>
		

		<label for="address.addressLine2">Address Line 2</label>
		<form:input path="address.addressLine2" />
		

		<label for="address.city">City *</label>
		<form:input path="address.city" required="required"/>
		

		<label for="address.zipCode">Zip Code *</label>

		<form:input path="address.zipCode" required="required"/>
		
		<input type="submit" value="Submit" />

	</form:form>

</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />