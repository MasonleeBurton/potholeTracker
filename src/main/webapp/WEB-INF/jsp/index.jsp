<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


<c:import url="/WEB-INF/jsp/header.jsp" />



<h2 class="my-3 text-center">All Potholes</h2>
<div class="card-columns">

	<c:forEach items="${potholes}" var="pothole">
		<div class="card">
			<div class="card-body">

				<fmt:parseDate value="${ pothole.status.reportedOn }"
					pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
				<fmt:formatDate pattern="MM/dd/yyyy" var="reported"
					value="${ parsedDateTime }" />

				<fmt:parseDate value="${ pothole.status.inspectedOn }"
					pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
				<fmt:formatDate pattern="MM/dd/yyyy" var="inspected"
					value="${ parsedDateTime }" />

				<fmt:parseDate value="${ pothole.status.repairedOn }"
					pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
				<fmt:formatDate pattern="MM/dd/yyyy" var="repaired"
					value="${ parsedDateTime }" />

				<fmt:parseDate value="${ pothole.createdOn }" pattern="yyyy-MM-dd"
					var="parsedDateTime" type="both" />
				<fmt:formatDate pattern="MM/dd/yyyy" var="created"
					value="${ parsedDateTime }" />

				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="potholeImg">
							<c:url var="imageURL" value="/image/${pothole.id}" />
							<c:url var="defaultURL" value="/img/default.jpg" />
							<object data="${imageURL}" type="image/jpeg">
								<img src="${defaultURL}">
							</object>
						</div>
						<div class="card-text bold">Address:</div> <c:out
							value="${pothole.address.addressLine1}" />, <c:if
							test="${not empty pothole.address.addressLine2}">
							<c:out value="${pothole.address.addressLine2}" />
						</c:if><br> <c:out value="${pothole.address.city}" />, <c:out
							value="${pothole.address.state}" />, <c:out
							value="${pothole.address.zipCode}" />


						<div class="bold">Description:</div> <c:out
							value="${pothole.description}" />

						<div><span class="bold">Size:</span> <c:out value="${pothole.size}" /> </div>

						<div ><span class="bold">Created On:</span> <c:out value="${created}" /> </div>
						<div class="longlatBoxed">
							<div class="latHeaders ">
								<span class="bold">Latitude:</span>
								<c:out value="${fn:substring(pothole.latitude, 0, 8)}" />
							</div>
							<div class="longHeaders ">
								<span class="bold">Longitude:</span>
								<c:out value="${fn:substring(pothole.longitude, 0, 8)}" />
							</div>
						</div> <c:if test="${not empty reported}">
							<div><span class="bold">Reported On:</span>
							<c:out value="${reported}" /></div>
						</c:if> <c:if test="${not empty inspected}">

							<div><span class="bold">Inspected On:</span>
							<c:out value="${inspected}" /></div>
						</c:if> <c:if test="${not empty repaired}">

							<div><span class="bold">Repaired On:</span>
							<c:out value="${repaired}" /></div>
						</c:if> <c:if test="${not empty pothole.status.rank}">

							<div><span class="bold">Severity:</span>
							<c:out value="${pothole.status.rank}" /></div>
						</c:if>
					</li>

				</ul>
				<c:if
					test='${not empty currentUser && currentUser.role == "employee"}'>
					<div class="right">
						<!-- Edit button -->
						<button class="editButton btn btn-success" id="${pothole.id}">Edit</button>
						<!-- Delete Button -->
						<c:url value="/delete" var="deleteURL" />
						<form method="POST" action="${deleteURL}" accept-charset="UTF-8"
							style="display: inline">
							<input type="hidden" value="${pothole.id}" name="potholeId" />
							<button class="btn btn-xs btn-danger deleteButton" type="button"
								data-toggle="modal" data-target="#confirmDelete" data-title=""
								data-message="Are you sure you want to delete this pothole?">
								<i class="glyphicon glyphicon-trash"></i> Delete
							</button>
						</form>
					</div>
					<!-- Hidden Menu -->
					<div id="hiddenMenu${pothole.id}"
						class="displayHidden hiddenStyling">

						<ul class="list-group list-group-flush">
							<li class="list-group-item"><c:url value="/update"
									var="updateURL">
									<c:param name="potholeId" value="${pothole.id}"></c:param>
								</c:url> <form:form action="${updateURL}" method="POST"
									modelAttribute="status">


									<div>
										<p>Reported on:</p>
										<form:input path="reportedOn" type="date"
											placeholder="MM/DD/YYYY"
											value="${ pothole.status.reportedOn }" />
									</div>

									<div>


										<%-- <fmt:parseDate value="${ pothole.status.inspectedOn }"
									pattern="yyyy-MM-dd" var="parsedDateTime" type="both" />
								<fmt:formatDate pattern="MM/dd/yyyy" var="inspected"
									value="${ parsedDateTime }" /> --%>

										<p>Inspected on:</p>

										<form:input path="inspectedOn" type="date"
											placeholder="MM/DD/YYYY"
											value="${ pothole.status.inspectedOn }" />
									</div>


									<div>
										<p>Repaired on:</p>
										<form:input path="repairedOn" type="date"
											placeholder="MM/DD/YYYY"
											value="${ pothole.status.repairedOn }" />
									</div>
									<div>
										<p>Rank:</p>
										<form:select path="rank">
											<option value="Low">Low</option>
											<option value="Medium">Medium</option>
											<option value="High">High</option>
											<option value="Immediate">Immediate</option>
										</form:select>
										<button class="btn btn-primary" type="submit">Submit</button>
									</div>
								</form:form></li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>

		<div class="modal fade" id="confirmDelete" role="dialog"
			aria-labelledby="confirmDeleteLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h4 class="modal-title">Delete Permanently</h4>
					</div>
					<div class="modal-body">
						<p>Are you sure about this?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-danger" id="confirm">Delete</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Dialog show event handler -->
		<script type="text/javascript">
  $('#confirmDelete').on('show.bs.modal', function (e) {
      $message = $(e.relatedTarget).attr('data-message');
      $(this).find('.modal-body p').text($message);
      $title = $(e.relatedTarget).attr('data-title');
      $(this).find('.modal-title').text($title);
 
      // Pass form reference to modal for submission on yes/ok
      var form = $(e.relatedTarget).closest('form');
      $(this).find('.modal-footer #confirm').data('form', form);
  });
 
  <!-- Form confirm (yes/ok) handler, submits form -->
  $('#confirmDelete').find('.modal-footer #confirm').on('click', function(){
      $(this).data('form').submit();
  });
</script>

	</c:forEach>
</div>

<c:import url="/WEB-INF/jsp/footer.jsp" />