<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

<<<<<<< HEAD
<h2>Homepage</h2>

<div class="card" style="width: 18rem;">
	<div class="card-body">

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
=======
<h2 class="my-3 text-center">All Potholes</h2>
<div class="row card-columns">


	<c:forEach items="${potholes}" var="pothole">
		<div class="col-12 col-md-6 col-lg-4 card-col">
			<div class="card">
				<div class="card-body">
					<p class="card-text">
					<p class="bold">Address:</p>
					<c:out value="${pothole.address.addressLine1}" />
					,
					<c:if test="${not empty pothole.address.addressLine2}">
						<c:out value="${pothole.address.addressLine2}" />,
						</c:if>
					<c:out value="${pothole.address.city}" />
					,
					<c:out value="${pothole.address.zipCode}" />
				</div>
				<ul class="list-group list-group-flush">

					<li class="list-group-item"><p class="bold">Description:</p> <c:out
							value="${pothole.description}" /></li>

					<li class="list-group-item"><p class="bold">Size:</p> <c:out
							value="${pothole.size}" /></li>

					<li class="list-group-item"><p class="bold">Created On:</p> <c:out
							value="${pothole.createdOn}" /></li>
				</ul>

				<button class="editButton" id="${pothole.id}">Edit</button>

				<div id="hiddenMenu${pothole.id}" class="displayHidden">
					<p>Options</p>

					<c:url value="/update" var="updateURL" />

					<form:form action="#" method="POST">
						<div>
							<p>Reported on:</p>
							<input type="text" placeholder="DATE" />
						</div>
						<div>
							<p>Inspected on:</p>
							<input type="text" placeholder="DATE" />
						</div>
						<div>
							<p>Repaired on:</p>
							<input type="text" placeholder="DATE" />
						</div>
						<div>
							<p>Rank:</p>
							<select name="#">
								<option value="Low">Low</option>
								<option value="Medium">Medium</option>
								<option value="High">High</option>
								<option value="Immediate">Immediate</option>
							</select>
							<button type="submit">Submit</button>
						</div>
					</form:form>
				</div>

			</div>
		</div>
	</c:forEach>

>>>>>>> 07d23c0542023f6091b507f3ffe19298f3cc18ff
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />