<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<c:url value="/submit" var="submitURL" />
<h2 class="my-3 text-center">Submit Pothole</h2>
<div class="form">
	

	<form:form action="${submitURL}" method="POST" modelAttribute="pothole"
		autocomplete="off" enctype="multipart/form-data">


		<div class="form-element">

			<p>
				<label for="size">What size is the pothole? <span>*</span>
				</label>
			</p>


			<div id=radioBlock>
				<label> <form:radiobutton path="size" value="Small"
						cssClass="radio" checked="checked" /> Small (0-5 inches)
				</label>
			</div>

			<div id=radioBlock>
				<label> <form:radiobutton path="size" value="Medium"
						cssClass="radio" /> Medium (6-10 inches)
				</label>
			</div>

			<div id=radioBlock>
				<label> <form:radiobutton path="size" value="Large"
						cssClass="radio" /> Large (11+ inches)
				</label>
			</div>
		</div>

		<div class="form-element">

			<p>
				<label class="form-label" for="description">Please describe the location of the pothole</label>
			</p>
			<div>
				<form:textarea class="textarea" path="description" rows="5" />
			</div>
		</div>

		<div class="form-element">
			<p>
				<label for="latitude">Latitude <span>*</span></label>
			</p>
			<form:input path="latitude" required="required" autocomplete="off" />
		</div>

		<div class="form-element">

			<p>
				<label class="form-label" for="longitude">Longitude <span>*</span></label>
			</p>
			<form:input path="longitude" required="required" autocomplete="off" />
		</div>

		<div class="form-element">

			<p>
				<label class="form-label" for="address.addressLine1">Address
					Line 1 <span>*</span>
				</label>
			</p>
			<form:input path="address.addressLine1" required="required"
				autocomplete="off" />
		</div>
		<div class="form-element">

			<p>
				<label class="form-label" for="address.addressLine2">Address
					Line 2</label>
			</p>
			<form:input path="address.addressLine2" autocomplete="off" />
		</div>
		<div class="form-element">

			<p>
				<label class="form-label" for="address.city">City <span>*</span></label>
			</p>
			<form:input path="address.city" required="required"
				autocomplete="off" />
		</div>

		<div class="form-element">
			<p>
				<label class="form-label" for="address.state">State <span>*</span></label>
			</p>
			<form:select class="state-list form-control" path="address.state"
				required="true">
				<c:forEach var="state" items="${states}">
					<form:option value="${state}" class="text-center">
						<c:out value="${state}" />
					</form:option>
				</c:forEach>
			</form:select>
		</div>

		<div class="form-element">

			<p>
				<label class="form-label" for="address.zipCode">Zip Code <span>*</span></label>
			</p>

			<form:input type="number" id="zipCode" path="address.zipCode"
				required="required" autocomplete="off" min="0" />

		</div>
		
		<div class="form-element">

			<p>
				<label class="form-label" for="file">Upload Picture of Pothole</label>
			</p>

			<input type="file" name="file" >

		</div>

		<input class="btn btn-primary" id="submit" type="submit"
			value="Submit" />

	</form:form>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />