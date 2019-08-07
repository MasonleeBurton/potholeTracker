<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2 class="my-3 text-center">All Potholes</h2>
<div class="row card-columns">


	<c:forEach items="${potholes}" var="pothole">
		<div class="col-12 col-md-6 col-lg-4 card-col">
			<div class="card card-body">

				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="card-text bold">Address:</div> <c:out
							value="${pothole.address.addressLine1}" /> , 
							<c:if test="${not empty pothole.address.addressLine2}">
							<c:out value="${pothole.address.addressLine2}" />,
						</c:if> <c:out value="${pothole.address.city}" /> , <c:out
							value="${pothole.address.zipCode}" />

						<div class="bold">Description:</div> <c:out
							value="${pothole.description}" />

						<div class="bold">Size:</div> <c:out value="${pothole.size}" />

						<div class="bold">Created On:</div> <c:out
							value="${pothole.createdOn}" />

						<div class="bold">Latitude:</div> <c:out
							value="${pothole.latitude}" />
						<div class="bold">Longitude:</div> <c:out
							value="${pothole.longitude}" />
					</li>

				</ul>
			</div>
		</div>
	</c:forEach>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />