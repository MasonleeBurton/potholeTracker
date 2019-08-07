<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>Submit Pothole</h2>

<div>

	<c:url value="/submit" var="submitURL" />

	<div class="form">
		<form:form action="${submitURL}" method="POST"
			modelAttribute="pothole">

			<div>
				
					<label for="size">What size is the pothole?</label>
				
				<form:radiobutton path="size" value="small" />
				Small (0-5 inches)
				<form:radiobutton path="size" value="medium" />
				Medium (6-10 inches)
				<form:radiobutton path="size" value="large" />
				Large (11+ inches)
			</div>

			<div>
				<label for="description">Description</label>
				<form:input path="description" />
			</div>
			
			<div>
			<h3>Location</h3>

		<div>
			<label for="latitude">Latitude <span>*</span></label>
			<form:input path="latitude" required="required" />


			<label for="longitude">Longitude <span>*</span></label>
			<form:input path="longitude" required="required" />
</div>
<div>
			<p>Address</p>
			<div>
			<label for="address.addressLine1">Address Line 1 <span>*</span></label>
			<form:input path="address.addressLine1" required="required" />
</div>
<div>
			<label for="address.addressLine2">Address Line 2</label>
			<form:input path="address.addressLine2" />
</div>
<div>
			<label for="address.city">City <span>*</span></label>
			<form:input path="address.city" required="required" />
</div>
<div>
			<label for="address.zipCode">Zip Code <span>*<span></label>

			<form:input path="address.zipCode" required="required" />
</div>
</div>
			<input type="submit" value="Submit" />
</div>
		</form:form>

	</div>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />