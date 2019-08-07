<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2>Homepage</h2>
<div class="row card-columns">


	<c:forEach items="${potholes}" var="pothole">
		<div class="col-12 col-md-6 col-lg-4">
			<div class="card">
				<div class="card-body">
					<p class="card-text">
					<p class="bold">Description:</p>
					<c:out value="${pothole.description}" />
					</p>
				</div>
				<ul class="list-group list-group-flush">

					<li class="list-group-item"><p class="bold">Address:</p> <c:out
							value="${pothole.address.addressLine1}" />, <c:if
							test="${not empty pothole.address.addressLine2}">
							 <c:out value="${pothole.address.addressLine2}" />,
						</c:if>
						 <c:out value="${pothole.address.city}" />, 
						 <c:out value="${pothole.address.zipCode}" /></li>

 					<li class="list-group-item"><p class="bold">ZipCode:</p> <c:out
							value="${pothole.address.zipCode}" /></li>


					<li class="list-group-item"><p class="bold">City:</p> <c:out
							value="${pothole.address.city}" /></li>

					<li class="list-group-item"><p class="bold">Size:</p> <c:out
							value="${pothole.size}" /></li>

					<li class="list-group-item"><p class="bold">Created On:</p> <c:out
							value="${pothole.createdOn}" /></li>
				</ul>
			</div>
		</div>

		<%-- 
		Address:
		<c:out value="${pothole.address.addressLine1}" />


		Address Line 2:
		<c:out value="${pothole.address.addressLine2}" />
	
	
		ZipCode:
		<c:out value="${pothole.address.zipCode}" />
		
		City:
		<c:out value="${pothole.address.city}" />
		
		 Size:
		<c:out value="${pothole.size}" />

		Description:
		<c:out value="${pothole.description}" />

		Created On:
		<c:out value="${pothole.createdOn}" />
 --%>

	</c:forEach>

</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />