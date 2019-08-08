<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:import url="/WEB-INF/jsp/header.jsp" />

<h2 class="my-3 text-center">All Potholes</h2>
<div class="row card-columns">

	<c:forEach items="${potholes}" var="pothole">
		<div class="col-12 col-md-6 col-lg-4 card-col">
			<div class="card card-body">

				<ul class="list-group list-group-flush">
					<li class="list-group-item">
						<div class="card-text bold">Address:</div> <c:out
							value="${pothole.address.addressLine1}" />, <c:if
							test="${not empty pothole.address.addressLine2}">
							<c:out value="${pothole.address.addressLine2}" />
                    </c:if><br>
                    <c:out value="${pothole.address.city}" />, <c:out
							value="${pothole.address.state}" />, <c:out
							value="${pothole.address.zipCode}" />


						<div class="bold">Description:</div> <c:out
							value="${pothole.description}" />

						<div class="bold">Size:</div> <c:out value="${pothole.size}" />

						<div class="bold">Created On:</div> <c:out
							value="${pothole.createdOn}" />
						<div class="longlatBoxed">
							<div class="latHeaders "><span class="bold">Latitude:</span>
							<c:out value="${pothole.latitude}" /></div>
							<div class="longHeaders "><span class="bold">Longitude:</span>
							<c:out value="${pothole.longitude}" /></div>
						</div>
					</li>

				</ul>
				
				<!-- Edit button -->
				<button class="editButton" id="${pothole.id}">Edit</button>
				
				<!-- Hidden Menu -->
				<div id="hiddenMenu${pothole.id}" class="displayHidden">
					<p>Options</p>

					<c:url value="/update" var="updateURL"> 
					<c:param name="potholeId" value="${pothole.id}"></c:param>
					</c:url>

					<form:form action="${updateURL}" method="POST" modelAttribute="status">

						<div>
							<p>Reported on:</p>
							<c:choose>
								<c:when test="${empty pothole.status.reportedOn}">
									<form:input path="reportedOn" placeholder="DATE" />
								</c:when>
								<c:otherwise>
									<p>${pothole.status.reportedOn}</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<p>Inspected on:</p>
							<c:choose>
								<c:when test="${empty pothole.status.inspectedOn}">
									<form:input path="inspectedOn" placeholder="DATE" />
								</c:when>
								<c:otherwise>
									<p>${pothole.status.reportedOn}</p>
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<p>Repaired on:</p>
							<c:choose>
								<c:when test="${empty pothole.status.repairedOn}">
									<form:input path="repairedOn" placeholder="DATE" />
								</c:when>
								<c:otherwise>
									<p>${pothole.status.repairedOn}</p>
								</c:otherwise>
							</c:choose>
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
					
					<!-- Delete Button -->
					<form method="POST" action="/capstone/delete" accept-charset="UTF-8"
						style="display: inline" >
						<input type="hidden"  value = "${pothole.id}" name="potholeId"/>
						<button class="btn btn-xs btn-danger deleteButton" type="button"
							data-toggle="modal" data-target="#confirmDelete" data-title=""
							data-message="Are you sure you want to delete this pothole?">
							<i class="glyphicon glyphicon-trash"></i> Delete
						</button>
					</form>
				</div>

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
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
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